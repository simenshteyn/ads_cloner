// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_targeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdTargeting _$AdTargetingFromJson(Map<String, dynamic> json) {
  return AdTargeting(
    json['sex'] as String,
    json['age_from'] as String,
    json['age_to'] as String,
    json['birthday'] as String,
    json['country'] as String,
    json['cities'] as String,
    json['cities_not'] as String,
    json['geo_near'] as String,
    json['geo_point_type'] as String,
    json['statuses'] as String,
    json['groups'] as String,
    json['groups_not'] as String,
    json['groups_active'] as String,
    json['apps'] as String,
    json['apps_not'] as String,
    json['districts'] as String,
    json['stations'] as String,
    json['streets'] as String,
    json['schools'] as String,
    json['positions'] as String,
    json['religions'] as String,
    json['interest_categories'] as String,
    json['interests'] as String,
    json['user_devices'] as String,
    json['user_os'] as String,
    json['user_browsers'] as String,
    json['retargeting_groups'] as String,
    json['retargeting_groups_not'] as String,
    json['groups_recommended'] as String,
    json['groups_formula'] as String,
    json['paying'] as String,
    json['travellers'] as String,
    json['school_from'] as String,
    json['school_to'] as String,
    json['uni_from'] as String,
    json['uni_to'] as String,
    json['count'] as String,
    json['campaign_id'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$AdTargetingToJson(AdTargeting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sex', instance.sex);
  writeNotNull('age_from', instance.ageFrom);
  writeNotNull('age_to', instance.ageTo);
  writeNotNull('birthday', instance.birthday);
  writeNotNull('country', instance.country);
  writeNotNull('cities', instance.cities);
  writeNotNull('cities_not', instance.citiesNot);
  writeNotNull('geo_near', instance.geoNear);
  writeNotNull('geo_point_type', instance.geoPointType);
  writeNotNull('statuses', instance.statuses);
  writeNotNull('groups', instance.groups);
  writeNotNull('groups_not', instance.groupsNot);
  writeNotNull('groups_active', instance.groupsActive);
  writeNotNull('apps', instance.apps);
  writeNotNull('apps_not', instance.appsNot);
  writeNotNull('districts', instance.districts);
  writeNotNull('stations', instance.stations);
  writeNotNull('streets', instance.streets);
  writeNotNull('schools', instance.schools);
  writeNotNull('positions', instance.positions);
  writeNotNull('religions', instance.religions);
  writeNotNull('interest_categories', instance.interestCategories);
  writeNotNull('interests', instance.interests);
  writeNotNull('user_devices', instance.userDevices);
  writeNotNull('user_os', instance.userOs);
  writeNotNull('user_browsers', instance.userBrowsers);
  writeNotNull('retargeting_groups', instance.retargetingGroups);
  writeNotNull('retargeting_groups_not', instance.retargetingGroupsNot);
  writeNotNull('groups_recommended', instance.groupsRecommended);
  writeNotNull('groups_formula', instance.groupsFormula);
  writeNotNull('paying', instance.paying);
  writeNotNull('travellers', instance.travellers);
  writeNotNull('school_from', instance.schoolFrom);
  writeNotNull('school_to', instance.schoolTo);
  writeNotNull('uni_from', instance.uniFrom);
  writeNotNull('uni_to', instance.uniTo);
  writeNotNull('count', instance.count);
  writeNotNull('campaign_id', instance.campaignId);
  writeNotNull('id', instance.id);
  return val;
}
