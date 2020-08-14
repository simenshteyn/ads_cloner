import 'package:SmmHub/models/account.dart';
import 'package:SmmHub/models/clients_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class CampaignsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Client client;
  CampaignsRequest(this.vkAccessToken, this.account, this.client);
}
