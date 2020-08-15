// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    (json['response'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.result);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['first_name'] as String,
    json['last_name'] as String,
    json['is_closed'] as bool,
    json['can_access_closed'] as bool,
    json['photo_50'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('is_closed', instance.isClosed);
  writeNotNull('can_access_closed', instance.canAccessClosed);
  writeNotNull('photo_50', instance.photo50);
  return val;
}
