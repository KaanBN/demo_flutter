import 'package:galleria/domain/entities/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);

  /// Converts `SourceModel` to `Source` Entity
  Source toEntity() {
    return Source(
      id: id,
      name: name,
    );
  }
}