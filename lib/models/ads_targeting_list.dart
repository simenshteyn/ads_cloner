import 'package:ads_cloner/models/ad_targeting.dart';
import 'dart:convert' show jsonDecode;

class AdsTargetingList {
  List<AdTargeting> adsTargeting;

  AdsTargetingList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    adsTargeting = [];
    final List _adsTargetingList = _map['response'];
    for (var adTargeting in _adsTargetingList) {
      adsTargeting.add(AdTargeting.fromJSON(adTargeting));
    }
  }
}