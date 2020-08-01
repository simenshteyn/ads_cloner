import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ads_layout_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdsLayoutList {
  @JsonKey(name: 'response')
  List<AdLayout> adsLayout;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  AdsLayoutList(this.adsLayout, this.errorResponse);
  factory AdsLayoutList.fromJson(Map<String, dynamic> json) =>
      _$AdsLayoutListFromJson(json);
  Map<String, dynamic> toJson() => _$AdsLayoutListToJson(this);
}
