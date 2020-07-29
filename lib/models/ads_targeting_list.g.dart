// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_targeting_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsTargetingList _$AdsTargetingListFromJson(Map<String, dynamic> json) {
  return AdsTargetingList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : AdTargeting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AdsTargetingListToJson(AdsTargetingList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.adsTargeting);
  return val;
}
