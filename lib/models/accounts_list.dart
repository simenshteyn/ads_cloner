import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:SmmHub/models/account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'accounts_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AccountsList {
  @JsonKey(name: 'response')
  List<Account> accounts;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  AccountsList(this.accounts, this.errorResponse);
  factory AccountsList.fromJson(Map<String, dynamic> json) =>
      _$AccountsListFromJson(json);
  Map<String, dynamic> toJson() => _$AccountsListToJson(this);
}
