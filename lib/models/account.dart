import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Account {
  int accountId, accountStatus;
  String accountType, accountName, accessRole;
  Account(this.accountId, this.accountStatus, this.accountType,
      this.accountName, this.accessRole);

  factory Account.fromJSON(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

//  Account.fromJSON(Map<String, dynamic> json) {
//    this.accountId = json['account_id'];
//   this.accountType = json['account_type'];
//    this.accountStatus = json['account_status'];
//    this.accountName = json['account_name'];
//    this.accessRole = json['access_role'];
//  }
}
