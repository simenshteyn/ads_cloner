import 'package:ads_cloner/models/ad_layout.dart';
import 'dart:convert' show jsonDecode;

class AdsLayoutList {
  List<AdLayout> adsLayout;

  AdsLayoutList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    adsLayout = [];
    final List _adsLayoutList = _map['response'];
    for (var adLayout in _adsLayoutList) {
      adsLayout.add(AdLayout.fromJSON(adLayout));
    }
  }
}