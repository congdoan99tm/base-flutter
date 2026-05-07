import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}();
}

@Injectable(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  {{name.pascalCase()}}RemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}() async {
    final response = await _dio.get('/{{name.snakeCase()}}');
    return {{name.pascalCase()}}Model.fromJson(response.data as Map<String, dynamic>);
  }
}
