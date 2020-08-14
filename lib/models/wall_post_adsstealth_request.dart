import 'package:SmmHub/models/wall_post_adsstealth.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class WallPostAdsStealthRequest {
  final VKAccessToken vkAccessToken;
  final WallPostAdsStealth wallPostAdsStealth;
  WallPostAdsStealthRequest(this.vkAccessToken, this.wallPostAdsStealth);
}
