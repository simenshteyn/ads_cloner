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

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account_id', instance.accountId);
  writeNotNull('account_status', instance.accountStatus);
  writeNotNull('account_type', instance.accountType);
  writeNotNull('account_name', instance.accountName);
  writeNotNull('access_role', instance.accessRole);
  return val;
}
