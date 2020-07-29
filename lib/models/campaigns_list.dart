import 'package:ads_cloner/models/campaign.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campaigns_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CampaignsList {
  @JsonKey(name: 'response')
  List<Campaign> campaigns;
  CampaignsList(this.campaigns);
  factory CampaignsList.fromJson(Map<String, dynamic> json) =>
      _$CampaignsListFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignsListToJson(this);
}
