import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'bloc_provider.dart';

class AdsBloc implements BlocBase {
  AdsList _ads;
  AdsLayoutList _layout;

  StreamController<AdsList> _adsController =
      StreamController<AdsList>.broadcast();
  Stream<AdsList> get outAdsList => _adsController.stream;

  StreamController<AdsRequest> _cmdAdsController =
      StreamController<AdsRequest>.broadcast();
  StreamSink<AdsRequest> get getAdsList => _cmdAdsController.sink;

  StreamController<AdsLayoutList> _layoutController =
      StreamController<AdsLayoutList>.broadcast();
  Stream<AdsLayoutList> get outLayoutList => _layoutController.stream;

  StreamController<AdsRequest> _cmdLayoutController =
      StreamController<AdsRequest>.broadcast();
  StreamSink<AdsRequest> get getAdsLayoutList => _cmdLayoutController.sink;

  AdsBloc() {
    print("ADS BLOC CREATED");

    _adsController.stream.listen(_handleLogic);

    _cmdAdsController.stream.listen((AdsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk
          .adsGetAds(request.account.accountId.toString(), request.campaign.id, request.client?.id)
          .then((list) {
        _ads = list;
        _adsController.sink.add(_ads);
      });
    });

    _layoutController.stream.listen(_handleLayoutLogic);

    _cmdLayoutController.stream.listen((AdsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk
          .adsGetCampaignLayout(
              request.account.accountId.toString(), request.campaign, request.client?.id)
          .then((list) {
        _layout = list;
        _layoutController.sink.add(_layout);
      });
    });
  }

  void dispose() {
    print("ADS BLOC DISPOSED");
    _adsController.close();
    _cmdAdsController.close();
    _layoutController.close();
    _cmdLayoutController.close();
  }

  void _handleLogic(data) {
    _ads = data;
  }

  void _handleLayoutLogic(data) {
    _layout = data;
  }
}
