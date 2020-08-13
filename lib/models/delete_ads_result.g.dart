// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_ads_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAdsResult _$DeleteAdsResultFromJson(Map<String, dynamic> json) {
  return DeleteAdsResult(
    (json['response'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$DeleteAdsResultToJson(DeleteAdsResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.result);
  return val;
}
