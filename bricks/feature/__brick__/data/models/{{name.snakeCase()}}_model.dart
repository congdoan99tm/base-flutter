import 'package:json_annotation/json_annotation.dart';

part '{{name.snakeCase()}}_model.g.dart';

@JsonSerializable()
class {{name.pascalCase()}}Model {
  const {{name.pascalCase()}}Model({
    required this.id,
  });

  final int id;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ModelToJson(this);
}
