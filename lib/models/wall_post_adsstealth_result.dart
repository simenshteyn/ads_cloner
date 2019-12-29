import 'dart:convert' show jsonDecode;

class WallPostAdsStealthResult {
  int id, errorCode;
  String errorDesc;

  WallPostAdsStealthResult.fromJSON(String jsonString) {
    final json = jsonDecode(jsonString);
    
    if (json.containsKey('id')) {
      this.id = json['id'];
    }
    if (json.containsKey('error_code')) {
      this.errorCode = json['error_code'];
    }
    if (json.containsKey('error_desc')) {
      this.errorDesc = json['error_desc'];
    }
  }
}
