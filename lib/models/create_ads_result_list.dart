import 'package:ads_cloner/models/create_ad_result.dart';
import 'dart:convert' show jsonDecode;

class CreateAdsResultList {
  List<CreateAdResult> createAdsResultList;

  CreateAdsResultList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    createAdsResultList = [];
    final List _createAdsResultList = _map['response'];
    for (var createAdResult in _createAdsResultList) {
      createAdsResultList.add(CreateAdResult.fromJSON(createAdResult));
    }
  }
}
