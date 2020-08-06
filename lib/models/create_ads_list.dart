import 'package:ads_cloner/models/create_ad.dart';

class CreateAdsList {
  List<CreateAd> createAdsList = [];

  void appendAd(CreateAd ad) {
    this.createAdsList.add(ad);
  }

  CreateAdsList(this.createAdsList) {
    this.createAdsList = createAdsList ?? [];
  }

  List<CreateAdsList> getCreateAdsListInChunks([int chunkSize = 5]) {
    var len = this.createAdsList.length;
    var size = chunkSize; // 5 sometimes cause 414 error
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

  bool get isNotEmpty {
    if (this.createAdsList != null) {
      if (this.createAdsList.length > 0) {
        return true;
      }
      return false;
    }
    return false;
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> _createAdsListJson = [];
    for (var ad in createAdsList) {
      _createAdsListJson.add(ad.toJson());
    }
    return _createAdsListJson;
  }
}
