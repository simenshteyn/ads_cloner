// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['account_id'] as int,
    json['account_status'] as int,
    json['account_type'] as String,
    json['account_name'] as String,
    json['access_role'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'account_id': instance.accountId,
      'account_status': instance.accountStatus,
      'account_type': instance.accountType,
      'account_name': instance.accountName,
      'access_role': instance.accessRole,
    };
