import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_campaigns_result_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateCampaignsResultList {
  @JsonKey(name: 'response')
  List<CreateCampaignResult> createCampaignsResultList;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  CreateCampaignsResultList(
      [this.createCampaignsResultList, this.errorResponse]);

  factory CreateCampaignsResultList.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignsResultListFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCampaignsResultListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CreateCampaignResult {
  int id, errorCode;
  String errorDesc;
  CreateCampaignResult(this.id, this.errorCode, this.errorDesc);
  factory CreateCampaignResult.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignResultFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCampaignResultToJson(this);
}
