import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/models/campaigns_list.dart';

class VkApi {
  final baseUrl = 'api.vk.com';
  final apiVersion = '5.96';
  final userToken;
  final _httpClient = HttpClient();

  VkApi({this.userToken});

  Future<AccountsList> adsGetAccounts() async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.getAccounts',
      <String, String>{
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    AccountsList listOfAccounts = AccountsList.fromJSON(response);
    return listOfAccounts;
  }

  Future<CampaignsList> adsGetCampaigns(String accountId) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.getCampaigns',
      <String, String>{
        'account_id': accountId,
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    print('URI 2 is ${uri}');
    var response = await _getRequest(uri);
    CampaignsList listOfCampaigns = CampaignsList.fromJSON(response);
    return listOfCampaigns;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return response.transform(utf8.decoder).join();
  }
}
