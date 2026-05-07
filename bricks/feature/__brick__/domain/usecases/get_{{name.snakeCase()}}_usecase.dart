import 'package:injectable/injectable.dart';
import 'package:base_flutter_2/core/utils/result.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

@injectable
class Get{{name.pascalCase()}}UseCase {
  Get{{name.pascalCase()}}UseCase(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  Future<Result<{{name.pascalCase()}}Entity>> call() async {
    return _repository.get{{name.pascalCase()}}();
  }
}
