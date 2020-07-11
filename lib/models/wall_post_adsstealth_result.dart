import 'dart:convert' show jsonDecode;

import 'package:ads_cloner/models/ad.dart';
import 'package:ads_cloner/models/wall_post_adsstealth.dart';

class WallPostAdsStealthResult {
  int postId, errorCode;
  String errorDesc;

  WallPostAdsStealthResult.fromJSON(String jsonString) {
    final json = jsonDecode(jsonString)['response'];
    
    if (json.containsKey('post_id')) {
      this.postId = json['post_id'];
    }
    if (json.containsKey('error_code')) {
      this.errorCode = json['error_code'];
    }
    if (json.containsKey('error_desc')) {
      this.errorDesc = json['error_desc'];
    }
  }

  String wallLink (WallPostAdsStealth wall) {
    return "https://vk.com/wall" "${wall.ownerId}" "_" "${this.postId}";
  } 
}
