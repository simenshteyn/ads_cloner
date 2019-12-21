import 'package:ads_cloner/models/create_ad.dart';
import 'dart:convert' show jsonDecode;

class CreateAdsList {
  List<CreateAd> createAdsList;

  CreateAdsList.fromJSON(String jsonString) {
    final _map = jsonDecode(jsonString);
    createAdsList = [];
    final List _createAdsList = _map['response'];
    for (var createAd in _createAdsList) {
      createAdsList.add(CreateAd.fromJSON(createAd));
    }
  }
}