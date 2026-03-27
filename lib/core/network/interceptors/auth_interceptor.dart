import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../constants/app_constants.dart';
import '../token_storage.dart';

/// Handles automatic token injection and refresh logic.
///
/// Flow:
/// 1. Attach [accessToken] to every request via `Authorization` header.
/// 2. On 401 → start refresh (once). All other 401s while refreshing are
///    **queued** instead of failing immediately.
/// 3. On refresh success → retry the original request AND all queued requests
///    with the new token.
/// 4. On refresh failure → clear tokens and reject all queued requests.
@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storage);

  final TokenStorage _storage;

  bool _isRefreshing = false;

  /// Requests that arrived while a refresh was already in-flight.
  final List<_PendingRequest> _queue = [];

  // ── Request ─────────────────────────────────────────────────────────────────

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  // ── Error / 401 handling ────────────────────────────────────────────────────

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // A refresh is already running → queue this request and return.
    // It will be resolved/rejected once the in-flight refresh completes.
    if (_isRefreshing) {
      _queue.add(_PendingRequest(options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      final newToken = await _refreshToken();
      await _storage.saveAccessToken(newToken);

      // 1. Retry the request that triggered the refresh.
      final retryResponse = await _retry(err.requestOptions, newToken);
      handler.resolve(retryResponse);

      // 2. Retry every request that was queued during the refresh.
      await _resolveQueue(newToken);
    } catch (e) {
      debugPrint('[AuthInterceptor] Refresh failed — clearing session: $e');
      await _storage.clearTokens();

      // Fail the triggering request.
      handler.next(err);

      // Fail every queued request with the same error.
      _rejectQueue(err);
    } finally {
      _isRefreshing = false;
    }
  }

  // ── Queue helpers ────────────────────────────────────────────────────────────

  /// Retry all queued requests with [newToken] and resolve their handlers.
  Future<void> _resolveQueue(String newToken) async {
    final pending = List<_PendingRequest>.from(_queue);
    _queue.clear();

    for (final req in pending) {
      try {
        final response = await _retry(req.options, newToken);
        req.handler.resolve(response);
      } catch (e) {
        req.handler.next(
          DioException(requestOptions: req.options, error: e),
        );
      }
    }
  }

  /// Reject all queued requests with [originalError].
  void _rejectQueue(DioException originalError) {
    final pending = List<_PendingRequest>.from(_queue);
    _queue.clear();

    for (final req in pending) {
      req.handler.next(
        DioException(
          requestOptions: req.options,
          error: originalError.error,
          response: originalError.response,
          type: originalError.type,
        ),
      );
    }
  }

  // ── Network helpers ──────────────────────────────────────────────────────────

  Future<String> _refreshToken() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) throw Exception('No refresh token available');

    // Use a clean Dio instance (no interceptors) to avoid recursive 401 loops.
    final dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
    final response = await dio.post(
      AppConstants.refreshTokenEndpoint,
      data: {'refresh_token': refreshToken},
    );

    final newAccessToken = response.data['access_token'] as String?;
    if (newAccessToken == null) throw Exception('Invalid refresh response');
    return newAccessToken;
  }

  Future<Response<dynamic>> _retry(
    RequestOptions requestOptions,
    String accessToken,
  ) {
    // Use a clean Dio instance to avoid passing through interceptors again.
    final dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: {
          ...requestOptions.headers,
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
  }
}

// ── Internal model ─────────────────────────────────────────────────────────────

class _PendingRequest {
  const _PendingRequest({
    required this.options,
    required this.handler,
  });

  final RequestOptions options;
  final ErrorInterceptorHandler handler;
}
