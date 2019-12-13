import 'package:ads_cloner/models/account.dart';
import 'dart:convert' show jsonDecode;

class AccountsList {
  List<Account> accounts;

  AccountsList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    accounts = [];
    final List _accountsList = _map['response'];
    for (var account in _accountsList) {
      accounts.add(Account.fromJSON(account));
    }
    print('accounts_list.dart accounts length: ${accounts.length}');
  }
}
