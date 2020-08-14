import 'dart:async';
import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/models/accounts_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:SmmHub/api/vk_api.dart';

class AccountsBloc implements BlocBase, BlocWithPageNotifier {
  AccountsList _accounts;

  StreamController<AccountsList> _accountsController =
      StreamController<AccountsList>.broadcast();
  Stream<AccountsList> get outAccountsList => _accountsController.stream;

  StreamController<VKAccessToken> _cmdController =
      StreamController<VKAccessToken>.broadcast();
  StreamSink<VKAccessToken> get getAccountsList => _cmdController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

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

    _warningMessageController.stream.listen(_handleWarningMessage);
  }
  void dispose() {
    print("ACCOUNTS BLOC DISPOSED");

    _accountsController.close();
    _cmdController.close();
    _warningMessageController.close();
  }

  void _handleLogic(data) {
    _accounts = data;
  }
  
  void _handleWarningMessage(data) {}
}
