// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsList _$AdsListFromJson(Map<String, dynamic> json) {
  return AdsList(
    (json['response'] as List)
        ?.map((e) => e == null ? null : Ad.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AdsListToJson(AdsList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.ads);
  return val;
}
