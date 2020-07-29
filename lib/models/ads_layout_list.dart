import 'package:ads_cloner/models/ad_layout.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ads_layout_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdsLayoutList {
  @JsonKey(name: 'response')
  List<AdLayout> adsLayout;
  AdsLayoutList(this.adsLayout);
  factory AdsLayoutList.fromJson(Map<String, dynamic> json) =>
      _$AdsLayoutListFromJson(json);
  Map<String, dynamic> toJson() => _$AdsLayoutListToJson(this);
}
