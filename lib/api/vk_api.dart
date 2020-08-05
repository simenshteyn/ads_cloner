import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
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
import 'package:ads_cloner/models/pretty_card_list.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';
import 'package:ads_cloner/models/wall_post_adsstealth_result.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class VkApi {
  final baseUrl = 'api.vk.com';
  final apiVersion = '5.103';
  final userToken;
  final _httpClient = HttpClient();

  VkApi({this.userToken});

  Future _delayBetweenApiRequests([int time = 250]) {
    return Future.delayed(Duration(milliseconds: time));
  }

  Future delayBetweenApiRequests([int time = 250]) {
    return Future.delayed(Duration(milliseconds: time));
  }

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
    await _delayBetweenApiRequests();
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
    await _delayBetweenApiRequests();
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

  Future<AdsLayoutList> adsGetCampaignLayout(
      String accountId, Campaign campaign) async {
    await _delayBetweenApiRequests();
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
    await _delayBetweenApiRequests();
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
    await _delayBetweenApiRequests();
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
    await _delayBetweenApiRequests();

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
    print('CREATE: ${createAdsList.toJson()}');
    var response = await _getRequest(uri);
    //print(uri);
    debugPrint(uri.toString(), wrapWidth: 1024);
    print(response);
    final _map = jsonDecode(response);
    CreateAdsResultList listOfCreateAdsResult =
        CreateAdsResultList.fromJson(_map);
    return listOfCreateAdsResult;
  }

  Future<WallPostAdsStealthResult> wallPostAdsStealth(
      WallPostAdsStealth wallPostAdsStealth) async {
    await _delayBetweenApiRequests();
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

  Future<PrettyCardCreateResult> prettyCardsCreate(
      String ownerId, Card card) async {
    /// https://vk.com/dev/prettyCards.create more info
    await _delayBetweenApiRequests();
    var uri = Uri.https(
      baseUrl,
      'method/prettyCards.create',
      <String, String>{
        'owner_id': ownerId,
        'photo': card.photo,
        'title': card.title,
        'link': card.linkUrl,
        'price':
            card.clearPrice, //не передавать чтобы не указывать, 0 - бесплатно
        'price_old': card.clearPriceOld,
        'button': card.prettyCardButton, //не передавать если без кнопки
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

  Future<PrettyCardList> prettyCardsGetById(
      PrettyCardCreateResult cardCreateResult) async {
    /// https://vk.com/dev/prettyCards.getById more info
    await _delayBetweenApiRequests();
    var uri = Uri.https(
      baseUrl,
      'method/prettyCards.getById',
      <String, String>{
        'owner_id': cardCreateResult.result.ownerId.toString(),
        'card_ids': cardCreateResult.result.cardId.toString(),
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    PrettyCardList cardList = PrettyCardList.fromJson(_map);
    return cardList;
  }

  Future<CityList> databaseGetCitiesById(String idString) async {
    /// https://vk.com/dev/database.getCitiesById more info
    await _delayBetweenApiRequests();
    var uri = Uri.https(
      baseUrl,
      'method/database.getCitiesById',
      <String, String>{
        'city_ids': idString,
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    CityList cityList = CityList.fromJson(_map);
    return cityList;
  }

  Future<UploadUrl> adsGetUploadUrl(int adFormat, [int icon]) async {
    /// https://vk.com/dev/ads.getUploadURL more info
    await _delayBetweenApiRequests();
    var uri = Uri.https(
      baseUrl,
      'method/ads.getUploadURL',
      <String, String>{
        'ad_format': '${adFormat}',
        'icon': icon != null ? '${icon}' : null,
        'access_token': userToken,
        'v': apiVersion,
      }..removeWhere((key, value) => key == null || value == null),
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    UploadUrl uploadUrl = UploadUrl.fromJson(_map);
    return uploadUrl;
  }

  Future<UploadUrl> adsGetVideoUploadUrl() async {
    /// https://vk.com/dev/ads.getVideoUploadURL more info
    await _delayBetweenApiRequests();
    var uri = Uri.https(
      baseUrl,
      'method/ads.getVideoUploadURL',
      <String, String>{
        'access_token': userToken,
        'v': apiVersion,
      },
    );
    var response = await _getRequest(uri);
    print(uri);
    print(response);
    final _map = jsonDecode(response);
    UploadUrl uploadUrl = UploadUrl.fromJson(_map);
    return uploadUrl;
  }

  Future<Uint8List> _getBytesFromImageUrl(String url) async {
    http.Response response = await http.get(
      url,
    );
    return response.bodyBytes;
  }

  Future<UploadedPhoto> uploadPhotoFromUrl(String url, int adFormat,
      [int icon]) async {
    /// https://vk.com/dev/upload_photo_ads more info
    await _delayBetweenApiRequests();
    var imageBytes = await _getBytesFromImageUrl(url);
    var uploadUrl = await adsGetUploadUrl(adFormat, icon);
    var response = await _postImageRequest(uploadUrl.uploadUrl, imageBytes);
    print(response);
    final map = jsonDecode(response);
    UploadedPhoto result = UploadedPhoto.fromJson(map);
    print(result.photo);
    return result;
  }

  Future<UploadedVideo> uploadVideoFromUrl(String url) async {
    /// https://vk.com/dev/upload_photo_ads more info
    await _delayBetweenApiRequests();
    var videoBytes = await _getBytesFromImageUrl(url);
    var uploadUrl = await adsGetVideoUploadUrl();
    var response = await _postVideoRequest(uploadUrl.uploadUrl, videoBytes);
    print(response);
    final map = jsonDecode(response);
    UploadedVideo result = UploadedVideo.fromJson(map);
    print(result.videoData);
    return result;
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();
    return (response.statusCode == 200)
        ? await response.transform(utf8.decoder).join()
        : '{"error": {"error_code": ${response.statusCode}, "error_msg": "HTTP request problem: ${response.reasonPhrase}"}}';
  }

  Future<String> _postImageRequest(String uri, Uint8List bytes) async {
    var uploadUrl = Uri.parse(uri);
    var request = http.MultipartRequest('POST', uploadUrl);
    var multipartFile = http.MultipartFile.fromBytes('file', bytes as List<int>,
        contentType: MediaType('image', 'jpeg'), filename: 'file.jpg');
    request.files.add(multipartFile);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return (response.statusCode == 200)
        ? response.body
        : '{"error": {"error_code": ${response.statusCode}, "error_msg": "POST request problem: ${response.reasonPhrase}"}}';
  }

  Future<String> _postVideoRequest(String uri, Uint8List bytes) async {
    var uploadUrl = Uri.parse(uri);
    var request = http.MultipartRequest('POST', uploadUrl);
    var multipartFile = http.MultipartFile.fromBytes(
        'video_file', bytes as List<int>,
        contentType: MediaType('video', 'mp4'), filename: 'file.mp4');
    request.files.add(multipartFile);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return (response.statusCode == 200)
        ? response.body
        : '{"error": {"error_code": ${response.statusCode}, "error_msg": "POST request problem: ${response.reasonPhrase}"}}';
  }
}
