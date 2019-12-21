import 'dart:async';

import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/ads_targeting_request.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';

class CloneBloc implements BlocBase {
  WallPostList _wallPostList;
  AdsTargetingList _adsTargetingList;

  StreamController<WallPostList> _wallPostController =
      StreamController<WallPostList>.broadcast();
  Stream<WallPostList> get outWallPostList => _wallPostController.stream;
  StreamController<WallPostRequest> _cmdWallPostController =
      StreamController<WallPostRequest>.broadcast();
  StreamSink<WallPostRequest> get getWallPostList =>
      _cmdWallPostController.sink;

  StreamController<AdsTargetingList> _adsTargetingController = StreamController<AdsTargetingList>.broadcast();
  Stream<AdsTargetingList> get outAdsTargetingList => _adsTargetingController.stream;
  StreamController<AdsTargetingRequest> _cmdAdsTargetingController = StreamController<AdsTargetingRequest>.broadcast();
  StreamSink<AdsTargetingRequest> get getAdsTargetingList => _cmdAdsTargetingController.sink;

  CloneBloc() {
    print("CLONE BLOC CREATED");

    _wallPostController.stream.listen(_handleLogic);
    _adsTargetingController.stream.listen(_handleTargetingLogic);

    _cmdWallPostController.stream.listen((WallPostRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.wallGetById(req.postId).then((list) {
        _wallPostList = list;
        _wallPostController.sink.add(_wallPostList);
      });
    });

    _cmdAdsTargetingController.stream.listen((AdsTargetingRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.adsGetAdsTargeting(req.account.accountId.toString(), req.ad).then((list) {
        _adsTargetingList = list;
        _adsTargetingController.sink.add(_adsTargetingList);
      });
    });
  }

  void dispose() {
    _wallPostController.close();
    _cmdWallPostController.close();
    _adsTargetingController.close();
    _cmdAdsTargetingController.close();
    print("CLONE BLOC DISPOSED");
  }

  void _handleLogic(data) {
    _wallPostList = data;
  }

  void _handleTargetingLogic(data) {
    _adsTargetingList = data;
  }
}
