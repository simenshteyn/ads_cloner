class AdLayout {
  int campaignId, goalType, costType, adFormat;
  String id, ageRestriction, title, linkUrl, linkDomain, previewLink, imageSrc;
  String imageSrc2x, iconSrc, iconSrc2x;

  AdLayout.fromJSON(Map<String, dynamic> json) {
    this.campaignId = json['campaign_id'];
    this.goalType = json['goal_type'];
    this.costType = json['cost_type'];
    this.adFormat = json['ad_format'];
    this.id = json['id'];
    this.ageRestriction = json['age_restriction'];
    this.title = json['title'];
    this.linkUrl = json['link_url'];
    this.linkDomain = json['link_domain'];
    this.previewLink = json['preview_link'];
    this.imageSrc = json['image_src'];
    this.imageSrc2x = json['image_src_2x'];
    this.iconSrc = json['icon_src'];
    this.iconSrc2x = json['icon_src_2x'];
  }
}
