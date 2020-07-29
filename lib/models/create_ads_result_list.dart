import 'package:ads_cloner/models/create_ad_result.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_ads_result_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateAdsResultList {
  @JsonKey(name: 'response')
  List<CreateAdResult> createAdsResultList;
  CreateAdsResultList(this.createAdsResultList);
  factory CreateAdsResultList.fromJson(Map<String, dynamic> json) =>
      _$CreateAdsResultListFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAdsResultListToJson(this);
}
