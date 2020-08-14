import 'package:SmmHub/models/account.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class ClientsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  ClientsRequest(this.vkAccessToken, this.account);
}