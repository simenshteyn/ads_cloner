import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Account {
  int accountId, accountStatus;
  String accountType, accountName, accessRole;
  Account(this.accountId, this.accountStatus, this.accountType,
      this.accountName, this.accessRole);

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
