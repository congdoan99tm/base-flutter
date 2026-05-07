import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser();
}

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<UserModel> getUser() async {
    // Replace with your actual endpoint
    final response = await _dio.get('/user');
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }
}
