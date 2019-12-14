import 'package:ads_cloner/models/campaign.dart';
import 'dart:convert' show jsonDecode;

class CampaignsList {
  List<Campaign> campaigns;

  CampaignsList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    campaigns = [];
    final List _campaignsList = _map['response'];
    for (var campaign in _campaignsList) {
      campaigns.add(Campaign.fromJSON(campaign));
    }
  }
}