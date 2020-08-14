import 'package:SmmHub/models/account.dart';
import 'package:SmmHub/models/ad.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class DeleteAdsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Ad ad;
  DeleteAdsRequest(this.vkAccessToken, this.account, this.ad);
}