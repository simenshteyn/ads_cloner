import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';

class ApplicationBloc implements BlocBase {
  String _apiKey;
  String _userId;

  ApplicationBloc() {
    this._apiKey = "some API KEY";
    this._userId = "some USER ID";
  }

  void dispose() {
    //close stream controllers
  }

  void _handleLogic(data) {
    //handle some data
  }
}
