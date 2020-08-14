import 'dart:async';
import 'package:ads_cloner/api/error_check.dart';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:ads_cloner/models/ads_request.dart';
import 'package:ads_cloner/models/create_ads_result_list.dart';
import 'package:ads_cloner/models/delete_ads_request.dart';
import 'package:ads_cloner/models/delete_ads_result.dart';
import 'package:ads_cloner/models/update_ads_request.dart';
import 'bloc_provider.dart';

class AdsBloc implements BlocBase, BlocWithPageNotifier {
  AdsList _ads;
  AdsLayoutList _layout;
  VkApi _currentVkApi;

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

  StreamController<CreateAdsResultList> _adsStatusController =
      StreamController<CreateAdsResultList>.broadcast();
  Stream<CreateAdsResultList> get outAdsStatus => _adsStatusController.stream;

  StreamController<UpdateAdsRequest> _cmdAdsStatusController =
      StreamController<UpdateAdsRequest>.broadcast();
  StreamSink<UpdateAdsRequest> get getUpdateAds => _cmdAdsStatusController.sink;

  StreamController<DeleteAdsResult> _adsDeleteController =
      StreamController<DeleteAdsResult>.broadcast();
  Stream<DeleteAdsResult> get outDeleteAds => _adsDeleteController.stream;

  StreamController<DeleteAdsRequest> _cmdAdsDeleteController =
      StreamController<DeleteAdsRequest>.broadcast();
  StreamSink<DeleteAdsRequest> get getDeleteAds => _cmdAdsDeleteController.sink;

  StreamController<String> _warningMessageController =
      StreamController<String>.broadcast();
  StreamSink<String> get inWarningMessage => _warningMessageController.sink;
  Stream<String> get outWarningMessage => _warningMessageController.stream;

  AdsBloc() {
    print("ADS BLOC CREATED");

    _adsController.stream.listen(_handleLogic);

    _cmdAdsController.stream.listen((AdsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsGetAds(request.account.accountId.toString(), request.campaign.id,
              request.client?.id)
          .then((list) {
        _ads = list;
        _adsController.sink.add(_ads);
      });
    });

    _layoutController.stream.listen(_handleLayoutLogic);

    _cmdLayoutController.stream.listen((AdsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsGetCampaignLayout(request.account.accountId.toString(),
              request.campaign, request.client?.id)
          .then((list) {
        _layout = list;
        _layoutController.sink.add(_layout);
      });
    });

    _adsStatusController.stream.listen(_handleUpdateAdsLogic);

    _cmdAdsStatusController.stream.listen((UpdateAdsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsUpdateAds(
              request.account.accountId.toString(), request.ad, request.status)
          .then((list) {
        _adsStatusController.sink.add(list);
      });
    });

    _adsDeleteController.stream.listen(_handleDeleteAdsLogic);

    _cmdAdsDeleteController.stream.listen((DeleteAdsRequest request) {
      if (_currentVkApi == null) {
        _currentVkApi = VkApi(userToken: request.vkAccessToken.token);
      }

      _currentVkApi
          .adsDeleteAds(request.account.accountId.toString(), request.ad)
          .then((list) {
        _adsDeleteController.sink.add(list);
      });
    });

    _warningMessageController.stream.listen(_handleWarningMessage);
  }

  void dispose() {
    print("ADS BLOC DISPOSED");
    _adsController.close();
    _cmdAdsController.close();
    _layoutController.close();
    _cmdLayoutController.close();
    _adsStatusController.close();
    _cmdAdsStatusController.close();
    _adsDeleteController.close();
    _cmdAdsDeleteController.close();
    _warningMessageController.close();
  }

  void _handleLogic(data) {
    _ads = data;
  }

  void _handleLayoutLogic(data) {
    _layout = data;
  }

  void _handleUpdateAdsLogic(data) {}

  void _handleDeleteAdsLogic(data) {}

  void _handleWarningMessage(data) {}
}
