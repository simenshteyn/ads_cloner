import 'dart:async';

import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/create_ad.dart';
import 'package:ads_cloner/models/wall_post.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';
import 'package:ads_cloner/api/vk_api.dart';

enum CloneType { text, pure }

class CloneTask {
  CloneType type;
  String value;

  CloneTask({this.type, this.value});
}

abstract class CloneFactory {
  Future<CreateAd> buildAd(Ad originalAd, AdTargeting adTargeting,
      AdLayout adLayout, WallPost adWallPost, CloneTask cloneTask);
}

class CloneTextFactory implements CloneFactory {
  VkApi vkApi;
  UploadedPhoto photoData;
  UploadedPhoto iconData;
  UploadedVideo videoData;

  CloneTextFactory(this.vkApi);

  Future<CreateAd> buildAd(Ad originalAd, AdTargeting adTargeting,
      AdLayout adLayout, WallPost adWallPost, CloneTask cloneTask) async {
    if (originalAd.isWallPostFormat) {
      var clonedWallPost = adWallPost.clone();
      if (clonedWallPost.hasPrettyCards) {
        await _cloneAndReplacePrettyCards(clonedWallPost, adWallPost);
      }

      var changedWallPostAdsStealth =
          await _replaceWallPostAdsStealthMessage(clonedWallPost, cloneTask);
      var createAd = CreateAd.bulder(
          originalAd, adLayout, adTargeting); //removed changedWallPostAdsStealth argument
      createAd.linkUrl = await _createAndGetLinkForWallPostAdsStealth(
          changedWallPostAdsStealth);
      return createAd;
    } else if (originalAd.isAdaptiveFormat) {
      var clonedAdLayout = adLayout.clone();
      clonedAdLayout.description = cloneTask.value;
      await _createAndUploadIcon(clonedAdLayout);

      if (clonedAdLayout.isAdaptiveVideoAdFormat) {
        await _createAndUploadVideo(clonedAdLayout);
      } else {
        await _createAndUploadPhoto(clonedAdLayout);
      }

      var createAd =
          CreateAd.bulder(originalAd, clonedAdLayout, adTargeting); //replacedbulder
      return createAd;
    } else {
      return CreateAd();
    }
  }

  Future<void> _cloneAndReplacePrettyCards(
      WallPost clonedWallPost, WallPost originalWallPost) async {
    for (var attachment in clonedWallPost.attachments) {
      if (attachment.type == 'pretty_cards') {
        for (int i = 0; i < attachment.prettyCards.cards.length; i++) {
          var newCardResult = await vkApi.prettyCardsCreate(
              originalWallPost.ownerId.toString(),
              attachment.prettyCards.cards[i]);
          var newPrettyCard = await vkApi.prettyCardsGetById(newCardResult);
          attachment.prettyCards.cards[i]
              .updateFromPrettyCard(newPrettyCard.result[0]);
        }
      }
    }
  }

  Future<WallPostAdsStealth> _replaceWallPostAdsStealthMessage(
      WallPost clonedWallPost, CloneTask cloneTask) async {
    var wallPostAdsStealth = WallPostAdsStealth.fromWallPost(clonedWallPost);
    wallPostAdsStealth.message = cloneTask.value;
    return wallPostAdsStealth;
  }

  Future<String> _createAndGetLinkForWallPostAdsStealth(
      WallPostAdsStealth wallPostAdsStealth) async {
    var newStealth = await vkApi.wallPostAdsStealth(wallPostAdsStealth);
    var link = newStealth.wallLink(wallPostAdsStealth);
    return link;
  }

  Future<void> _createAndUploadIcon(AdLayout adLayout) async {
    if (iconData == null) {
      iconData = await vkApi.uploadPhotoFromUrl(adLayout.iconSrc2x, 11, 1);
    }
    adLayout.iconSrc = iconData.photo;
  }

  Future<void> _createAndUploadVideo(AdLayout adLayout) async {
    if (videoData == null) {
      videoData = await vkApi.uploadVideoFromUrl(adLayout.videoSrc720);
    }
    adLayout.videoSrc720 = videoData.videoData; //use720 this time TODO
  }

  Future<void> _createAndUploadPhoto(AdLayout adLayout) async {
    if (photoData == null) {
      photoData = await vkApi.uploadPhotoFromUrl(adLayout.imageSrc2x, 11);
    }
    adLayout.imageSrc = photoData.photo;
  }
}
