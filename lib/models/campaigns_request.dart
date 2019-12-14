import 'package:ads_cloner/models/account.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class CampaignsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  CampaignsRequest(this.vkAccessToken, this.account);
}