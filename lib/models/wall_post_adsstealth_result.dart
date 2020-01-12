import 'dart:convert' show jsonDecode;

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
}
