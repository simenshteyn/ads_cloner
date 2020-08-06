import 'dart:async';
import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/create_ads_request.dart';
import 'package:ads_cloner/models/create_ads_result_list.dart';
import 'package:ads_cloner/models/wall_post_adsstealth_request.dart';
import 'package:ads_cloner/models/wall_post_adsstealth_result.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';

class CloneBloc implements BlocBase {
  CreateAdsResultList _createAdsResultList;
  WallPostAdsStealthResult _wallPostAdsStealthResult;
  WallPostList _wallPostList;

  StreamController<CreateAdsResultList> _createAdsResultController =
      StreamController<CreateAdsResultList>.broadcast();
  Stream<CreateAdsResultList> get outCreateAdsResultList =>
      _createAdsResultController.stream;
  StreamController<CreateAdsRequest> _cmdCreateAdsResultController =
      StreamController<CreateAdsRequest>.broadcast();
  StreamSink<CreateAdsRequest> get getCreateAdsResultList =>
      _cmdCreateAdsResultController.sink;

  StreamController<WallPostAdsStealthResult>
      _wallPostAdsStealthResultController =
      StreamController<WallPostAdsStealthResult>.broadcast();
  Stream<WallPostAdsStealthResult> get outWallPostAdsStealthResult =>
      _wallPostAdsStealthResultController.stream;
  StreamController<WallPostAdsStealthRequest> _cmdWallPostAdsStealthController =
      StreamController<WallPostAdsStealthRequest>.broadcast();
  StreamSink<WallPostAdsStealthRequest> get getWallPostAdsStealthResult =>
      _cmdWallPostAdsStealthController.sink;

  StreamController<WallPostList> _wallPostController =
      StreamController<WallPostList>.broadcast();
  Stream<WallPostList> get outWallPostList => _wallPostController.stream;
  StreamController<WallPostRequest> _cmdWallPostController =
      StreamController<WallPostRequest>.broadcast();
  StreamSink<WallPostRequest> get getWallPostList =>
      _cmdWallPostController.sink;

  CloneBloc() {
    print("CLONE BLOC CREATED");

    _createAdsResultController.stream.listen(_handleCreateAdsResultLogic);
    _wallPostAdsStealthResultController.stream
        .listen(_handleWallPostAdsStealthResultLogic);

    _cmdCreateAdsResultController.stream.listen((CreateAdsRequest req) async {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      var createAdsList = CreateAdsResultList([]);
      switch (req.createAdsList.createAdsList[0].adFormat) {
        //TODO: more deep check in later
        case 11:
          {
            for (var chunk in req.createAdsList.getCreateAdsListInChunks(5)) {
              await vk.delayBetweenApiRequests(2000);
              await vk
                  .adsCreateAds(req.account.accountId.toString(), chunk)
                  .then((list) {
                createAdsList.appendList(list);
              });
            }
            _createAdsResultController.sink.add(createAdsList);
            break;
          }
        default:
          {
            for (var chunk in req.createAdsList.getCreateAdsListInChunks(5)) {
              await vk.delayBetweenApiRequests(2000);
              await vk
                  .adsCreateAds(req.account.accountId.toString(), chunk)
                  .then((list) {
                createAdsList.appendList(list);
              });
            }
            _createAdsResultController.sink.add(createAdsList);
          }
      }
    });

    _cmdWallPostAdsStealthController.stream
        .listen((WallPostAdsStealthRequest req) async {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      await vk.wallPostAdsStealth(req.wallPostAdsStealth).then((list) {
        _wallPostAdsStealthResult = list;
        _wallPostAdsStealthResultController.sink.add(_wallPostAdsStealthResult);
      });
    });

    _wallPostController.stream.listen(_handleLogic);

    _cmdWallPostController.stream.listen((WallPostRequest req) async {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      await vk.wallGetById(req.postId).then((list) {
        _wallPostList = list;
        _wallPostController.sink.add(_wallPostList);
      });
    });
  }

  void dispose() {
    _createAdsResultController.close();
    _cmdCreateAdsResultController.close();
    _wallPostAdsStealthResultController.close();
    _cmdWallPostAdsStealthController.close();
    _wallPostController.close();
    _cmdWallPostController.close();
    print("CLONE BLOC DISPOSED");
  }

  void _handleLogic(data) {
    _wallPostList = data;
  }

  void _handleCreateAdsResultLogic(data) {
    _createAdsResultList = data;
  }

  void _handleWallPostAdsStealthResultLogic(data) {
    _wallPostAdsStealthResult = data;
  }
}
