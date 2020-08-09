import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/campaigns_list.dart';
import 'package:ads_cloner/models/campaigns_request.dart';
import 'package:ads_cloner/models/create_campaigns_result_list.dart';
import 'package:ads_cloner/models/update_campaigns_request.dart';
import 'bloc_provider.dart';

class CampaignsBloc implements BlocBase {
  CampaignsList _campaigns;

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

  CampaignsBloc() {
    print("CAMPAIGNS BLOC CREATED");

    _campaignsController.stream.listen(_handleLogic);
    _cmdCampaignsController.stream.listen((CampaignsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk
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
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk
          .adsUpdateCampaigns(request.account.accountId.toString(),
              request.campaign, request.status)
          .then((list) {
        _campaignsStatusController.sink.add(list);
      });
    });
  }

  void _handleLogic(data) {
    _campaigns = data;
  }

  void _handleStatusLogic(data) {
    //
  }

  void dispose() {
    print("CAMPAIGNS BLOC DISPOSED");

    _campaignsController.close();
    _cmdCampaignsController.close();
    _campaignsStatusController.close();
    _cmdCampaignsStatusController.close();
  }
}
