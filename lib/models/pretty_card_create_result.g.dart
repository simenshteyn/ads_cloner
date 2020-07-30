// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pretty_card_create_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrettyCardCreateResult _$PrettyCardCreateResultFromJson(
    Map<String, dynamic> json) {
  return PrettyCardCreateResult(
    json['owner_id'] as int,
    json['card_id'] as int,
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

  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('card_id', instance.cardId);
  return val;
}
