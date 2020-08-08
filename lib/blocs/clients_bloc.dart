import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/clients_list.dart';
import 'package:ads_cloner/models/clients_request.dart';
import 'bloc_provider.dart';

class ClientsBloc implements BlocBase {
  ClientsList _clients;

  StreamController<ClientsList> _clientsController =
      StreamController<ClientsList>.broadcast();
  Stream<ClientsList> get outClientsList => _clientsController.stream;

  StreamController<ClientsRequest> _cmdClientsController =
      StreamController<ClientsRequest>.broadcast();
  StreamSink<ClientsRequest> get getClientsList =>
      _cmdClientsController.sink;

  ClientsBloc() {
    print("CLIENTS BLOC CREATED");

    _clientsController.stream.listen(_handleLogic);
    _cmdClientsController.stream.listen((ClientsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk.adsGetClients(request.account.accountId.toString()).then((list) {
        _clients = list;
        _clientsController.sink.add(_clients);
      });
    });
  }

  void _handleLogic(data) {
    _clients = data;
  }

  void dispose() {
    print("CLIENTS BLOC DISPOSED");

    _clientsController.close();
    _cmdClientsController.close();
  }
}