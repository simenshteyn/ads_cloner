import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:ads_cloner/api/vk_api.dart';

class AccountsBloc implements BlocBase {
  AccountsList _accounts;

  StreamController<AccountsList> _accountsController =
      StreamController<AccountsList>.broadcast();
  Stream<AccountsList> get outAccountsList => _accountsController.stream;

  StreamController<VKAccessToken> _cmdController =
      StreamController<VKAccessToken>.broadcast();
  StreamSink<VKAccessToken> get getAccountsList => _cmdController.sink;

  AccountsBloc() {
    print("ACCOUNTS BLOC CREATED");

    _accountsController.stream.listen(_handleLogic);

    _cmdController.stream.listen((VKAccessToken token) {
      var vk = VkApi(userToken: token.token);
      vk.adsGetAccounts().then((list) {
        _accounts = list;
        _accountsController.sink.add(_accounts);
      });
    });
  }
  void dispose() {
    print("ACCOUNTS BLOC DISPOSED");

    _accountsController.close();
    _cmdController.close();
  }

  void _handleLogic(data) {
    _accounts = data;
  }
}
