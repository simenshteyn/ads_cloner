import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'bloc_provider.dart';

class AdsBloc implements BlocBase {
  AdsList _ads;

  StreamController<AdsList> _adsController =
      StreamController<AdsList>.broadcast();
  Stream<AdsList> get outAdsList => _adsController.stream;

  StreamController<AdsRequest> _cmdAdsController =
      StreamController<AdsRequest>.broadcast();
  StreamSink<AdsRequest> get getAdsList => _cmdAdsController.sink;

  AdsBloc() {
    print("ADS BLOC CREATED");

    _adsController.stream.listen(_handleLogic);

    _cmdAdsController.stream.listen((AdsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk
          .adsGetAds(request.account.accountId.toString(), request.campaign.id)
          .then((list) {
        _ads = list;
        _adsController.sink.add(_ads);
      });
    });
  }

  void dispose() {
        print("ADS BLOC DISPOSED");

    _adsController.close();
    _cmdAdsController.close();
  }

  void _handleLogic(data) {
    _ads = data;
  }
}
