import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:ads_cloner/models/campaign.dart';
import 'package:ads_cloner/models/campaigns_list.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:ads_cloner/models/create_ads_result_list.dart';
import 'package:ads_cloner/models/pretty_card_create_result.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';
import 'package:ads_cloner/models/wall_post_adsstealth_result.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:flutter/foundation.dart';

class VkApi {
  final baseUrl = 'api.vk.com';
  final apiVersion = '5.103';
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
    final _map = jsonDecode(response);
    AccountsList listOfAccounts = AccountsList.fromJson(_map);
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
    final _map = jsonDecode(response);
    CampaignsList listOfCampaigns = CampaignsList.fromJson(_map);
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
    final _map = jsonDecode(response);
    AdsList listOfAds = AdsList.fromJson(_map);
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
    final _map = jsonDecode(response);
    AdsLayoutList listOfAdsLayout = AdsLayoutList.fromJson(_map);
    return listOfAdsLayout;
  }

  Future<AdsLayoutList> adsGetCampaignLayout(String accountId, Campaign campaign) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.getAdsLayout',
      <String, String>{
        'account_id': accountId,
        'campaign_ids': '[${campaign.id}]',
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    AdsLayoutList listOfAdsLayout = AdsLayoutList.fromJson(_map);
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
    final _map = jsonDecode(response);
    AdsTargetingList listOfAdsTargeting = AdsTargetingList.fromJson(_map);
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
    debugPrint(response, wrapWidth: 1024);
    final _map = jsonDecode(response);
    WallPostList listOfWallPost = WallPostList.fromJson(_map);
    return listOfWallPost;
  }

  Future<CreateAdsResultList> adsCreateAds(
      String accountId, CreateAdsList createAdsList) async {
    var uri = Uri.https(
      baseUrl,
      'method/ads.createAds',
      <String, String>{
        'account_id': accountId,
        'data': json.encode(createAdsList.toJson()),
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    CreateAdsResultList listOfCreateAdsResult =
        CreateAdsResultList.fromJson(_map);
    return listOfCreateAdsResult;
  }

  Future<WallPostAdsStealthResult> wallPostAdsStealth(
      WallPostAdsStealth wallPostAdsStealth) async {
    var baseMap = <String, String>{
      'access_token': userToken,
      'v': apiVersion,
    };
    var uri = Uri.https(
        baseUrl,
        'method/wall.postAdsStealth',
        <String, String>{}
          ..addAll(baseMap)
          ..addAll(wallPostAdsStealth.toMap()));
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    WallPostAdsStealthResult adsStealthResult =
        WallPostAdsStealthResult.fromJson(_map);
    return adsStealthResult;
  }

    Future<PrettyCardCreateResult> prettyCardsCreate(String ownerId, Card card) async {
      /// https://vk.com/dev/prettyCards.create more info
    var uri = Uri.https(
      baseUrl,
      'method/prettyCards.create',
      <String, String>{
        'owner_id': ownerId,
        'photo': card.photo,
        'title': card.title,
        'link': card.linkUrl,
        'price': card.price, //не передавать чтобы не указывать, 0 - бесплатно
        'price_old': card.priceOld,
        'button': card.button.title, //не передавать если без кнопки
        'access_token': userToken,
        'v': apiVersion,
      }..removeWhere((key, value) => key == null || value == null),
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    PrettyCardCreateResult prettyCardCreateResult =
        PrettyCardCreateResult.fromJson(_map);
    return prettyCardCreateResult;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return await response.transform(utf8.decoder).join();
  }
}
