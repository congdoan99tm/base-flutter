import 'package:base_flutter_2/core/utils/result.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Result<{{name.pascalCase()}}Entity>> get{{name.pascalCase()}}();
}
