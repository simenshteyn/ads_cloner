// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ads_result_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdsResultList _$CreateAdsResultListFromJson(Map<String, dynamic> json) {
  return CreateAdsResultList(
    (json['response'] as List)
        ?.map((e) => e == null
            ? null
            : CreateAdResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateAdsResultListToJson(CreateAdsResultList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.createAdsResultList);
  writeNotNull('error', instance.errorResponse);
  return val;
}
