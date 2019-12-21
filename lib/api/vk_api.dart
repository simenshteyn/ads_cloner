import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/campaigns_list.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:ads_cloner/models/wall_post_list.dart';

class VkApi {
  final baseUrl = 'api.vk.com';
  final apiVersion = '5.101';
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
    print(uri);
    print(response);
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
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    CampaignsList listOfCampaigns = CampaignsList.fromJSON(response);
    return listOfCampaigns;
  }

  Future<AdsList> adsGetAds(String accountId, int campaignId) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.getAds',
      <String, String>{
        'account_id': accountId,
        'campaign_ids': '[${campaignId}]',
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    AdsList listOfAds = AdsList.fromJSON(response);
    return listOfAds;
  }

  Future<AdsLayoutList> adsGetAdsLayout(String accountId, Ad ad) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.getAdsLayout',
      <String, String>{
        'account_id': accountId,
        'campaign_ids': '[${ad.campaignId}]',
        'ad_ids': '[${ad.id}]',
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    AdsLayoutList listOfAdsLayout = AdsLayoutList.fromJSON(response);
    return listOfAdsLayout;
  }

  Future<AdsTargetingList> adsGetAdsTargeting(String accountId, Ad ad) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.getAdsTargeting',
      <String, String>{
        'account_id': accountId,
        'campaign_ids': '[${ad.campaignId}]',
        'ad_ids': '[${ad.id}]',
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    AdsTargetingList listOfAdsTargeting = AdsTargetingList.fromJSON(response);
    return listOfAdsTargeting;
  }

  Future<WallPostList> wallGetById(String postId) async {
    var uri = Uri.https(
      baseUrl,
      'method/wall.getById',
      <String, String>{
        'posts': postId,
        'copy_history_depth': '1',
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    WallPostList listOfWallPost = WallPostList.fromJSON(response);
    return listOfWallPost;
  }

    Future<CreateAdsResultList> adsCreateAds(String accountId, CreateAdsList createAdsList) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.createAds',
      <String, String>{
        'account_id': accountId,
        'data': createAdsList,
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    CreateAdsResultList listOfCreateAdsResult = CreateAdsResultList.fromJSON(response);
    return listOfCreateAdsResult;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return await response.transform(utf8.decoder).join();
  }
}
