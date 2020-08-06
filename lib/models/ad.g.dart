// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) {
  return Ad(
    json['campaign_id'] as int,
    json['status'] as int,
    json['goal_type'] as int,
    json['cost_type'] as int,
    json['ad_format'] as int,
    json['impressions_limit'] as int,
    json['ad_platform_no_ad_network'] as int,
    json['id'] as String,
    json['approved'] as String,
    json['create_time'] as String,
    json['update_time'] as String,
    json['day_limit'] as String,
    json['all_limit'] as String,
    json['start_time'] as String,
    json['stop_time'] as String,
    json['category1_id'] as String,
    json['category2_id'] as String,
    json['age_restriction'] as String,
    json['name'] as String,
    json['ad_platform'],
    json['cpc'] as String,
    json['ocpm'] as String,
    json['cpm'] as String,
    json['impressions_limited'] as int,
    json['ad_platform_no_wall'] as int,
    json['autobidding'] as int,
    json['autobidding_max_cost'] as String,
    json['video'] as int,
    json['disclaimer_medical'] as int,
    json['disclaimer_specialist'] as int,
    json['disclaimer_supplements'] as int,
    json['weekly_schedule_hours'] as List,
    json['weekly_schedule_use_holidays'] as int,
    (json['events_retargeting_groups'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as int)?.toList()),
    ),
  );
}

Map<String, dynamic> _$AdToJson(Ad instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaign_id', instance.campaignId);
  writeNotNull('status', instance.status);
  writeNotNull('goal_type', instance.goalType);
  writeNotNull('cost_type', instance.costType);
  writeNotNull('ad_format', instance.adFormat);
  writeNotNull('impressions_limit', instance.impressionsLimit);
  writeNotNull('ad_platform_no_ad_network', instance.adPlatformNoAdNetwork);
  writeNotNull('id', instance.id);
  writeNotNull('approved', instance.approved);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('day_limit', instance.dayLimit);
  writeNotNull('all_limit', instance.allLimit);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('stop_time', instance.stopTime);
  writeNotNull('category1_id', instance.category1Id);
  writeNotNull('category2_id', instance.category2Id);
  writeNotNull('age_restriction', instance.ageRestriction);
  writeNotNull('name', instance.name);
  writeNotNull('cpc', instance.cpc);
  writeNotNull('cpm', instance.cpm);
  writeNotNull('ocpm', instance.ocpm);
  writeNotNull('ad_platform', instance.adPlatform);
  writeNotNull('impressions_limited', instance.impressionsLimited);
  writeNotNull('ad_platform_no_wall', instance.adPlatformNoWall);
  writeNotNull('autobidding', instance.autobidding);
  writeNotNull('autobidding_max_cost', instance.autobiddingMaxCost);
  writeNotNull('video', instance.video);
  writeNotNull('disclaimer_medical', instance.disclaimerMedical);
  writeNotNull('disclaimer_specialist', instance.disclaimerSpecialist);
  writeNotNull('disclaimer_supplements', instance.disclaimerSupplements);
  writeNotNull('weekly_schedule_hours', instance.weeklyScheduleHours);
  writeNotNull(
      'weekly_schedule_use_holidays', instance.weeklyScheduleUseHolidays);
  writeNotNull('events_retargeting_groups', instance.eventsRetargetingGroups);
  return val;
}
