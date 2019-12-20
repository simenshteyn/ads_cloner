import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class WallPostRequest {
  final VKAccessToken vkAccessToken;
  final String postId;
  WallPostRequest(this.vkAccessToken, this.postId);
}
