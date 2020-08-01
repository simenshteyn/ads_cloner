import 'package:json_annotation/json_annotation.dart';

part 'pretty_card_create_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PrettyCardCreateResultObject {
  int ownerId;
  String cardId;
  PrettyCardCreateResultObject(this.ownerId, this.cardId);
  factory PrettyCardCreateResultObject.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardCreateResultObjectFromJson(json);
  Map<String, dynamic> toJson() => _$PrettyCardCreateResultObjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PrettyCardCreateResult {
  @JsonKey(name: 'response')
  PrettyCardCreateResultObject result;
  PrettyCardCreateResult(this.result);
  factory PrettyCardCreateResult.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardCreateResultFromJson(json);
  Map<String, dynamic> toJson() => _$PrettyCardCreateResultToJson(this);
}
