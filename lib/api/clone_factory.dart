import 'dart:async';

import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/create_ad.dart';
import 'package:ads_cloner/models/wall_post.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';
import 'package:ads_cloner/api/vk_api.dart';

enum CloneType { text, pure, image, age }

class CloneTask {
  CloneType type;
  dynamic value; //changed this from string

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
      var createAd = CreateAd.bulder(originalAd, adLayout, adTargeting);
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
        await _createAndUploadPhoto(clonedAdLayout, 11);
      }

      var createAd = CreateAd.bulder(
          originalAd, clonedAdLayout, adTargeting); //replacedbulder
      return createAd;
    } else if (originalAd.isImageTextFormat) {
      var clonedAdLayout = adLayout.clone();
      clonedAdLayout.description = cloneTask.value;
      await _createAndUploadPhoto(clonedAdLayout, 1);
      var createAd = CreateAd.bulder(originalAd, clonedAdLayout, adTargeting);
      return createAd;
    } else if (originalAd.isBigImageFormat) {
      var clonedAdLayout = adLayout.clone();
      clonedAdLayout.title = cloneTask.value;
      await _createAndUploadPhoto(clonedAdLayout, 2);
      var createAd = CreateAd.bulder(originalAd, clonedAdLayout, adTargeting);
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
    if (newStealth.errorResponse != null) {
      print(newStealth.errorResponse.errorMsg);
      throw Exception(newStealth.errorResponse.errorMsg);
    }
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

  Future<void> _createAndUploadPhoto(AdLayout adLayout, int adFormat) async {
    if (photoData == null) {
      if (adFormat == 2) {
        photoData = await vkApi.uploadPhotoFromUrl(adLayout.imageSrc, adFormat);
      } else {
        photoData =
            await vkApi.uploadPhotoFromUrl(adLayout.imageSrc2x, adFormat);
      }
    }
    adLayout.imageSrc = photoData.photo;
  }
}

class CloneImageFactory implements CloneFactory {
  VkApi vkApi;
  UploadedPhoto photoData;
  UploadedPhoto iconData;
  UploadedVideo videoData;

  CloneImageFactory(this.vkApi);

