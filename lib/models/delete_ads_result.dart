import 'package:json_annotation/json_annotation.dart';

part 'delete_ads_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class DeleteAdsResult {
  @JsonKey(name: 'response')
  List<int> result;
  DeleteAdsResult(this.result);
  factory DeleteAdsResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteAdsResultFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteAdsResultToJson(this);
}
