import 'dart:async';
import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/models/accounts_list.dart';
import 'package:SmmHub/models/users.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:SmmHub/api/vk_api.dart';

class LoginBloc implements BlocBase, BlocWithPageNotifier {
  AccountsList accounts;

  StreamController<AccountsList> _accountsController =
      StreamController<AccountsList>.broadcast();
  Stream<AccountsList> get outAccountsList => _accountsController.stream;

  StreamController<VKAccessToken> _cmdController =
      StreamController<VKAccessToken>.broadcast();
  StreamSink get inVkAccessToken => _cmdController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  StreamController<Users> _userController = StreamController<Users>.broadcast();
  Stream<Users> get outUsers => _userController.stream;
  StreamSink<Users> get inUsers => _userController.sink;

  StreamController<VKAccessToken> _cmdUserController =
      StreamController<VKAccessToken>.broadcast();
      StreamSink<VKAccessToken> get getUser => _cmdUserController.sink;

  LoginBloc() {
    print("LOGIN BLOC CREATED");
    _cmdController.stream.listen((VKAccessToken token) async {
      final vk = VkApi(userToken: token.token);
      await vk.adsGetAccounts().then((list) {
        accounts = list;
      });
      _accountsController.sink.add(accounts);
    });
    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void dispose() {
    _accountsController.close();
    _cmdController.close();
    _warningMessageController.close();
    print("LOGIN BLOC DISPOSED");
  }

  void _handleWarningMessage(data) {}
}
