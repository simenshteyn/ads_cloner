import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';

class CreateAd {
  int campaignId, adFormat, autobidding, costType, goalType, impressionsLimit;
  int impressionsLimited, adPlatformNoWall, adPlatformNoAdNetwork, dayLimit;
  int allLimit, category1Id, category2Id, ageRestriction, status, repeatVideo;
  int disclaimerMedical, disclaimerSpecialist, disclaimerSupplements;
  int weeklyScheduleUseHolidays;
  String adPlatform, name, title, description, linkUrl, linkDomain;
  String linkTitle, linkButton, photo, photoIcon, video, statsUrl, statsUrl2;
  double cpc, cpm, ocpm;
  List weeklyScheduleHours;
  Map<String, List<int>> eventsRetargetingGroups; //interesting to check
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
    this.eventsRetargetingGroups,
    this.targeting,
  });

  CreateAd.bulder(Ad ad, AdLayout adLayout, AdTargeting adTargeting,
      WallPostAdsStealth wallPostAdsStealth) {
    this.campaignId = ad.campaignId;
    this.adFormat = ad.adFormat;
    this.autobidding = ad.autobidding;
    this.costType = ad.costType;
    this.goalType = ad.goalType;
    this.impressionsLimit = ad.impressionsLimit;
    this.impressionsLimited = ad.impressionsLimited;
    this.adPlatformNoWall = ad.adPlatformNoWall;
    this.adPlatformNoAdNetwork = ad.adPlatformNoAdNetwork;
    this.dayLimit = int.tryParse(ad.dayLimit);
    this.allLimit = int.tryParse(ad.allLimit);
    this.category1Id = int.tryParse(ad.category1Id);
    this.category2Id = int.tryParse(ad.category2Id);
    this.ageRestriction = int.tryParse(ad.ageRestriction);
    this.status = ad.status;
    this.repeatVideo = 1; //can't find this in other objects
    this.disclaimerMedical = ad.disclaimerMedical;
    this.disclaimerSpecialist = ad.disclaimerSpecialist;
    this.disclaimerSupplements = ad.disclaimerSupplements;
    this.weeklyScheduleUseHolidays = ad.weeklyScheduleUseHolidays;
    this.adPlatform = ad.adPlatform;
    this.name = ad.name;
    this.title = adLayout.title;
    this.description; //can't find this in other objects
    this.linkUrl = adLayout.linkUrl;
    this.linkDomain = adLayout.linkDomain;
    this.linkTitle; // = wallPostAdsStealth.linkTitle;
    this.linkButton; // = wallPostAdsStealth.linkButton;
    this.photo; //can't find
    this.photoIcon; //can't find
    this.video; //result of video uploading to server
    this.statsUrl; //pixel of external stats
    this.statsUrl2; //pixe of external stats
    this.cpc = (ad.cpc != null) ? (int.tryParse(ad.cpm) / 100) : null;
    this.cpm = (ad.cpm != null) ? (int.tryParse(ad.cpm) / 100) : null;
    this.ocpm = (ad.ocpm != null) ? (int.tryParse(ad.ocpm) / 100) : null;
    this.weeklyScheduleHours = ad.weeklyScheduleHours;
    this.eventsRetargetingGroups = ad.eventsRetargetingGroups;
    this.targeting = adTargeting;
  }

  Map<String, dynamic> toJson() {
    var result = {
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
      'events_retargeting_groups': eventsRetargetingGroups,
    }..removeWhere((key, value) => key == null || value == null);
    result.addAll(this.targeting.toJson());
    return result;
  }
}
