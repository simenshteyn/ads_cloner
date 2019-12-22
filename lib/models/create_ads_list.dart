import 'package:ads_cloner/models/create_ad.dart';

class CreateAdsList {
  List<CreateAd> createAdsList;

  List<Map<String, dynamic>> toJson() {
    var _createAdsListJson = [];
    for (var ad in createAdsList) {
      _createAdsListJson.add(ad.toJson());
    }
    return _createAdsListJson;
  }
}
