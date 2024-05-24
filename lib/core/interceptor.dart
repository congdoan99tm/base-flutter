import 'package:dio/dio.dart';


class ResponseInterceptor extends InterceptorsWrapper {
  ResponseInterceptor();
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    switch (err.type) {
      case DioExceptionType.badResponse:
        break;
      default:
    }

    err.response?.data['statusCode'] = err.response?.statusCode;
    return handler.next(err);
  }
}
