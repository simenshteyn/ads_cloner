import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:SmmHub/models/ad_targeting.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ads_targeting_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdsTargetingList {
  @JsonKey(name: 'response')
  List<AdTargeting> adsTargeting;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  AdsTargetingList(this.adsTargeting, this.errorResponse);

  factory AdsTargetingList.fromJson(Map<String, dynamic> json) =>
      _$AdsTargetingListFromJson(json);
  Map<String, dynamic> toJson() => _$AdsTargetingListToJson(this);
}