  Future<CreateAd> buildAd(Ad originalAd, AdTargeting adTargeting,
      AdLayout adLayout, WallPost adWallPost, CloneTask cloneTask) async {
    if (originalAd.isWallPostFormat) {
      var clonedWallPost = adWallPost.clone();
      // if (clonedWallPost.hasPrettyCards) {
      //   await _cloneAndReplacePrettyCards(clonedWallPost, adWallPost);
      // }

      //  photos.getWallUploadServer https://vk.com/dev/photos.saveWallPhoto

      var changedWallPostAdsStealth =
          await _replaceWallPostAdsStealthPhoto(clonedWallPost, cloneTask);
      var createAd = CreateAd.bulder(originalAd, adLayout, adTargeting);
      createAd.linkUrl = await _createAndGetLinkForWallPostAdsStealth(
          changedWallPostAdsStealth);
      return createAd;
    }
    if (originalAd.isAdaptiveFormat) {
      var clonedAdLayout = adLayout.clone();

      await _createAndUploadIcon(clonedAdLayout);
      photoData = await vkApi.uploadPhotoFromFile(cloneTask.value, 11);
      clonedAdLayout.imageSrc = photoData.photo;

      //   await _createAndUploadVideo(clonedAdLayout);
      // } else {
      //   await _createAndUploadPhoto(clonedAdLayout, 11);
      // }

      var createAd = CreateAd.bulder(
          originalAd, clonedAdLayout, adTargeting); //replacedbulder
      if (clonedAdLayout.isAdaptiveVideoAdFormat) {
        createAd.video = null;
      }
      return createAd;
    } else if (originalAd.isImageTextFormat) {
      var clonedLayout = adLayout.clone();
      photoData = await vkApi.uploadPhotoFromFile(cloneTask.value, 1);
      clonedLayout.imageSrc = photoData.photo;
      var createAd = CreateAd.bulder(originalAd, clonedLayout, adTargeting);
      return createAd;
    } else if (originalAd.isBigImageFormat) {
      var clonedLayout = adLayout.clone();
      photoData = await vkApi.uploadPhotoFromFile(cloneTask.value, 2);
      clonedLayout.imageSrc = photoData.photo;
      var createAd = CreateAd.bulder(originalAd, clonedLayout, adTargeting);
      return createAd;
    } else {
      return CreateAd(); // change this later
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

  Future<WallPostAdsStealth> _replaceWallPostAdsStealthPhoto(
      WallPost clonedWallPost, CloneTask cloneTask) async {
    var wallPostAdsStealth = WallPostAdsStealth.fromWallPost(clonedWallPost);
    var wallUploadedPhotoInfo =
        await vkApi.photosGetWallUploadServer(cloneTask.value);
    var uploadResult = await vkApi.photosSaveWallPhoto(wallUploadedPhotoInfo);
    wallPostAdsStealth.linkImage = uploadResult.photos[0].sizes
        .firstWhere((element) => element.type == 'x')
        .url; //TODO somechecks, may be
    return wallPostAdsStealth;
  }

  Future<String> _createAndGetLinkForWallPostAdsStealth(
      WallPostAdsStealth wallPostAdsStealth) async {
    var newStealth = await vkApi.wallPostAdsStealth(wallPostAdsStealth);
    if (newStealth.errorResponse != null) {
      print(newStealth.errorResponse.errorMsg);
      throw Exception(newStealth.errorResponse.errorMsg);
    }
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

  Future<void> _createAndUploadPhoto(AdLayout adLayout, int adFormat) async {
    if (photoData == null) {
      if (adFormat == 2) {
        photoData = await vkApi.uploadPhotoFromUrl(adLayout.imageSrc, adFormat);
      } else {
        photoData =
            await vkApi.uploadPhotoFromUrl(adLayout.imageSrc2x, adFormat);
      }
    }
    adLayout.imageSrc = photoData.photo;
  }
}

class CloneAgeFactory implements CloneFactory {
  VkApi vkApi;
  UploadedPhoto photoData;
  UploadedPhoto iconData;
  UploadedVideo videoData;

  CloneAgeFactory(this.vkApi);

  Future<CreateAd> buildAd(Ad originalAd, AdTargeting adTargeting,
      AdLayout adLayout, WallPost adWallPost, CloneTask cloneTask) async {
    if (originalAd.isWallPostFormat) {
      var clonedWallPost = adWallPost.clone();
      if (clonedWallPost.hasPrettyCards) {
        await _cloneAndReplacePrettyCards(clonedWallPost, adWallPost);
      }

      var changedWallPostAdsStealth =
          WallPostAdsStealth.fromWallPost(clonedWallPost);
      var newAdTargeting = adTargeting.clone();
      _changeTargetingAge(newAdTargeting, cloneTask);
      var createAd = CreateAd.bulder(originalAd, adLayout, newAdTargeting);
      createAd.linkUrl = await _createAndGetLinkForWallPostAdsStealth(
          changedWallPostAdsStealth);
      _addPostfixToAdName(createAd, cloneTask);

      return createAd;
    } else if (originalAd.isAdaptiveFormat) {
      var clonedAdLayout = adLayout.clone();
      await _createAndUploadIcon(clonedAdLayout);

      if (clonedAdLayout.isAdaptiveVideoAdFormat) {
        await _createAndUploadVideo(clonedAdLayout);
      } else {
        await _createAndUploadPhoto(clonedAdLayout, 11);
      }
      var newAdTargeting = adTargeting.clone();
      _changeTargetingAge(newAdTargeting, cloneTask);
      var createAd =
          CreateAd.bulder(originalAd, clonedAdLayout, newAdTargeting);
      _addPostfixToAdName(createAd, cloneTask);

      return createAd;
    } else if (originalAd.isImageTextFormat) {
      var clonedAdLayout = adLayout.clone();
      await _createAndUploadPhoto(clonedAdLayout, 1);
      var newAdTargeting = adTargeting.clone();
      _changeTargetingAge(newAdTargeting, cloneTask);
      var createAd =
          CreateAd.bulder(originalAd, clonedAdLayout, newAdTargeting);
      _addPostfixToAdName(createAd, cloneTask);

      return createAd;
    } else if (originalAd.isBigImageFormat) {
      var clonedAdLayout = adLayout.clone();
      await _createAndUploadPhoto(clonedAdLayout, 2);
      var newAdTargeting = adTargeting.clone();
      _changeTargetingAge(newAdTargeting, cloneTask);
      var createAd =
          CreateAd.bulder(originalAd, clonedAdLayout, newAdTargeting);
      _addPostfixToAdName(createAd, cloneTask);
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

  Future<String> _createAndGetLinkForWallPostAdsStealth(
      WallPostAdsStealth wallPostAdsStealth) async {
    var newStealth = await vkApi.wallPostAdsStealth(wallPostAdsStealth);
    if (newStealth.errorResponse != null) {
      print(newStealth.errorResponse.errorMsg);
      throw Exception(newStealth.errorResponse.errorMsg);
    }
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

  Future<void> _createAndUploadPhoto(AdLayout adLayout, int adFormat) async {
    if (photoData == null) {
      if (adFormat == 2) {
        photoData = await vkApi.uploadPhotoFromUrl(adLayout.imageSrc, adFormat);
      } else {
        photoData =
            await vkApi.uploadPhotoFromUrl(adLayout.imageSrc2x, adFormat);
      }
    }
    adLayout.imageSrc = photoData.photo;
  }

  void _addPostfixToAdName(CreateAd createAd, CloneTask cloneTask) {
    createAd.name +=
        ' (${cloneTask.value.startAge.toString()}-${cloneTask.value.endAge.toString()})';
  }

  void _changeTargetingAge(AdTargeting adTargeting, CloneTask cloneTask) {
    adTargeting
      ..ageFrom = cloneTask.value.startAge.toString()
      ..ageTo = cloneTask.value.endAge.toString();
  }
}
