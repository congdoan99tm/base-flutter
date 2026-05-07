import '../../domain/entities/{{name.snakeCase()}}_entity.dart';

enum {{name.pascalCase()}}Status { initial, loading, success, failure }

class {{name.pascalCase()}}State {
  const {{name.pascalCase()}}State({
    this.status = {{name.pascalCase()}}Status.initial,
    this.{{name.camelCase()}},
    this.errorMessage,
  });

  final {{name.pascalCase()}}Status status;
  final {{name.pascalCase()}}Entity? {{name.camelCase()}};
  final String? errorMessage;

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}Status? status,
    {{name.pascalCase()}}Entity? {{name.camelCase()}},
    String? errorMessage,
  }) {
    return {{name.pascalCase()}}State(
      status: status ?? this.status,
      {{name.camelCase()}}: {{name.camelCase()}} ?? this.{{name.camelCase()}},
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
