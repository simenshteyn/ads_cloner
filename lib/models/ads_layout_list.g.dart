// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_layout_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsLayoutList _$AdsLayoutListFromJson(Map<String, dynamic> json) {
  return AdsLayoutList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : AdLayout.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AdsLayoutListToJson(AdsLayoutList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.adsLayout);
  return val;
}
