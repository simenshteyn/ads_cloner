import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:ads_cloner/api/vk_api.dart';

class LoginBloc implements BlocBase {
  AccountsList accounts;

  StreamController<AccountsList> _accountsController = StreamController<AccountsList>.broadcast();
  Stream<AccountsList> get outAccountsList => _accountsController.stream;

  StreamController<VKAccessToken> _cmdController = StreamController<VKAccessToken>.broadcast();
  StreamSink get inVkAccessToken => _cmdController.sink;
  
  LoginBloc() {
    _cmdController.stream.listen((VKAccessToken token) async {
      final vk = VkApi(userToken: token.token);
      await vk.adsGetAccounts().then((list) {
        accounts = list;
      });
      _accountsController.sink.add(accounts);
    });
  }

  void dispose() {
    _accountsController.close();
    _cmdController.close();
  }

}