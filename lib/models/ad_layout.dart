import 'package:json_annotation/json_annotation.dart';
part 'ad_layout.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdLayout {
  int campaignId, goalType, costType, adFormat;
  String id, ageRestriction, title, linkUrl, linkDomain, previewLink, imageSrc;
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
    this.id,
    this.ageRestriction,
    this.title,
    this.linkUrl,
    this.linkDomain,
    this.previewLink,
    this.imageSrc,
    this.imageSrc2x,
    this.iconSrc,
    this.iconSrc2x,
  );

  factory AdLayout.fromJson(Map<String, dynamic> json) =>
      _$AdLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$AdLayoutToJson(this);
}
