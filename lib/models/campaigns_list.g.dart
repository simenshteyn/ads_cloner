// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaigns_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignsList _$CampaignsListFromJson(Map<String, dynamic> json) {
  return CampaignsList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : Campaign.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CampaignsListToJson(CampaignsList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.campaigns);
  return val;
}
