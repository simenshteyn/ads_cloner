import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Users {
  @JsonKey(name: 'response')
  List<User> result;
  Users(this.result);
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class User {
  int id;
  String firstName, lastName;
  bool isClosed, canAccessClosed;
  @JsonKey(name: 'photo_50')
  String photo50;
  User(this.id, this.firstName, this.lastName, this.isClosed,
      this.canAccessClosed, this.photo50);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
