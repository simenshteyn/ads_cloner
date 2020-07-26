import 'dart:async';
import 'package:ads_cloner/blocs/bloc_provider.dart';
import 'package:ads_cloner/models/account.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/campaign.dart';
import 'package:ads_cloner/models/create_ad.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:ads_cloner/models/wall_post.dart';
import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:flutter_vk_sdk/models/vk_access_token.dart';
import 'package:ads_cloner/models/accounts_list.dart';
import 'package:ads_cloner/models/campaigns_list.dart';

class ApplicationBloc implements BlocBase {
  VKAccessToken vkAccessToken;
  AccountsList accountsList;
  CampaignsList campaignsList;
  Account currentAccount;
  Campaign currentCampaign;
  Ad currentAd;
  AdLayout currentAdLayout;
  AdTargeting currentAdTargeting;
  String currentPostId;
  CreateAdsList currentCreateAdsList;
  WallPost currentWallPost;

  StreamController<VKAccessToken> _tokenController =
      StreamController<VKAccessToken>.broadcast();
  StreamSink<VKAccessToken> get inVkAccessToken => _tokenController.sink;
  Stream<VKAccessToken> get outVkAccessToken => _tokenController.stream;
  StreamController _cmdTokenController = StreamController();
  StreamSink get getVkAccessToken => _cmdTokenController.sink;

  StreamController<AccountsList> _accountsController =
      StreamController<AccountsList>.broadcast();
  StreamSink<AccountsList> get inAccountsList => _accountsController.sink;
  Stream<AccountsList> get outAccountsList => _accountsController.stream;
  StreamController _cmdAccountsController = StreamController();
  StreamSink get getAccountsList => _cmdAccountsController.sink;

  StreamController<CampaignsList> _campaignsController =
      StreamController<CampaignsList>.broadcast();
  StreamSink<CampaignsList> get inCampaignsList => _campaignsController.sink;
  Stream<CampaignsList> get outCampaignsList => _campaignsController.stream;
  StreamController _cmdCampaignsController = StreamController();
  StreamSink get getCampaignsList => _cmdCampaignsController.sink;

  StreamController<Account> _currentAccountController =
      StreamController<Account>.broadcast();
  StreamSink<Account> get inCurrentAccount => _currentAccountController.sink;
  Stream<Account> get outCurrentAccount => _currentAccountController.stream;
  StreamController _cmdCurrentAccountController = StreamController();
  StreamSink get getCurrentAccount => _cmdCurrentAccountController.sink;

  StreamController<Campaign> _currentCampaignController =
      StreamController<Campaign>.broadcast();
  StreamSink<Campaign> get inCurrentCampaign => _currentCampaignController.sink;
  Stream<Campaign> get outCurrentCampaign => _currentCampaignController.stream;
  StreamController _cmdCurrentCampaignController = StreamController();
  StreamSink get getCurrentCampaign => _cmdCurrentCampaignController.sink;

  StreamController<Ad> _currentAdController = StreamController<Ad>.broadcast();
  StreamSink<Ad> get inCurrentAd => _currentAdController.sink;
  Stream<Ad> get outCurrentAd => _currentAdController.stream;
  StreamController _cmdCurrentAdController = StreamController();
  StreamSink get getCurrentAd => _cmdCurrentAdController.sink;

  StreamController<AdLayout> _currentAdLayoutController =
      StreamController<AdLayout>.broadcast();
  StreamSink<AdLayout> get inCurrentAdLayout => _currentAdLayoutController.sink;
  Stream<AdLayout> get outCurrentAdLayout => _currentAdLayoutController.stream;
  StreamController _cmdCurrentAdLayoutController = StreamController();
  StreamSink get getCurrentAdLayout => _cmdCurrentAdLayoutController.sink;

  StreamController<AdTargeting> _currentAdTargetingController =
      StreamController<AdTargeting>.broadcast();
  StreamSink<AdTargeting> get inCurrentAdTargeting =>
      _currentAdTargetingController.sink;
  Stream<AdTargeting> get outCurrentAdTargeting =>
      _currentAdTargetingController.stream;
  StreamController _cmdCurrentAdTargetingController = StreamController();
  StreamSink get getCurrentAdTargeting => _cmdCurrentAdTargetingController.sink;

  StreamController<String> _currentPostIdController =
      StreamController<String>.broadcast();
  StreamSink<String> get inCurrentPostId => _currentPostIdController.sink;
  Stream<String> get outCurrentPostId => _currentPostIdController.stream;
  StreamController _cmdCurrentPostIdController = StreamController();
  StreamSink get getCurrentPostId => _cmdCurrentPostIdController.sink;

