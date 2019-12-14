class Ad {
  int campaignId, status, goalType, costType, adFormat, impressionsLimit, adPlatformNoAdNetwork;
  String id, approved, createTime, updateTime, dayLimit, allLimit, startTime, stopTime, category1Id;
  String category2Id, ageRestriction, name, cpm, adPlatform;
  // TODO: "events_retargeting_groups"

  Ad.fromJSON(Map<String, dynamic> json) {
        this.campaignId = json['campaign_id'];
        this.status = json['status'];
        this.goalType = json['goal_type'];
        this.costType = json['cost_type'];
        this.adFormat = json['ad_format'];
        this.impressionsLimit = json['impressionsLimit'];
        this.adPlatformNoAdNetwork = json['ad_platform_no_ad_network'];
        this.id = json['id'];
        this.approved = json['approved'];
        this.createTime = json['create_time'];
        this.updateTime = json['update_time'];
        this.dayLimit = json['day_limit'];
        this.allLimit = json['all_limit'];
        this.startTime = json['start_time'];
        this.stopTime = json['stop_time'];
        this.category1Id = json['category1_id'];
        this.category2Id = json['category2_id'];
        this.ageRestriction = json['age_restriction'];
        this.name = json['name'];
        this.cpm = json['cpm'];
        this.adPlatform = json['ad_platform'];
  }
}