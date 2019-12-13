import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:ads_cloner/models/accounts_list.dart';

class ApplicationBloc implements BlocBase {
  VKAccessToken vkAccessToken;
  AccountsList accountsList;

  StreamController<VKAccessToken> _tokenController =
      StreamController<VKAccessToken>.broadcast();
  StreamSink<VKAccessToken> get inVkAccessToken => _tokenController.sink;
  Stream<VKAccessToken> get outVkAccessToken => _tokenController.stream;

  StreamController _cmdTokenController = StreamController();
  StreamSink get getVkAccessToken => _cmdTokenController.sink;

  StreamController<AccountsList> _accountsController =
      StreamController<AccountsList>.broadcast();
  StreamSink<AccountsList> get inAccountsList => _accountsController.sink;
  Stream<AccountsList> get outAccountsList => _accountsController.stream;

  StreamController _cmdAccountsController = StreamController();
  StreamSink get getAccountsList => _cmdAccountsController.sink;

  ApplicationBloc() {
    _tokenController.stream.listen(_handleLogicTokenController);
    _cmdTokenController.stream.listen((token) {
      _tokenController.sink.add(token);
    });

    _accountsController.stream.listen(_handleAccountsController);
    _cmdAccountsController.stream.listen((accounts) {
      _accountsController.sink.add(accounts);
    });
  }

  void dispose() {
    _tokenController.close();
    _cmdTokenController.close();
    _accountsController.close();
    _cmdAccountsController.close();
  }

  void _handleLogicTokenController(data) {
    vkAccessToken = data;
  }

  void _handleAccountsController(data) {
    accountsList = data;
  }
}
