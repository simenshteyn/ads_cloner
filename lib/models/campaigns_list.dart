import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:SmmHub/models/campaign.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campaigns_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CampaignsList {
  @JsonKey(name: 'response')
  List<Campaign> campaigns;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  CampaignsList(this.campaigns, this.errorResponse);
  factory CampaignsList.fromJson(Map<String, dynamic> json) =>
      _$CampaignsListFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignsListToJson(this);
}
