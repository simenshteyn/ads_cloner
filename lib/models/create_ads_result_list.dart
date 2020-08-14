import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:SmmHub/models/create_ad_result.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_ads_result_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateAdsResultList {
  @JsonKey(name: 'response')
  List<CreateAdResult> createAdsResultList;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  CreateAdsResultList([this.createAdsResultList, this.errorResponse]);

  factory CreateAdsResultList.fromJson(Map<String, dynamic> json) =>
      _$CreateAdsResultListFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAdsResultListToJson(this);
  void appendList(CreateAdsResultList list) {
    if (this.createAdsResultList == null) {
      print('this createadsresultlist is null');
      createAdsResultList = [];
    }
    this.createAdsResultList.addAll(list.createAdsResultList);
  }
}
