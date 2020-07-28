// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) {
  return Campaign(
    json['id'] as int,
    json['status'] as int,
    json['type'] as String,
    json['name'] as String,
    json['day_limit'] as String,
    json['all_limit'] as String,
    json['start_time'] as String,
    json['stop_time'] as String,
    json['create_time'] as String,
    json['update_time'] as String,
  );
}

Map<String, dynamic> _$CampaignToJson(Campaign instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', instance.status);
  writeNotNull('type', instance.type);
  writeNotNull('name', instance.name);
  writeNotNull('day_limit', instance.dayLimit);
  writeNotNull('all_limit', instance.allLimit);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('stop_time', instance.stopTime);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  return val;
}
