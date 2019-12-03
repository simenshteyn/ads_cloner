import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApplicationBloc implements BlocBase {
  String _apiKey;
  String _userId;

  StreamController<String> _apiKeyController = StreamController<String>();
  StreamSink<String> get _inApiKey => _apiKeyController.sink;
  Stream<String> get outApiKey => _apiKeyController.stream;

  StreamController<String> _userIdController = StreamController<String>();
  StreamSink<String> get _inUserId => _userIdController.sink;
  Stream<String> get outUserId => _userIdController.stream;

  ApplicationBloc() {
    _apiKeyController.stream.listen(_handleLogicApiKeyController);
    _userIdController.stream.listen(_handleLogicUserIdController);
  }

  void dispose() {
    _apiKeyController.close();
    _userIdController.close();
  }

  void _handleLogicApiKeyController(data) {
    //handle some data
  }

  void _handleLogicUserIdController(data) {
    //handle some data
  }
}
