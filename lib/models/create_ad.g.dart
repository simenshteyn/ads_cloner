// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAd _$CreateAdFromJson(Map<String, dynamic> json) {
  return CreateAd(
    campaignId: json['campaign_id'] as int,
    adFormat: json['ad_format'] as int,
    autobidding: json['autobidding'] as int,
    costType: json['cost_type'] as int,
    goalType: json['goal_type'] as int,
    impressionsLimit: json['impressions_limit'] as int,
    impressionsLimited: json['impressions_limited'] as int,
    adPlatformNoWall: json['ad_platform_no_wall'] as int,
    adPlatformNoAdNetwork: json['ad_platform_no_ad_network'] as int,
    dayLimit: json['day_limit'] as int,
    allLimit: json['all_limit'] as int,
    category1Id: json['category1_id'] as int,
    category2Id: json['category2_id'] as int,
    ageRestriction: json['age_restriction'] as int,
    status: json['status'] as int,
    repeatVideo: json['repeat_video'] as int,
    disclaimerMedical: json['disclaimer_medical'] as int,
    disclaimerSpecialist: json['disclaimer_specialist'] as int,
    disclaimerSupplements: json['disclaimer_supplements'] as int,
    weeklyScheduleUseHolidays: json['weekly_schedule_use_holidays'] as int,
    adPlatform: json['ad_platform'] as String,
    name: json['name'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    linkUrl: json['link_url'] as String,
    linkDomain: json['link_domain'] as String,
    linkTitle: json['link_title'] as String,
    linkButton: json['link_button'] as String,
    photo: json['photo'] as String,
    photoIcon: json['photo_icon'] as String,
    video: json['video'] as String,
    statsUrl: json['stats_url'] as String,
    statsUrl2: json['stats_url2'] as String,
    cpc: (json['cpc'] as num)?.toDouble(),
    cpm: (json['cpm'] as num)?.toDouble(),
    ocpm: (json['ocpm'] as num)?.toDouble(),
    weeklyScheduleHours: json['weekly_schedule_hours'] as List,
    eventsRetargetingGroups:
        (json['events_retargeting_groups'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as int)?.toList()),
    ),
    targeting: json['targeting'] == null
        ? null
        : AdTargeting.fromJson(json['targeting'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateAdToJson(CreateAd instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaign_id', instance.campaignId);
  writeNotNull('ad_format', instance.adFormat);
  writeNotNull('autobidding', instance.autobidding);
  writeNotNull('cost_type', instance.costType);
  writeNotNull('goal_type', instance.goalType);
  writeNotNull('impressions_limit', instance.impressionsLimit);
  writeNotNull('impressions_limited', instance.impressionsLimited);
  writeNotNull('ad_platform_no_wall', instance.adPlatformNoWall);
  writeNotNull('ad_platform_no_ad_network', instance.adPlatformNoAdNetwork);
  writeNotNull('day_limit', instance.dayLimit);
  writeNotNull('all_limit', instance.allLimit);
  writeNotNull('category1_id', instance.category1Id);
  writeNotNull('category2_id', instance.category2Id);
  writeNotNull('age_restriction', instance.ageRestriction);
  writeNotNull('status', instance.status);
  writeNotNull('repeat_video', instance.repeatVideo);
  writeNotNull('disclaimer_medical', instance.disclaimerMedical);
  writeNotNull('disclaimer_specialist', instance.disclaimerSpecialist);
  writeNotNull('disclaimer_supplements', instance.disclaimerSupplements);
  writeNotNull(
      'weekly_schedule_use_holidays', instance.weeklyScheduleUseHolidays);
  writeNotNull('ad_platform', instance.adPlatform);
  writeNotNull('name', instance.name);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('link_url', instance.linkUrl);
  writeNotNull('link_domain', instance.linkDomain);
  writeNotNull('link_title', instance.linkTitle);
  writeNotNull('link_button', instance.linkButton);
  writeNotNull('photo', instance.photo);
  writeNotNull('photo_icon', instance.photoIcon);
  writeNotNull('video', instance.video);
  writeNotNull('stats_url', instance.statsUrl);
  writeNotNull('stats_url2', instance.statsUrl2);
  writeNotNull('cpc', instance.cpc);
  writeNotNull('cpm', instance.cpm);
  writeNotNull('ocpm', instance.ocpm);
  writeNotNull('weekly_schedule_hours', instance.weeklyScheduleHours);
  writeNotNull('events_retargeting_groups', instance.eventsRetargetingGroups);
  writeNotNull('targeting', instance.targeting);
  return val;
}
