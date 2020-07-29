// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdResult _$CreateAdResultFromJson(Map<String, dynamic> json) {
  return CreateAdResult(
    json['id'] as int,
    json['error_code'] as int,
    json['error_desc'] as String,
  );
}

Map<String, dynamic> _$CreateAdResultToJson(CreateAdResult instance) {
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
