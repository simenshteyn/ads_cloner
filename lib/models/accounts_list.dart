import 'package:ads_cloner/models/account.dart';
import 'package:json_annotation/json_annotation.dart';
part 'accounts_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AccountsList {
  @JsonKey(name: 'response')
  List<Account> accounts;
  AccountsList(this.accounts);
  factory AccountsList.fromJson(Map<String, dynamic> json) =>
      _$AccountsListFromJson(json);
  Map<String, dynamic> toJson() => _$AccountsListToJson(this);
}
