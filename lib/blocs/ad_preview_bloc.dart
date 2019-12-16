import 'dart:async';

import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';

class AdPreviewBloc implements BlocBase {
  AdsLayoutList _adsLayout;

  StreamController<AdsLayoutList> _adsLayoutController =
      StreamController<AdsLayoutList>.broadcast();
  Stream<AdsLayoutList> get outAdsLayoutList => _adsLayoutController.stream;

  StreamController<AdsLayoutRequest> _cmdAdsLayoutController =
      StreamController<AdsLayoutRequest>.broadcast();
  StreamSink<AdsLayoutRequest> get getAdsLayoutList =>
      _cmdAdsLayoutController.sink;

  AdPreviewBloc() {
    _adsLayoutController.stream.listen(_handleLayoutLogic);

    _cmdAdsLayoutController.stream.listen((AdsLayoutRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.adsGetAdsLayout(req.account.accountId.toString(), req.ad).then((list) {
        _adsLayout = list;
        print('ads_bloc ads layout list is ${list.adsLayout.length}');
        _adsLayoutController.sink.add(_adsLayout);
      });
    });
  }

  void dispose() {
    _adsLayoutController.close();
    _cmdAdsLayoutController.close();
  }

  void _handleLayoutLogic(data) {
    _adsLayout = data;
  }
}
