// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_campaigns_result_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCampaignsResultList _$CreateCampaignsResultListFromJson(
    Map<String, dynamic> json) {
  return CreateCampaignsResultList(
    (json['response'] as List)
        ?.map((e) => e == null
            ? null
            : CreateCampaignResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateCampaignsResultListToJson(
    CreateCampaignsResultList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.createCampaignsResultList);
  writeNotNull('error', instance.errorResponse);
  return val;
}

CreateCampaignResult _$CreateCampaignResultFromJson(Map<String, dynamic> json) {
  return CreateCampaignResult(
    json['id'] as int,
    json['error_code'] as int,
    json['error_desc'] as String,
  );
}

Map<String, dynamic> _$CreateCampaignResultToJson(
    CreateCampaignResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('error_code', instance.errorCode);
  writeNotNull('error_desc', instance.errorDesc);
  return val;
}
