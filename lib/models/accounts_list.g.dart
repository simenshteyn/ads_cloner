// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountsList _$AccountsListFromJson(Map<String, dynamic> json) {
  return AccountsList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : Account.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountsListToJson(AccountsList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.accounts);
  writeNotNull('error', instance.errorResponse);
  return val;
}
