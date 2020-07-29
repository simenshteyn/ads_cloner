import 'package:json_annotation/json_annotation.dart';
part 'ad_targeting.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdTargeting {
  String sex, ageFrom, ageTo, birthday, country, cities, citiesNot;
  String geoNear, geoPointType, statuses, groups, groupsNot, groupsActive;
  String apps, appsNot, districts, stations, streets, schools, positions;
  String religions, interestCategories, interests, userDevices, userOs;
  String userBrowsers, retargetingGroups, retargetingGroupsNot;
  String eventsRetargetingGroups, paying, travellers, schoolFrom;
  String schoolTo, uniFrom, uniTo;
  String count, campaignId, id; //not targeting, but still exists.
  // More field information here: https://vk.com/dev/ads_targeting

  AdTargeting(
    this.sex,
    this.ageFrom,
    this.ageTo,
    this.birthday,
    this.country,
    this.cities,
    this.citiesNot,
    this.geoNear,
    this.geoPointType,
    this.statuses,
    this.groups,
    this.groupsNot,
    this.groupsActive,
    this.apps,
    this.appsNot,
    this.districts,
    this.stations,
    this.streets,
    this.schools,
    this.positions,
    this.religions,
    this.interestCategories,
    this.interests,
    this.userDevices,
    this.userOs,
    this.userBrowsers,
    this.retargetingGroups,
    this.retargetingGroupsNot,
    this.eventsRetargetingGroups,
    this.paying,
    this.travellers,
    this.schoolFrom,
    this.schoolTo,
    this.uniFrom,
    this.uniTo,
    this.count,
    this.campaignId,
    this.id,
  );

  factory AdTargeting.fromJson(Map<String, dynamic> json) => _$AdTargetingFromJson(json);
  Map<String, dynamic> toJson() => _$AdTargetingToJson(this);
}