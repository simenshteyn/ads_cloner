import 'package:json_annotation/json_annotation.dart';
part 'ad.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Ad {
  int campaignId,
      status,
      goalType,
      costType,
      adFormat,
      impressionsLimit,
      adPlatformNoAdNetwork;
  String id,
      approved,
      createTime,
      updateTime,
      dayLimit,
      allLimit,
      startTime,
      stopTime,
      category1Id;
  String category2Id, ageRestriction, name, adPlatform, cpc, cpm;
  int ocpm;
  int impressionsLimited, adPlatformNoWall, autobidding;
  String autobiddingMaxCost;
  int video, disclaimerMedical, disclaimerSpecialist, disclaimerSupplements;
  List weeklyScheduleHours;
  int weeklyScheduleUseHolidays;
  Map<String, List<int>> eventsRetargetingGroups;

  Ad(
    this.campaignId,
    this.status,
    this.goalType,
    this.costType,
    this.adFormat,
    this.impressionsLimit,
    this.adPlatformNoAdNetwork,
    this.id,
    this.approved,
    this.createTime,
    this.updateTime,
    this.dayLimit,
    this.allLimit,
    this.startTime,
    this.stopTime,
    this.category1Id,
    this.category2Id,
    this.ageRestriction,
    this.name,
    this.adPlatform,
    this.cpc,
    this.ocpm,
    this.cpm,
    this.impressionsLimited,
    this.adPlatformNoWall,
    this.autobidding,
    this.autobiddingMaxCost,
    this.video,
    this.disclaimerMedical,
    this.disclaimerSpecialist,
    this.disclaimerSupplements,
    this.weeklyScheduleHours,
    this.weeklyScheduleUseHolidays,
    this.eventsRetargetingGroups,
  );

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
  Map<String, dynamic> toJson() => _$AdToJson(this);
}
