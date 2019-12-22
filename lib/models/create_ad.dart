import 'package:ads_cloner/models/ad_targeting.dart';

class CreateAd {
  int campaignId, adFormat, autobidding, costType, goalType, impressionsLimit;
  int impressionsLimited, adPlatformNoWall, adPlatformNoAdNetwork, dayLimit;
  int allLimit, category1Id, category2Id, ageRestriction, status, repeatVideo;
  int disclaimerMedical, disclaimerSpecialist, disclaimerSupplements;
  int weeklyScheduleUseHolidays;
  String adPlatform, name, title, description, linkUrl, linkDomain;
  String linkTitle, linkButton, photo, photoIcon, video, statsUrl, statsUrl2;
  double cpc, cpm, ocpm;
  List<String> weeklyScheduleHours;
  AdTargeting targeting;
  // information about fields: https://vk.com/dev/ads.createAds

  CreateAd({
    this.campaignId,
    this.adFormat,
    this.autobidding,
    this.costType,
    this.goalType,
    this.impressionsLimit,
    this.impressionsLimited,
    this.adPlatformNoWall,
    this.adPlatformNoAdNetwork,
    this.dayLimit,
    this.allLimit,
    this.category1Id,
    this.category2Id,
    this.ageRestriction,
    this.status,
    this.repeatVideo,
    this.disclaimerMedical,
    this.disclaimerSpecialist,
    this.disclaimerSupplements,
    this.weeklyScheduleUseHolidays,
    this.adPlatform,
    this.name,
    this.title,
    this.description,
    this.linkUrl,
    this.linkDomain,
    this.linkTitle,
    this.linkButton,
    this.photo,
    this.photoIcon,
    this.video,
    this.statsUrl,
    this.statsUrl2,
    this.cpc,
    this.cpm,
    this.ocpm,
    this.weeklyScheduleHours,
    this.targeting,
  });

  Map<String, dynamic> toJson() {
    var result = {};
    result.addAll(
     {
        'campaign_id': campaignId,
        'ad_format': adFormat,
        'autobidding': autobidding,
        'cost_type': costType,
        'cpc': cpc,
        'cpm': cpm,
        'ocpm': ocpm,
        'goal_type': goalType,
        'impressions_limit': impressionsLimit,
        'impresstions_limited': impressionsLimited,
        'ad_platform': adPlatform,
        'ad_platform_no_wall': adPlatformNoWall,
        'day_limit': dayLimit,
        'all_limit': allLimit,
        'category1_id': category1Id,
        'category2_id': category2Id,
        'age_restriction': ageRestriction,
        'status': status,
        'name': name,
        'title': title,
        'description': description,
        'link_url': linkUrl,
        'link_domain': linkDomain,
        'link_title': linkTitle,
        'link_button': linkButton,
        'photo': photo,
        'photo_icon': photoIcon,
        'video': video,
        'repeat_video': repeatVideo,
        'disclaimer_medical': disclaimerMedical,
        'disclaimer_specialist': disclaimerSpecialist,
        'disclaimer_supplements': disclaimerSupplements,
        'weekly_schedule_hours': weeklyScheduleHours,
        'weekly_schedule_use_holidays': weeklyScheduleUseHolidays,
        'stats_url': statsUrl,
        'stats_url2': statsUrl2,
      });
  result.addAll(this.targeting.toJson());
  return result;     
  }
}
