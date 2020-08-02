import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'ad_layout.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdLayout {
  int campaignId, goalType, costType, adFormat, video, repeatVideo;
  String id,
      ageRestriction,
      title,
      description,
      linkUrl,
      linkDomain,
      linkTitle,
      linkButton,
      previewLink,
      imageSrc;
  @JsonKey(name: 'image_src_2x')
  String imageSrc2x;
  String iconSrc;
  @JsonKey(name: 'icon_src_2x')
  String iconSrc2x;

  AdLayout(
    this.campaignId,
    this.goalType,
    this.costType,
    this.adFormat,
    this.video,
    this.repeatVideo,
    this.id,
    this.ageRestriction,
    this.title,
    this.description,
    this.linkUrl,
    this.linkDomain,
    this.linkTitle,
    this.linkButton,
    this.previewLink,
    this.imageSrc,
    this.imageSrc2x,
    this.iconSrc,
    this.iconSrc2x,
  );
  AdLayout clone() {
    final String jsonString = json.encode(this);
    final jsonResponse = json.decode(jsonString);
    return AdLayout.fromJson(jsonResponse as Map<String, dynamic>);
  }

  factory AdLayout.fromJson(Map<String, dynamic> json) =>
      _$AdLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$AdLayoutToJson(this);
}
