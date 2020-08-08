import 'package:ads_cloner/models/account.dart';
import 'package:ads_cloner/models/campaign.dart';
import 'package:ads_cloner/models/clients_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class AdsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Campaign campaign;
  final Client client;
  AdsRequest(this.vkAccessToken, this.account, this.campaign, this.client);
}
