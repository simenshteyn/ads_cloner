import 'package:SmmHub/models/account.dart';
import 'package:SmmHub/models/campaign.dart';
import 'package:SmmHub/models/clients_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class AdsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Campaign campaign;
  final Client client;
  AdsRequest(this.vkAccessToken, this.account, this.campaign, this.client);
}
