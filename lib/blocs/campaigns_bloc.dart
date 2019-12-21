import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/campaigns_list.dart';
import 'package:ads_cloner/models/campaigns_request.dart';
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

  CampaignsBloc() {
    print("CAMPAIGNS BLOC CREATED");

    _campaignsController.stream.listen(_handleLogic);
    _cmdCampaignsController.stream.listen((CampaignsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk.adsGetCampaigns(request.account.accountId.toString()).then((list) {
        _campaigns = list;
        _campaignsController.sink.add(_campaigns);
      });
    });
  }

  void _handleLogic(data) {
    _campaigns = data;
  }

  void dispose() {
    print("CAMPAIGNS BLOC DISPOSED");

    _campaignsController.close();
    _cmdCampaignsController.close();
  }
}
