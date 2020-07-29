import 'package:json_annotation/json_annotation.dart';
part 'create_ad_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateAdResult {
  int id, errorCode;
  String errorDesc;
  CreateAdResult(this.id, this.errorCode, this.errorDesc);
  factory CreateAdResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAdResultFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAdResultToJson(this);
}
