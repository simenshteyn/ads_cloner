import 'package:ads_cloner/models/account.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class UpdateAdsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Ad ad;
  final int status;
  UpdateAdsRequest(this.vkAccessToken, this.account, this.ad, this.status);
}