import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../models/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Mapper {
  static {{name.pascalCase()}}Entity toEntity({{name.pascalCase()}}Model model) {
    return {{name.pascalCase()}}Entity(
      id: model.id,
    );
  }

  static {{name.pascalCase()}}Model toModel({{name.pascalCase()}}Entity entity) {
    return {{name.pascalCase()}}Model(
      id: entity.id,
    );
  }
}
