import 'dart:io';
import 'package:ads_cloner/models/ad.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  test('Testing ad.dart JSON', () async {
    final jsonString =
        '''{"id":"67313143","campaign_id":1014614122,"status":0,"approved":"2","create_time":"1583040625","update_time":"1583397717","goal_type":1,"cost_type":1,"day_limit":"0","all_limit":"0","start_time":"0","stop_time":"0","category1_id":"339","category2_id":"0","age_restriction":"0","name":"@20\/03-0011: перед 8 марта","events_retargeting_groups":{"32361496":[25],"32361499":[1]},"ad_format":9,"cpm":"20000","impressions_limit":1,"ad_platform":"mobile","ad_platform_no_ad_network":1}''';
    Map<String, dynamic> map = json.decode(jsonString);
    final ad = Ad.fromJson(map);
    expect(ad.id, '67313143');
    print(ad.eventsRetargetingGroups);
  });
}