  StreamController<CreateAdsList> _currentCreateAdsListController =
      StreamController<CreateAdsList>.broadcast();
  StreamSink<CreateAdsList> get inCurrentAdsList =>
      _currentCreateAdsListController.sink;
  Stream<CreateAdsList> get outCurrentCreateAdsList =>
      _currentCreateAdsListController.stream;
  StreamController _cmdCurrentCreateAdsListController = StreamController();
  StreamSink get appendToCurrentCreateAdsList =>
      _cmdCurrentCreateAdsListController.sink;

  StreamController<WallPost> _currentWallPostController =
      StreamController<WallPost>.broadcast();
  StreamSink<WallPost> get inCurrentWallPost => _currentWallPostController.sink;
  Stream<WallPost> get outCurrentWallPost => _currentWallPostController.stream;
  StreamController _cmdCurrentWallPostController = StreamController();
  StreamSink get getCurrentWallPost => _cmdCurrentWallPostController.sink;

  ApplicationBloc() {
    print("APP BLOC CREATED");

    _tokenController.stream.listen(_handleLogicTokenController);
    _cmdTokenController.stream.listen((token) {
      _tokenController.sink.add(token);
    });

    _accountsController.stream.listen(_handleAccountsController);
    _cmdAccountsController.stream.listen((accounts) {
      _accountsController.sink.add(accounts);
    });

    _campaignsController.stream.listen(_handleCampaignsController);
    _cmdCampaignsController.stream.listen((campaigns) {
      _campaignsController.sink.add(campaigns);
    });

    _currentAccountController.stream.listen(_handleCurrentAccountController);
    _cmdCurrentAccountController.stream.listen((account) {
      _currentAccountController.sink.add(account);
    });

    _currentCampaignController.stream.listen(_handleCurrentCampaignController);
    _cmdCurrentCampaignController.stream.listen((campaign) {
      _currentCampaignController.sink.add(campaign);
    });

    _currentAdController.stream.listen(_handleCurrentAdController);
    _cmdCurrentAdController.stream.listen((ad) {
      _currentAdController.sink.add(ad);
    });

    _currentAdLayoutController.stream.listen(_handleCurrentAdLayoutController);
    _cmdCurrentAdLayoutController.stream.listen((adLayout) {
      _currentAdLayoutController.sink.add(adLayout);
    });

    _currentAdTargetingController.stream
        .listen(_handleCurrentAdTargetingController);
    _cmdCurrentAdTargetingController.stream.listen((adTargeting) {
      _currentAdTargetingController.sink.add(adTargeting);
    });

    _currentPostIdController.stream.listen(_handleCurrentPostIdController);
    _cmdCurrentPostIdController.stream.listen((postId) {
      _currentPostIdController.sink.add(postId);
    });

    _currentCreateAdsListController.stream
        .listen(_handleCurrentCreateAdsListController);
    _cmdCurrentCreateAdsListController.stream.listen((createAd) {
      var list = currentCreateAdsList;
      list.appendAd(createAd);
      _currentCreateAdsListController.sink.add(list);
    });

    _currentWallPostController.stream.listen(_handleCurrentWallPostController);
    _cmdCurrentWallPostController.stream.listen((wallPost) {
      _currentWallPostController.sink.add(wallPost);
    });
  }

  void dispose() {
    print("APP BLOC DISPOSED");

    _tokenController.close();
    _cmdTokenController.close();
    _accountsController.close();
    _cmdAccountsController.close();
    _campaignsController.close();
    _cmdCampaignsController.close();
    _currentAccountController.close();
    _cmdCurrentAccountController.close();
    _currentCampaignController.close();
    _cmdCurrentCampaignController.close();
    _currentAdController.close();
    _cmdCurrentAdController.close();
    _currentAdLayoutController.close();
    _cmdCurrentAdLayoutController.close();
    _currentAdTargetingController.close();
    _cmdCurrentAdTargetingController.close();
    _currentPostIdController.close();
    _cmdCurrentPostIdController.close();
    _currentCreateAdsListController.close();
    _cmdCurrentCreateAdsListController.close();
    _currentWallPostController.close();
    _cmdCurrentWallPostController.close();
  }

  void _handleLogicTokenController(data) {
    vkAccessToken = data;
  }

  void _handleAccountsController(data) {
    accountsList = data;
  }

  void _handleCampaignsController(data) {
    campaignsList = data;
  }

  void _handleCurrentAccountController(data) {
    currentAccount = data;
  }

  void _handleCurrentCampaignController(data) {
    currentCampaign = data;
  }

  void _handleCurrentAdController(data) {
    currentAd = data;
  }

  void _handleCurrentAdLayoutController(data) {
    currentAdLayout = data;
  }

  void _handleCurrentAdTargetingController(data) {
    currentAdTargeting = data;
  }

  void _handleCurrentPostIdController(data) {
    currentPostId = data;
  }

  void _handleCurrentCreateAdsListController(data) {
    currentCreateAdsList = data;
  }

  void _handleCurrentWallPostController(data) {
    currentWallPost = data;
  }
}
