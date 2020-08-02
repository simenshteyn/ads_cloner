import 'package:ads_cloner/models/create_ad.dart';

class CreateAdsList {
  List<CreateAd> createAdsList = [];

  void appendAd(CreateAd ad) {
    this.createAdsList.add(ad);
  }

  CreateAdsList(this.createAdsList);

  // CreateAdsList get getLastFiveAds {
  //   if (this.createAdsList.length > 5) {
  //     var list = CreateAdsList();
  //     for (var ad
  //         in this.createAdsList.sublist(this.createAdsList.length - 6)) {
  //       list.appendAd(ad);
  //       return list;
  //     }
  //   } else
  //     return this;
  // }

  // void get removeLastFiveAds {
  //   if (this.createAdsList.length > 5) {
  //     this.createAdsList.removeRange(
  //         this.createAdsList.length - 5, this.createAdsList.length);
  //   } else
  //     this.createAdsList.clear();
  // }

  // CreateAdsList get popLastFiveAds {
  //   var result = this.getLastFiveAds;
  //   this.removeLastFiveAds;
  //   return result;
  // }

  List<CreateAdsList> get getCreateAdsListInChunks {
    var len = this.createAdsList.length;
    var size = 5;
    List<List<CreateAd>> chunks = [];

    for (var i = 0; i < len; i += size) {
      var end = (i + size < len) ? i + size : len;
      chunks.add(this.createAdsList.sublist(i, end));
    }
    List<CreateAdsList> result = [];
    for (var chunk in chunks) {
      var createAdsList = CreateAdsList(chunk);
      result.add(createAdsList);
    }
    return result;
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> _createAdsListJson = [];
    for (var ad in createAdsList) {
      _createAdsListJson.add(ad.toJson());
    }
    return _createAdsListJson;
  }
}
