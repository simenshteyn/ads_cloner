import 'package:ads_cloner/blocs/bloc_provider.dart';

class LoginBloc implements BlocBase {
  bool _isLogged;
  
  LoginBloc() {
    this._isLogged = false;
  }

  void dispose() {
    //close stream controllers
  }

  void _handleLogic(data) {
    //handle some data
  }
}