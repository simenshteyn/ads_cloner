import 'package:ads_cloner/models/create_ad.dart';
import 'package:ads_cloner/models/create_ads_list.dart';
import 'package:test/test.dart';

void main() {
  test('Create Ads List test', () async {
    var createAd1 = CreateAd();
    var createAd2 = CreateAd();
    var createAd3 = CreateAd();
    var createAd4 = CreateAd();
    var createAd5 = CreateAd();
    var createAd6 = CreateAd();
    CreateAdsList list = CreateAdsList([]);
    list.appendAd(createAd1);
    list.appendAd(createAd2);
    list.appendAd(createAd3);
    list.appendAd(createAd4);
    list.appendAd(createAd5);
    list.appendAd(createAd6);
    expect(list.getCreateAdsListInChunks.length, 2);
  });
}
