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

class CloneFactory {
  VkApi vkApi;
  UploadedPhoto photoData;
  UploadedPhoto iconData;
  UploadedVideo videoData;

  CloneFactory(this.vkApi);

  Future<CreateAd> buildAd(Ad originalAd, AdTargeting adTargeting,
      AdLayout adLayout, WallPost adWallPost, CloneTask cloneTask) async {
    var result;
    switch (cloneTask.type) {
      case CloneType.text:
        {
          if (originalAd.adFormat == 9) {
            var clonedWallPost = adWallPost.clone();
            if (clonedWallPost.hasPrettyCards) {
              for (var attachment in clonedWallPost.attachments) {
                if (attachment.type == 'pretty_cards') {
                  for (int i = 0;
                      i < attachment.prettyCards.cards.length;
                      i++) {
                    var newCardResult = await vkApi.prettyCardsCreate(
                        adWallPost.ownerId.toString(),
                        attachment.prettyCards.cards[i]);
                    var newPrettyCard =
                        await vkApi.prettyCardsGetById(newCardResult);
                    attachment.prettyCards.cards[i]
                        .updateFromPrettyCard(newPrettyCard.result[0]);
                  }
                }
              }
            }
            var wallPostAdsStealth =
                WallPostAdsStealth.fromWallPost(clonedWallPost);
            wallPostAdsStealth.message = cloneTask.value;
            var newStealth = await vkApi.wallPostAdsStealth(wallPostAdsStealth);
            var link = newStealth.wallLink(wallPostAdsStealth);
            var createAd = CreateAd.bulder(
                originalAd, adLayout, adTargeting, wallPostAdsStealth);
            createAd.linkUrl = link;
            result = createAd;
          }
          if (originalAd.adFormat == 11) {
            var clonedAdLayout = adLayout.clone();
            clonedAdLayout.description = cloneTask.value;

            if (iconData == null) {
              iconData = await vkApi.uploadPhotoFromUrl(
                  clonedAdLayout.iconSrc2x, 11, 1);
            }
            clonedAdLayout.iconSrc = iconData.photo;

            if (clonedAdLayout.imageSrc2x == null) {
              //this is video ad
              if (videoData == null) {
                videoData =
                    await vkApi.uploadVideoFromUrl(clonedAdLayout.videoSrc720);
              }
              clonedAdLayout.videoSrc720 =
                  videoData.videoData; //use720 this time TODO
            } else {
              //this id image ad
              if (photoData == null) {
                photoData = await vkApi.uploadPhotoFromUrl(
                    clonedAdLayout.imageSrc2x, 11);
              }
              clonedAdLayout.imageSrc = photoData.photo;
            }

            var createAd = CreateAd.bulderFromAdaptive(
                originalAd, clonedAdLayout, adTargeting);
            result = createAd;
          }
        }
        break;
      //clone text
      case CloneType.pure:
        //pure clone
        break;
    }
    return result;
  }
}
