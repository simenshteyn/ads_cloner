import 'package:ads_cloner/models/ad.dart';
import 'dart:convert' show jsonDecode;

class AdsList {
  List<Ad> ads;

  AdsList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    ads = [];
    final List _adsList = _map['response'];
    for (var ad in _adsList) {
      ads.add(Ad.fromJSON(ad));
    }
  }
}