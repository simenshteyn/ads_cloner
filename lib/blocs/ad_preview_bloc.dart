import 'dart:async';

import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_layout_request.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/ads_targeting_request.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';

class AdPreviewBloc implements BlocBase {
  AdsLayoutList _adsLayout;
  AdsTargetingList _adsTargetingList;
  WallPostList _wallPostList;

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

  StreamController<WallPostList> _wallPostController =
      StreamController<WallPostList>.broadcast();
  Stream<WallPostList> get outWallPostList => _wallPostController.stream;
  StreamController<WallPostRequest> _cmdWallPostController =
      StreamController<WallPostRequest>.broadcast();
  StreamSink<WallPostRequest> get getWallPostList =>
      _cmdWallPostController.sink;

  AdPreviewBloc() {
    print("AD PREVIEW BLOC CREATED");

    _adsLayoutController.stream.listen(_handleLayoutLogic);

    _cmdAdsLayoutController.stream.listen((AdsLayoutRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.adsGetAdsLayout(req.account.accountId.toString(), req.ad).then((list) {
        _adsLayout = list;
        _adsLayoutController.sink.add(_adsLayout);
      });
    });

    _adsTargetingController.stream.listen(_handleTargetingLogic);

    _cmdAdsTargetingController.stream.listen((AdsTargetingRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk
          .adsGetAdsTargeting(req.account.accountId.toString(), req.ad)
          .then((list) {
        _adsTargetingList = list;
        _adsTargetingController.sink.add(_adsTargetingList);
      });
    });

    _wallPostController.stream.listen(_handleLogic);

    _cmdWallPostController.stream.listen((WallPostRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.wallGetById(req.postId).then((list) {
        _wallPostList = list;
        _wallPostController.sink.add(_wallPostList);
      });
    });
  }

  void dispose() {
    print("AD PREVIEW BLOC DISPOSED");

    _adsLayoutController.close();
    _cmdAdsLayoutController.close();
    _adsTargetingController.close();
    _cmdAdsTargetingController.close();
    _wallPostController.close();
    _cmdWallPostController.close();
  }

  void _handleLogic(data) {
    _wallPostList = data;
  }

  void _handleLayoutLogic(data) {
    _adsLayout = data;
  }

  void _handleTargetingLogic(data) {
    _adsTargetingList = data;
  }
}
