import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio dio(AuthInterceptor authInterceptor) {
    final options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    return Dio(options)
      ..interceptors.addAll([
        authInterceptor,
        LoggingInterceptor(),
      ]);
  }
}
