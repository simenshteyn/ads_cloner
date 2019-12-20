import 'dart:async';

import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:ads_cloner/models/wall_post_request.dart';

class CloneBloc implements BlocBase {
  WallPostList _wallPostList;

  StreamController<WallPostList> _wallPostController =
      StreamController<WallPostList>.broadcast();
  Stream<WallPostList> get outWallPostList => _wallPostController.stream;

  StreamController<WallPostRequest> _cmdWallPostController =
      StreamController<WallPostRequest>.broadcast();
  StreamSink<WallPostRequest> get getWallPostList =>
      _cmdWallPostController.sink;

  CloneBloc() {
    _wallPostController.stream.listen(_handleLogic);

    _cmdWallPostController.stream.listen((WallPostRequest req) {
      var vk = VkApi(userToken: req.vkAccessToken.token);
      vk.wallGetById(req.postId).then((list) {
        _wallPostList = list;
        print('clone bloc is ${list.wallPosts.length}');
        _wallPostController.sink.add(_wallPostList);
      });
    });
  }

  void dispose() {
    _wallPostController.close();
    _cmdWallPostController.close();
  }

  void _handleLogic(data) {
    _wallPostList = data;
  }
}