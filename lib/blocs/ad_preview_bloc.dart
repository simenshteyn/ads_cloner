import 'dart:async';

import 'package:SmmHub/api/error_check.dart';
import 'package:SmmHub/api/vk_api.dart';
import 'package:SmmHub/blocs/bloc_provider.dart';
import 'package:SmmHub/models/ads_layout_list.dart';
import 'package:SmmHub/models/ads_layout_request.dart';
import 'package:SmmHub/models/ads_targeting_list.dart';
import 'package:SmmHub/models/ads_targeting_request.dart';

class AdPreviewBloc implements BlocBase, BlocWithPageNotifier {
  AdsLayoutList _adsLayout;
  AdsTargetingList _adsTargetingList;
  VkApi _currentVkApi;

  StreamController<AdsLayoutList> _adsLayoutController =
      StreamController<AdsLayoutList>.broadcast();
  Stream<AdsLayoutList> get outAdsLayoutList => _adsLayoutController.stream;

  StreamController<AdsLayoutRequest> _cmdAdsLayoutController =
      StreamController<AdsLayoutRequest>.broadcast();
  StreamSink<AdsLayoutRequest> get getAdsLayoutList =>
      _cmdAdsLayoutController.sink;

  StreamController<AdsTargetingList> _adsTargetingController =
      StreamController<AdsTargetingList>.broadcast();
  Stream<AdsTargetingList> get outAdsTargetingList =>
      _adsTargetingController.stream;
  StreamController<AdsTargetingRequest> _cmdAdsTargetingController =
      StreamController<AdsTargetingRequest>.broadcast();
  StreamSink<AdsTargetingRequest> get getAdsTargetingList =>
      _cmdAdsTargetingController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  AdPreviewBloc() {
    print("AD PREVIEW BLOC CREATED");

    _adsLayoutController.stream.listen(_handleLayoutLogic);

    _cmdAdsLayoutController.stream.listen((AdsLayoutRequest req) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: req.vkAccessToken.token);
      }
      _currentVkApi
          .adsGetAdsLayout(
              req.account.accountId.toString(), req.ad, req.client?.id)
          .then((list) {
        _adsLayout = list;
        _adsLayoutController.sink.add(_adsLayout);
      });
    });

    _adsTargetingController.stream.listen(_handleTargetingLogic);

    _cmdAdsTargetingController.stream.listen((AdsTargetingRequest req) async {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: req.vkAccessToken.token);
      }

      _currentVkApi
          .adsGetAdsTargeting(
              req.account.accountId.toString(), req.ad, req.client?.id)
          .then((list) {
        _adsTargetingList = list;
        _adsTargetingController.sink.add(_adsTargetingList);
      });
    });

    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void dispose() {
    print("AD PREVIEW BLOC DISPOSED");

    _adsLayoutController.close();
    _cmdAdsLayoutController.close();
    _adsTargetingController.close();
    _cmdAdsTargetingController.close();
    _warningMessageController.close();
  }

  void _handleLayoutLogic(data) {
    _adsLayout = data;
  }

  void _handleTargetingLogic(data) {
    _adsTargetingList = data;
  }

  void _handleWarningMessage(data) {}
}
