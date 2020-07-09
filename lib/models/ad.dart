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
  String category2Id, ageRestriction, name, cpm, adPlatform;
  String cpc, ocpm;
  int impressionsLimited, adPlatformNoWall, autobidding, autobiddingMaxCost;
  int video, disclaimerMedical, disclaimerSpecialist, disclaimerSupplements;
  List<String> weeklyScheduleHours;
  int weeklyScheduleUseHolidays;
  // TODO: "events_retargeting_groups"

  Ad.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      this.id = json['id'];
    }
    if (json.containsKey('campaign_id')) {
      this.campaignId = json['campaign_id'];
    }
    if (json.containsKey('ad_format')) {
      this.adFormat = json['ad_format'];
    }
    if (json.containsKey('cost_type')) {
      this.costType = json['cost_type'];
    }
    if (json.containsKey('cpc')) {
      this.cpc = json['cpc'];
    }
    if (json.containsKey('cpm')) {
      this.cpm = json['cpm'];
    }
    if (json.containsKey('ocpm')) {
      this.ocpm = json['ocpm'];
    }
    if (json.containsKey('goal_type')) {
      this.goalType = json['goal_type'];
    }
    if (json.containsKey('impressions_limit')) {
      this.impressionsLimit = json['impressions_limit'];
    }
    if (json.containsKey('impressions_limited')) {
      this.impressionsLimited = json['impressions_limited'];
    }
    if (json.containsKey('ad_platform')) {
      this.adPlatform = json['ad_platform'];
    }
    if (json.containsKey('ad_platform_no_wall')) {
      this.adPlatformNoWall = json['ad_platform_no_wall'];
    }
    if (json.containsKey('ad_platform_no_ad_network')) {
      this.adPlatformNoAdNetwork = json['ad_platform_no_ad_network'];
    }
    if (json.containsKey('all_limit')) {
      this.allLimit = json['all_limit'];
    }
    if (json.containsKey('day_limit')) {
      this.dayLimit = json['day_limit'];
    }
    if (json.containsKey('autobidding')) {
      this.autobidding = json['autobidding'];
    }
    if (json.containsKey('autobidding_max_cost')) {
      this.autobiddingMaxCost = json['autobidding_max_cost'];
    }
    if (json.containsKey('category1_id')) {
      this.category1Id = json['category1_id'];
    }
    if (json.containsKey('category2_id')) {
      this.category2Id = json['category2_id'];
    }
    if (json.containsKey('status')) {
      this.status = json['status'];
    }
    if (json.containsKey('name')) {
      this.name = json['name'];
    }
    if (json.containsKey('approved')) {
      this.approved = json['approved'];
    }
    if (json.containsKey('video')) {
      this.video = json['video'];
    }
    if (json.containsKey('disclaimer_medical')) {
      this.disclaimerMedical = json['disclaimer_medical'];
    }
    if (json.containsKey('disclaimer_specialist')) {
      this.disclaimerSpecialist = json['disclaimer_specialist'];
    }
    if (json.containsKey('disclaimer_supplements')) {
      this.disclaimerSupplements = json['disclaimer_supplements'];
    }
    if (json.containsKey('weekly_schedule_hours')) {
      this.weeklyScheduleHours = json['weekly_schedule_hours'];
    }
    if (json.containsKey('weekly_schedule_use_holidays')) {
      this.weeklyScheduleUseHolidays = json['weekly_schedule_use_holidays'];
    }
    if (json.containsKey('create_time')) {
      this.createTime = json['create_time'];
    }
    if (json.containsKey('update_time')) {
      this.updateTime = json['update_time'];
    }
    if (json.containsKey('start_time')) {
      this.startTime = json['start_time'];
    }
    if (json.containsKey('stop_time')) {
      this.stopTime = json['stop_time'];
    }
    if (json.containsKey('age_restriction')) {
      this.ageRestriction = json['age_restriction'];
    }
  }
}
