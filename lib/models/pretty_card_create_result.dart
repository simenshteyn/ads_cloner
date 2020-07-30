import 'package:json_annotation/json_annotation.dart';

part 'pretty_card_create_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PrettyCardCreateResult {
  int ownerId, cardId;
  PrettyCardCreateResult(this.ownerId, this.cardId);
  factory PrettyCardCreateResult.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardCreateResultFromJson(json);
  Map<String, dynamic> toJson() => _$PrettyCardCreateResultToJson(this);
}
