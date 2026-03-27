import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

/// A sample data model (DTO) used for serialising/deserialising API responses.
/// Generated code: run `flutter pub run build_runner build --delete-conflicting-outputs`
@JsonSerializable()
class SampleModel {
  const SampleModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}
