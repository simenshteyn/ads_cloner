import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class CreateAdsRequest {
  final VKAccessToken vkAccessToken;
  final CreateAdsList data;
  CreateAdsRequest(this.vkAccessToken, this.data);
}
