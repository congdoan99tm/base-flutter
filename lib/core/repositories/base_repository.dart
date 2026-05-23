import 'package:dio/dio.dart';
import 'package:base_flutter_2/core/error/failures.dart';
import 'package:base_flutter_2/core/result/result.dart';

abstract class BaseRepository {
  Future<Result<T, Failure>> safeCall<T>(Future<T> Function() call) async {
    try {
      final response = await call();
      return Success(response);
    } on DioException catch (e) {
      return Error(_handleDioException(e));
    } catch (e) {
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    String message = "Đã có lỗi xảy ra";

    if (e.response != null) {
      final data = e.response?.data;
      if (data is Map && data.containsKey('message')) {
        message = data['message'];
      } else {
        message = _mapStatusCodeToMessage(e.response?.statusCode);
      }
      return ServerFailure(
        message: message,
        statusCode: e.response?.statusCode,
      );
    }

    return UnknownFailure(message: e.message ?? "Lỗi kết nối");
  }

  String _mapStatusCodeToMessage(int? statusCode) {
    return switch (statusCode) {
      400 => "Yêu cầu không hợp lệ",
      401 => "Phiên làm việc hết hạn",
      403 => "Không có quyền truy cập",
      404 => "Không tìm thấy dữ liệu",
      500 => "Lỗi server hệ thống",
      _ => "Lỗi kết nối server ($statusCode)",
    };
  }
}
