import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:ads_cloner/models/accounts_list.dart';

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

    print('URI is ${uri}');

    var response = await _getRequest(uri);

    AccountsList listOfAccounts = AccountsList.fromJSON(response);

    return listOfAccounts;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return response.transform(utf8.decoder).join();
  }
}
