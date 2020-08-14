import 'package:SmmHub/models/account.dart';
import 'package:SmmHub/models/create_ads_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class CreateAdsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final CreateAdsList createAdsList;
  CreateAdsRequest(this.vkAccessToken, this.account, this.createAdsList);
}
