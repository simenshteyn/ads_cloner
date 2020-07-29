import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ads_targeting_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdsTargetingList {
  @JsonKey(name: 'response')
  List<AdTargeting> adsTargeting;
  AdsTargetingList(this.adsTargeting);

  factory AdsTargetingList.fromJson(Map<String, dynamic> json) =>
      _$AdsTargetingListFromJson(json);
  Map<String, dynamic> toJson() => _$AdsTargetingListToJson(this);
}
