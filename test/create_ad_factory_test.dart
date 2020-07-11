import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/ad_layout.dart';
import 'package:ads_cloner/models/ad_targeting.dart';
import 'package:ads_cloner/models/wall_post.dart';
import 'package:test/test.dart';
import 'package:ads_cloner/api/clone_factory.dart';
import 'dart:async';

void main() {
  test('Mock Ad Object created from JSON', () async {
    final map = {
      "id": "63764839",
      "campaign_id": 1013848719,
      "status": 0,
      "approved": "2",
      "create_time": "1575889680",
      "update_time": "1575989879",
      "goal_type": 1,
      "day_limit": "0",
      "all_limit": "300",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "334",
      "category2_id": "0",
      "age_restriction": "0",
      "name": "@19/12-0013: 10 декабря 2019",
      "events_retargeting_groups": {
        "31642569": [25],
        "31642570": [1],
        "31642571": [2]
      },
      "cost_type": 1,
      "ad_format": 9,
      "cpm": "15483",
      "impressions_limit": 1,
      "ad_platform": "mobile",
      "ad_platform_no_ad_network": 1
    };
    final ad = Ad.fromJSON(map);
    expect(ad.category1Id, "334");
    expect(ad.campaignId, 1013848719);
  });
  test('Mock AdLayout Object from JSON or Map', () async {
    final map = {
      "id": "67578692",
      "campaign_id": 1014488300,
      "goal_type": 1,
      "cost_type": 1,
      "age_restriction": "0",
      "title": "",
      "link_url": "http://vk.com/wall-25212245_3151",
      "link_domain": "",
      "ad_format": 9,
      "preview_link": "https://vk.com/ad...=c2d2609bc8e7be8c37",
      "image_src": ""
    };
    final adLayout = AdLayout.fromJSON(map);
    expect(adLayout.id, "67578692");
    expect(adLayout.adFormat, 9);
  });
  test('Mock WallPost Object from JSON or Map', () async {
    final map = {
      "id": 3151,
      "from_id": -25212245,
      "owner_id": -25212245,
      "date": 1583397307,
      "marked_as_ads": 0,
      "post_type": "post_ads",
      "text":
          "Привет &#128540; а нам снова нужны модели на реснички, в эту пятницу &#129392; нажми на кнопку под видео и запишись прямо сейчас &#128071;&#127995;",
      "can_edit": 1,
      "created_by": 21307092,
      "attachments": [
        {
          "type": "link",
          "link": {
            "url": "https://vk.me/iradel",
            "title": "Запишись моделью прямо сейчас &#8658;",
            "caption": "vk.me",
            "description": "наращивание ресниц в Новосибирске",
            "video": {
              "access_key": "0fb226fad4156bf47a",
              "can_edit": 1,
              "can_add": 1,
              "comments": 0,
              "date": 1583302547,
              "description": "",
              "duration": 14,
              "image": [
                {
                  "height": 96,
                  "url": "https://sun9-10.u...AOA/6ZH3FXXSS7w.jpg",
                  "width": 130,
                  "with_padding": 1
                },
                {
                  "height": 120,
                  "url": "https://sun9-9.us...3dg/z2jPE9YF7oQ.jpg",
                  "width": 160,
                  "with_padding": 1
                },
                {
                  "height": 240,
                  "url": "https://sun9-48.u...HDg/-115-ep23cs.jpg",
                  "width": 320,
                  "with_padding": 1
                },
                {
                  "height": 450,
                  "url": "https://sun9-63.u...8FQ/af42h6gA3pQ.jpg",
                  "width": 800,
                  "with_padding": 1
                },
                {
                  "height": 720,
                  "url": "https://sun9-62.u...AYQ/0TIvqIczxU4.jpg",
                  "width": 1280
                },
                {
                  "height": 180,
                  "url": "https://sun9-71.u...JXw/0jZKBjemW30.jpg",
                  "width": 320
                },
                {
                  "height": 405,
                  "url": "https://sun9-13.u...nKQ/3xTT9ILoWuY.jpg",
                  "width": 720
                },
                {
                  "height": 576,
                  "url": "https://sun9-36.u...YIw/UhWi2-yTpdI.jpg",
                  "width": 1024
                },
                {
                  "height": 2304,
                  "url": "https://sun9-61.u...TfA/9q9yWPQfVfg.jpg",
                  "width": 4096
                }
              ],
              "first_frame": [
                {
                  "height": 180,
                  "url": "https://sun9-6.us...w7g/ynJJP1l_uMg.jpg",
                  "width": 320
                },
                {
                  "height": 90,
                  "url": "https://sun9-37.u...LKA/ZXol3RIIpeU.jpg",
                  "width": 160
                },
                {
                  "height": 2304,
                  "url": "https://sun9-40.u...clw/iGApoNvxSq0.jpg",
                  "width": 4096
                },
                {
                  "height": 73,
                  "url": "https://sun9-35.u...BDA/DfMOufKNc9A.jpg",
                  "width": 130
                },
                {
                  "height": 180,
                  "url": "https://sun9-6.us...w7g/ynJJP1l_uMg.jpg",
                  "width": 320
                },
                {
                  "height": 405,
                  "url": "https://sun9-26.u...q2g/xXfQfUdJONU.jpg",
                  "width": 720
                },
                {
                  "height": 576,
                  "url": "https://sun9-9.us...F4g/hjbb0-YvNYc.jpg",
                  "width": 1024
                },
                {
                  "height": 720,
                  "url": "https://sun9-4.us...DQQ/8Z-KOIZgPAk.jpg",
                  "width": 1280
                },
                {
                  "height": 450,
                  "url": "https://sun9-42.u...QHw/-8DXWYwDXTE.jpg",
                  "width": 800
                }
              ],
              "width": 1920,
              "height": 1080,
              "id": 456239285,
              "owner_id": -25212245,
              "title": "Наращивание ресниц 2D в Новосибирсске",
              "is_favorite": false,
              "track_code":
                  "video_39a7abb8EE2FcO38gqhyu5OiI5ov2IwCOLdKsigOpsIJKXf13o4gap0d6_-Gq0CPpv0Xrxnqvzs",
              "repeat": 1,
              "type": "video",
              "views": 4197
            },
            "button": {
              "title": "Написать",
              "action": {
                "type": "open_url",
                "group_id": 25212245,
                "url": "https://vk.com/im?sel=-25212245"
              }
            },
            "is_favorite": false
          }
        }
      ],
      "post_source": {"type": "vk"},
      "comments": {"count": 0, "can_post": 0},
      "likes": {"count": 2, "user_likes": 0, "can_like": 1, "can_publish": 1},
      "reposts": {"count": 0, "user_reposted": 0},
      "is_favorite": false,
      "edited": 1583397625,
      "is_promoted_post_stealth": true
    };
    final wallPost = WallPost.fromJSON(map);
    expect(wallPost.isPromotedPostStealth, true);
    expect(wallPost.text,
        "Привет &#128540; а нам снова нужны модели на реснички, в эту пятницу &#129392; нажми на кнопку под видео и запишись прямо сейчас &#128071;&#127995;");
  });
  test('Mock AdTageting Object from JSON or MAp', () async {
    final map = {
      "campaign_id": "1014488300",
      "id": "67578692",
      "sex": "1",
      "country": "1",
      "cities": "99",
      "groups_formula": "!25212245",
      "retargeting_groups": "32228380",
      "retargeting_groups_not": "29569053,32233473,32228458",
      "count": "2100"
    };
    final adTargting = AdTargeting.fromJSON(map);
    expect(adTargting.sex, "1");
    expect(adTargting.cities, "99");
  });
  test('Create Ad with factory', () async {
    final wallPostMap = {
      "id": 3151,
      "from_id": -25212245,
      "owner_id": -25212245,
      "date": 1583397307,
      "marked_as_ads": 0,
      "post_type": "post_ads",
      "text":
          "Привет &#128540; а нам снова нужны модели на реснички, в эту пятницу &#129392; нажми на кнопку под видео и запишись прямо сейчас &#128071;&#127995;",
      "can_edit": 1,
      "created_by": 21307092,
      "attachments": [
        {
          "type": "link",
          "link": {
            "url": "https://vk.me/iradel",
            "title": "Запишись моделью прямо сейчас &#8658;",
            "caption": "vk.me",
            "description": "наращивание ресниц в Новосибирске",
            "video": {
              "access_key": "0fb226fad4156bf47a",
              "can_edit": 1,
              "can_add": 1,
              "comments": 0,
              "date": 1583302547,
              "description": "",
              "duration": 14,
              "image": [
                {
                  "height": 96,
                  "url": "https://sun9-10.u...AOA/6ZH3FXXSS7w.jpg",
                  "width": 130,
                  "with_padding": 1
                },
                {
                  "height": 120,
                  "url": "https://sun9-9.us...3dg/z2jPE9YF7oQ.jpg",
                  "width": 160,
                  "with_padding": 1
                },
                {
                  "height": 240,
                  "url": "https://sun9-48.u...HDg/-115-ep23cs.jpg",
                  "width": 320,
                  "with_padding": 1
                },
                {
                  "height": 450,
                  "url": "https://sun9-63.u...8FQ/af42h6gA3pQ.jpg",
                  "width": 800,
                  "with_padding": 1
                },
                {
                  "height": 720,
                  "url": "https://sun9-62.u...AYQ/0TIvqIczxU4.jpg",
                  "width": 1280
                },
                {
                  "height": 180,
                  "url": "https://sun9-71.u...JXw/0jZKBjemW30.jpg",
                  "width": 320
                },
                {
                  "height": 405,
                  "url": "https://sun9-13.u...nKQ/3xTT9ILoWuY.jpg",
                  "width": 720
                },
                {
                  "height": 576,
                  "url": "https://sun9-36.u...YIw/UhWi2-yTpdI.jpg",
                  "width": 1024
                },
                {
                  "height": 2304,
                  "url": "https://sun9-61.u...TfA/9q9yWPQfVfg.jpg",
                  "width": 4096
                }
              ],
              "first_frame": [
                {
                  "height": 180,
                  "url": "https://sun9-6.us...w7g/ynJJP1l_uMg.jpg",
                  "width": 320
                },
                {
                  "height": 90,
                  "url": "https://sun9-37.u...LKA/ZXol3RIIpeU.jpg",
                  "width": 160
                },
                {
                  "height": 2304,
                  "url": "https://sun9-40.u...clw/iGApoNvxSq0.jpg",
                  "width": 4096
                },
                {
                  "height": 73,
                  "url": "https://sun9-35.u...BDA/DfMOufKNc9A.jpg",
                  "width": 130
                },
                {
                  "height": 180,
                  "url": "https://sun9-6.us...w7g/ynJJP1l_uMg.jpg",
                  "width": 320
                },
                {
                  "height": 405,
                  "url": "https://sun9-26.u...q2g/xXfQfUdJONU.jpg",
                  "width": 720
                },
                {
                  "height": 576,
                  "url": "https://sun9-9.us...F4g/hjbb0-YvNYc.jpg",
                  "width": 1024
                },
                {
                  "height": 720,
                  "url": "https://sun9-4.us...DQQ/8Z-KOIZgPAk.jpg",
                  "width": 1280
                },
                {
                  "height": 450,
                  "url": "https://sun9-42.u...QHw/-8DXWYwDXTE.jpg",
                  "width": 800
                }
              ],
              "width": 1920,
              "height": 1080,
              "id": 456239285,
              "owner_id": -25212245,
              "title": "Наращивание ресниц 2D в Новосибирсске",
              "is_favorite": false,
              "track_code":
                  "video_39a7abb8EE2FcO38gqhyu5OiI5ov2IwCOLdKsigOpsIJKXf13o4gap0d6_-Gq0CPpv0Xrxnqvzs",
              "repeat": 1,
              "type": "video",
              "views": 4197
            },
            "button": {
              "title": "Написать",
              "action": {
                "type": "open_url",
                "group_id": 25212245,
                "url": "https://vk.com/im?sel=-25212245"
              }
            },
            "is_favorite": false
          }
        }
      ],
      "post_source": {"type": "vk"},
      "comments": {"count": 0, "can_post": 0},
      "likes": {"count": 2, "user_likes": 0, "can_like": 1, "can_publish": 1},
      "reposts": {"count": 0, "user_reposted": 0},
      "is_favorite": false,
      "edited": 1583397625,
      "is_promoted_post_stealth": true
    };
    final wallPost = WallPost.fromJSON(wallPostMap);

    final adLayoutMap = {
      "id": "67578692",
      "campaign_id": 1014488300,
      "goal_type": 1,
      "cost_type": 1,
      "age_restriction": "0",
      "title": "",
      "link_url": "http://vk.com/wall-25212245_3151",
      "link_domain": "",
      "ad_format": 9,
      "preview_link": "https://vk.com/ad...=c2d2609bc8e7be8c37",
      "image_src": ""
    };
    final adLayout = AdLayout.fromJSON(adLayoutMap);

    final adMap = {
      "id": "63764839",
      "campaign_id": 1013848719,
      "status": 0,
      "approved": "2",
      "create_time": "1575889680",
      "update_time": "1575989879",
      "goal_type": 1,
      "day_limit": "0",
      "all_limit": "300",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "334",
      "category2_id": "0",
      "age_restriction": "0",
      "name": "@19/12-0013: 10 декабря 2019",
      "events_retargeting_groups": {
        "31642569": [25],
        "31642570": [1],
        "31642571": [2]
      },
      "cost_type": 1,
      "ad_format": 9,
      "cpm": "15483",
      "impressions_limit": 1,
      "ad_platform": "mobile",
      "ad_platform_no_ad_network": 1
    };
    final ad = Ad.fromJSON(adMap);

    final adTargetingMap = {
      "campaign_id": "1014488300",
      "id": "67578692",
      "sex": "1",
      "country": "1",
      "cities": "99",
      "groups_formula": "!25212245",
      "retargeting_groups": "32228380",
      "retargeting_groups_not": "29569053,32233473,32228458",
      "count": "2100"
    };
    final adTargting = AdTargeting.fromJSON(adTargetingMap);

    final cloneTask = CloneTask(
      type: CloneType.text,
      value: "some new text",
    );
    final vk = VkApi(userToken: 'a889969ff058900b4df0b25aed1eb56d27cf2d4776a27f238b0030603c145ddf4cd59968085ae83c105b4');

    final cloneFactory = CloneFactory(vk);
    var clone = await
        cloneFactory.buildAd(ad, adTargting, adLayout, wallPost, cloneTask);
    print(clone.linkUrl);
    expect(clone.adFormat, 9);
    expect(clone.cpm, 154.83);
  });
}
