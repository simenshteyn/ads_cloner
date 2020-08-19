import 'package:SmmHub/models/ad_targeting.dart';
import 'package:test/test.dart';

void main() {
  test('create ads targeting from JSON', () async {
    final map = {
      "campaign_id": "1014488300",
      "id": "67578692",
      "sex": "1",
      "country": "1",
      "cities": "99",
      "groups_formula": "!25212245",
      "retargeting_groups": "32228380",
      "retargeting_groups_not": "29569053,32233473,32228458",
      "count": "2100"
    };
    var targeting = AdTargeting.fromJson(map);
    print(targeting.toJson());
    expect(targeting.sex, "1");
  });
}
