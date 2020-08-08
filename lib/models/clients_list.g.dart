// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsList _$ClientsListFromJson(Map<String, dynamic> json) {
  return ClientsList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : Client.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClientsListToJson(ClientsList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.clients);
  writeNotNull('error', instance.errorResponse);
  return val;
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    json['name'] as String,
    json['day_limit'] as String,
    json['all_limit'] as String,
  )..id = json['id'] as int;
}

Map<String, dynamic> _$ClientToJson(Client instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('day_limit', instance.dayLimit);
  writeNotNull('all_limit', instance.allLimit);
  return val;
}
