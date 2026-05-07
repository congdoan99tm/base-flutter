import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import 'package:base_flutter_2/core/repositories/base_repository.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/{{name.snakeCase()}}_remote_datasource.dart';
import '../mappers/{{name.snakeCase()}}_mapper.dart';

@Injectable(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl extends BaseRepository implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(this._remoteDataSource);

  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;

  @override
  Future<Result<{{name.pascalCase()}}Entity>> get{{name.pascalCase()}}() async {
    return safeCall(() async {
      final model = await _remoteDataSource.get{{name.pascalCase()}}();
      return {{name.pascalCase()}}Mapper.toEntity(model);
    });
  }
}
