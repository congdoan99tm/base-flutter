import 'dart:async';

import 'package:dio/dio.dart';

import '../constant/env.dart';
import 'export.dart';

class DioRequest {
  late Dio _dio;

  DioRequest() {
    _dio = Dio(BaseOptions(
      baseUrl: ENV.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      contentType: 'application/json',
    ))
      ..interceptors.addAll([
        ResponseInterceptor(),
      ]);
  }

  void setToken(String token) {
    _dio.options.headers = {'X-Auth-Token': token};
  }

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post({
    required String url,
    data,
    Map<String, dynamic>? header,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: header ?? _dio.options.headers),
      );
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> put({
    required String url,
    data,
  }) async {
    try {
      final response = await _dio.put(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> patch({
    required String url,
    data,
  }) async {
    try {
      final response = await _dio.patch(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.delete(url, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  void _handleError(DioException e) {
    final Map<String, dynamic>? res = e.response?.data;
    final String path = e.requestOptions.path;
    if (res == null) throw CustomDioError('Response is Nil', code: 500);
    switch (path) {
      default:
    }
    throw res;
  }
}
