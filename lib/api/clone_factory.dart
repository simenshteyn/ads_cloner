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
            var photoData =
                await vkApi.uploadFileFromUrl(clonedAdLayout.imageSrc2x, 11);
            var iconData =
                await vkApi.uploadFileFromUrl(clonedAdLayout.iconSrc2x, 11, 1);
            clonedAdLayout.imageSrc = photoData.photo;
            clonedAdLayout.iconSrc = iconData.photo;
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
