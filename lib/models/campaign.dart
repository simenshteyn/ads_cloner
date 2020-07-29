import 'package:json_annotation/json_annotation.dart';
part 'campaign.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Campaign {
  int id, status;
  String type,
      name,
      dayLimit,
      allLimit,
      startTime,
      stopTime,
      createTime,
      updateTime;

  Campaign(
    this.id,
    this.status,
    this.type,
    this.name,
    this.dayLimit,
    this.allLimit,
    this.startTime,
    this.stopTime,
    this.createTime,
    this.updateTime,
  );

  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignToJson(this);
}
