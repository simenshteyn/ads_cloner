import 'dart:async';
import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/api/vk_api.dart';
import 'package:SmmHub/models/campaigns_list.dart';
import 'package:SmmHub/models/campaigns_request.dart';
import 'package:SmmHub/models/create_campaigns_result_list.dart';
import 'package:SmmHub/models/update_campaigns_request.dart';
import 'bloc_provider.dart';

class CampaignsBloc implements BlocBase, BlocWithPageNotifier {
  CampaignsList _campaigns;
  VkApi _currentVkApi;

  StreamController<CampaignsList> _campaignsController =
      StreamController<CampaignsList>.broadcast();
  Stream<CampaignsList> get outCampaignsList => _campaignsController.stream;

  StreamController<CampaignsRequest> _cmdCampaignsController =
      StreamController<CampaignsRequest>.broadcast();
  StreamSink<CampaignsRequest> get getCampaignsList =>
      _cmdCampaignsController.sink;

  StreamController<CreateCampaignsResultList> _campaignsStatusController =
      StreamController<CreateCampaignsResultList>.broadcast();
  Stream<CreateCampaignsResultList> get outCampaignsStatus =>
      _campaignsStatusController.stream;

  StreamController<UpdateCampaignsRequest> _cmdCampaignsStatusController =
      StreamController<UpdateCampaignsRequest>.broadcast();
  StreamSink<UpdateCampaignsRequest> get getUpdateCampaigns =>
      _cmdCampaignsStatusController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  CampaignsBloc() {
    print("CAMPAIGNS BLOC CREATED");

    _campaignsController.stream.listen(_handleLogic);
    _cmdCampaignsController.stream.listen((CampaignsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsGetCampaigns(
              request.account.accountId.toString(), request.client?.id)
          .then((list) {
        _campaigns = list;
        _campaignsController.sink.add(_campaigns);
      });
    });

    _campaignsStatusController.stream.listen(_handleStatusLogic);
    _cmdCampaignsStatusController.stream
        .listen((UpdateCampaignsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsUpdateCampaigns(request.account.accountId.toString(),
              request.campaign, request.status)
          .then((list) {
        _campaignsStatusController.sink.add(list);
      });
    });
    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void _handleLogic(data) {
    _campaigns = data;
  }

  void _handleStatusLogic(data) {
    //
  }

  void _handleWarningMessage(data) {}

  void dispose() {
    print("CAMPAIGNS BLOC DISPOSED");

    _campaignsController.close();
    _cmdCampaignsController.close();
    _campaignsStatusController.close();
    _cmdCampaignsStatusController.close();
    _warningMessageController.close();
  }
}
