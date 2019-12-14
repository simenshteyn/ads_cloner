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
  StreamSink<AdsRequest> get getAdsList =>
      _cmdAdsController.sink;

  AdsBloc() {
    _adsController.stream.listen(_handleLogic);
    _cmdAdsController.stream.listen((AdsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk.adsGetAds(request.account.accountId.toString(), request.campaign.id).then((list) {
        _ads = list;
        print('ads_bloc list is ${list.ads.length}');
        _adsController.sink.add(_ads);
      });
      //_accountsController.sink.add(_accounts);
    });
  }

  void _handleLogic(data) {
    _ads = data;
  }

  void dispose() {
    _adsController.close();
    _cmdAdsController.close();
  }
}
