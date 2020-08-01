// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pretty_card_create_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrettyCardCreateResultObject _$PrettyCardCreateResultObjectFromJson(
    Map<String, dynamic> json) {
  return PrettyCardCreateResultObject(
    json['owner_id'] as int,
    json['card_id'] as String,
  );
}

Map<String, dynamic> _$PrettyCardCreateResultObjectToJson(
    PrettyCardCreateResultObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('card_id', instance.cardId);
  return val;
}

PrettyCardCreateResult _$PrettyCardCreateResultFromJson(
    Map<String, dynamic> json) {
  return PrettyCardCreateResult(
    json['response'] == null
        ? null
        : PrettyCardCreateResultObject.fromJson(
            json['response'] as Map<String, dynamic>),
    json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrettyCardCreateResultToJson(
    PrettyCardCreateResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.result);
  writeNotNull('error', instance.errorResponse);
  return val;
}
