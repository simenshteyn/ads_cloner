import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'bloc_provider.dart';

class AdsBloc implements BlocBase {
  AdsList _ads;
  AdsLayoutList _adsLayout;

  StreamController<AdsList> _adsController =
      StreamController<AdsList>.broadcast();
  Stream<AdsList> get outAdsList => _adsController.stream;

  StreamController<AdsRequest> _cmdAdsController =
      StreamController<AdsRequest>.broadcast();
  StreamSink<AdsRequest> get getAdsList => _cmdAdsController.sink;

  StreamController<AdsLayoutList> _adsLayoutController =
      StreamController<AdsLayoutList>.broadcast();
  Stream<AdsLayoutList> get outAdsLayoutList => _adsLayoutController.stream;

  StreamController<AdsLayoutRequest> _cmdAdsLayoutController =
      StreamController<AdsLayoutRequest>.broadcast();
  StreamSink<AdsLayoutRequest> get getAdsLayoutList => _cmdAdsLayoutController.sink;

  AdsBloc() {
    _adsController.stream.listen(_handleLogic);

    _adsLayoutController.stream.listen(_handleLayoutLogic);

    _cmdAdsController.stream.listen((AdsRequest request) {
      var vk = VkApi(userToken: request.vkAccessToken.token);
      vk.adsGetAds(request.account.accountId.toString(), request.campaign.id)
      .then((list) {
        _ads = list;
        print('ads_bloc list is ${list.ads.length}');
        _adsController.sink.add(_ads);
      });
      //_accountsController.sink.add(_accounts);
    });

    _cmdAdsLayoutController.stream.listen((AdsLayoutRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.adsGetAdsLayout(req.account.accountId.toString(), req.ad)
          .then((list) {
        _adsLayout = list;
        print('ads_bloc ads layout list is ${list.adsLayout.length}');
        _adsLayoutController.sink.add(_adsLayout);
      });
    });
  }
    void dispose() {
      _adsController.close();
      _cmdAdsController.close();
      _adsLayoutController.close();
      _cmdAdsLayoutController.close();
    }

    void _handleLogic(data) {
      _ads = data;
    }

    void _handleLayoutLogic(data) {
      _adsLayout = data;
    }
  }
