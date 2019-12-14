import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/models/campaigns_list.dart';


class ApplicationBloc implements BlocBase {
  VKAccessToken vkAccessToken;
  AccountsList accountsList;
  CampaignsList campaignsList;

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

  StreamController<CampaignsList> _campaignsController = StreamController<CampaignsList>.broadcast();
  StreamSink<CampaignsList> get inCampaignsList => _campaignsController.sink;
  Stream<CampaignsList> get outCampaignsList => _campaignsController.stream;

  StreamController _cmdCampaignsController = StreamController();
  StreamSink get getCampaignsList => _cmdCampaignsController.sink;

  ApplicationBloc() {
    _tokenController.stream.listen(_handleLogicTokenController);
    _cmdTokenController.stream.listen((token) {
      _tokenController.sink.add(token);
    });

    _accountsController.stream.listen(_handleAccountsController);
    _cmdAccountsController.stream.listen((accounts) {
      _accountsController.sink.add(accounts);
    });

    _campaignsController.stream.listen(_handleCampaignsController);
    _cmdCampaignsController.stream.listen((campaigns) {
      _campaignsController.sink.add(campaigns);
    });
  }

  void dispose() {
    _tokenController.close();
    _cmdTokenController.close();
    _accountsController.close();
    _cmdAccountsController.close();
    _campaignsController.close();
    _cmdCampaignsController.close();
  }

  void _handleLogicTokenController(data) {
    vkAccessToken = data;
  }

  void _handleAccountsController(data) {
    accountsList = data;
  }

  void _handleCampaignsController(data) {
    campaignsList = data;
  }
}
