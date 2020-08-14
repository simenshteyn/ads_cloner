import 'package:SmmHub/models/account.dart';
import 'package:SmmHub/models/ad.dart';
import 'package:SmmHub/models/clients_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class AdsLayoutRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Ad ad;
  final Client client;
  AdsLayoutRequest(this.vkAccessToken, this.account, this.ad, this.client);
}
