import 'package:ads_cloner/models/account.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class AdsLayoutRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Ad ad;
  AdsLayoutRequest(this.vkAccessToken, this.account, this.ad);
}
