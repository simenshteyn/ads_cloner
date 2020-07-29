// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wall_post_adsstealth_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallPostAdsStealthResultObject _$WallPostAdsStealthResultObjectFromJson(
    Map<String, dynamic> json) {
  return WallPostAdsStealthResultObject(
    json['post_id'] as int,
    json['error_code'] as int,
    json['error_desc'] as String,
  );
}

Map<String, dynamic> _$WallPostAdsStealthResultObjectToJson(
    WallPostAdsStealthResultObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('post_id', instance.postId);
  writeNotNull('error_code', instance.errorCode);
  writeNotNull('error_desc', instance.errorDesc);
  return val;
}

WallPostAdsStealthResult _$WallPostAdsStealthResultFromJson(
    Map<String, dynamic> json) {
  return WallPostAdsStealthResult(
    json['response'] == null
        ? null
        : WallPostAdsStealthResultObject.fromJson(
            json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WallPostAdsStealthResultToJson(
    WallPostAdsStealthResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.result);
  return val;
}
