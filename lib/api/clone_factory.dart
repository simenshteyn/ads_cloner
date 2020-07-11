import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/create_ad.dart';
import 'package:ads_cloner/models/wall_post.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';
import 'package:flutter_vk_sdk/vk_api/vk_api.dart';
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
          var wallPostAdsStealth = WallPostAdsStealth.fromWallPost(adWallPost);
          wallPostAdsStealth.message = cloneTask.value;
          var newStealth = await vkApi.wallPostAdsStealth(wallPostAdsStealth);
          var link = newStealth.wallLink(wallPostAdsStealth);
          var createAd = CreateAd.bulder(
              originalAd, adLayout, adTargeting, wallPostAdsStealth);
          createAd.linkUrl = link;
          print(createAd.linkUrl);
          result = createAd;
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
