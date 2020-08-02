// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_layout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdLayout _$AdLayoutFromJson(Map<String, dynamic> json) {
  return AdLayout(
    json['campaign_id'] as int,
    json['goal_type'] as int,
    json['cost_type'] as int,
    json['ad_format'] as int,
    json['video'] as int,
    json['repeat_video'] as int,
    json['id'] as String,
    json['age_restriction'] as String,
    json['title'] as String,
    json['description'] as String,
    json['link_url'] as String,
    json['link_domain'] as String,
    json['link_title'] as String,
    json['link_button'] as String,
    json['preview_link'] as String,
    json['image_src'] as String,
    json['image_src_2x'] as String,
    json['icon_src'] as String,
    json['icon_src_2x'] as String,
  );
}

Map<String, dynamic> _$AdLayoutToJson(AdLayout instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaign_id', instance.campaignId);
  writeNotNull('goal_type', instance.goalType);
  writeNotNull('cost_type', instance.costType);
  writeNotNull('ad_format', instance.adFormat);
  writeNotNull('video', instance.video);
  writeNotNull('repeat_video', instance.repeatVideo);
  writeNotNull('id', instance.id);
  writeNotNull('age_restriction', instance.ageRestriction);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('link_url', instance.linkUrl);
  writeNotNull('link_domain', instance.linkDomain);
  writeNotNull('link_title', instance.linkTitle);
  writeNotNull('link_button', instance.linkButton);
  writeNotNull('preview_link', instance.previewLink);
  writeNotNull('image_src', instance.imageSrc);
  writeNotNull('image_src_2x', instance.imageSrc2x);
  writeNotNull('icon_src', instance.iconSrc);
  writeNotNull('icon_src_2x', instance.iconSrc2x);
  return val;
}
