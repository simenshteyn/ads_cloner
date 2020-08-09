import 'package:ads_cloner/models/account.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/campaign.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';

class UpdateCampaignsRequest {
  final VKAccessToken vkAccessToken;
  final Account account;
  final Campaign campaign;
  final int status;
  UpdateCampaignsRequest(
      this.vkAccessToken, this.account, this.campaign, this.status);
}
