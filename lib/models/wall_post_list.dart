import 'package:ads_cloner/models/ad.dart';
import 'dart:convert' show jsonDecode;
import 'package:ads_cloner/models/wall_post.dart';

class WallPostList {
  List<WallPost> wallPosts;

  WallPostList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    wallPosts = [];
    final List _wallPosts = _map['response'];
    for (var post in _wallPosts) {
      wallPosts.add(WallPost.fromJSON(post));
    }
  }
}