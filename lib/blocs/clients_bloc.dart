import 'dart:async';
import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/api/vk_api.dart';
import 'package:SmmHub/models/clients_list.dart';
import 'package:SmmHub/models/clients_request.dart';
import 'bloc_provider.dart';

class ClientsBloc implements BlocBase, BlocWithPageNotifier {
  ClientsList _clients;
  VkApi _currentVkApi;

  StreamController<ClientsList> _clientsController =
      StreamController<ClientsList>.broadcast();
  Stream<ClientsList> get outClientsList => _clientsController.stream;

  StreamController<ClientsRequest> _cmdClientsController =
      StreamController<ClientsRequest>.broadcast();
  StreamSink<ClientsRequest> get getClientsList => _cmdClientsController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  ClientsBloc() {
    print("CLIENTS BLOC CREATED");

    _clientsController.stream.listen(_handleLogic);
    _cmdClientsController.stream.listen((ClientsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsGetClients(request.account.accountId.toString())
          .then((list) {
        _clients = list;
        _clientsController.sink.add(_clients);
      });
    });
    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void _handleLogic(data) {
    _clients = data;
  }

  void _handleWarningMessage(data) {}

  void dispose() {
    print("CLIENTS BLOC DISPOSED");

    _clientsController.close();
    _cmdClientsController.close();
    _warningMessageController.close();
  }
}
