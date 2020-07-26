import 'package:ads_cloner/models/create_ad.dart';

class CreateAdsList {
  List<CreateAd> createAdsList = [];

  void appendAd(CreateAd ad) {
    this.createAdsList.add(ad);
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> _createAdsListJson = [];
    for (var ad in createAdsList) {
      _createAdsListJson.add(ad.toJson());
    }
    return _createAdsListJson;
  }
}
