import 'dart:convert';

import 'package:test/test.dart';
import 'package:ads_cloner/models/ads_list.dart';
import 'dart:async';

void main() {
  test('AdsList Class testing from JSON', () async {
    final stringJson = '''{
      "response": [{
      "id": "63764839",
      "campaign_id": 1013848719,
      "status": 0,
      "approved": "2",
      "create_time": "1575889680",
      "update_time": "1575989879",
      "goal_type": 1,
      "day_limit": "0",
      "all_limit": "300",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "334",
      "category2_id": "0",
      "age_restriction": "0",
      "name": "@19/12-0013: 10 декабря 2019",
      "events_retargeting_groups": {
      "31642569": [25],
      "31642570": [1],
      "31642571": [2]
      },
      "cost_type": 1,
      "ad_format": 9,
      "cpm": "15483",
      "impressions_limit": 1,
      "ad_platform": "mobile",
      "ad_platform_no_ad_network": 1
      }, {
      "id": "63535251",
      "campaign_id": 1013848719,
      "status": 0,
      "approved": "2",
      "create_time": "1575440519",
      "update_time": "1575558867",
      "goal_type": 1,
      "day_limit": "0",
      "all_limit": "300",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "334",
      "category2_id": "0",
      "age_restriction": "0",
      "name": "@19/12-0013: 05 декабря 2019",
      "events_retargeting_groups": {
      "31642569": [25],
      "31642570": [1],
      "31642571": [2]
      },
      "cost_type": 1,
      "ad_format": 9,
      "cpm": "15142",
      "impressions_limit": 1,
      "ad_platform": "mobile",
      "ad_platform_no_ad_network": 1
      }]
      }''';
    final map = json.decode(stringJson);
    final ads = AdsList.fromJson(map);
    expect(ads.ads.length, 2);
    expect(ads.ads[1].name, "@19/12-0013: 05 декабря 2019");
    expect(ads.ads[1].id, "63535251");
    expect(ads.ads[1].adPlatform, "mobile");
    expect(ads.ads[1].adPlatformNoAdNetwork, 1);
    expect(ads.ads[1].adFormat, 9);
    expect(ads.ads[1].costType, 1);
  });
  test('Second test', () async {
    var jsonString = '''{
      "response": [{
      "id": "64313993",
      "campaign_id": 1013965043,
      "status": 0,
      "approved": "0",
      "create_time": "1577017711",
      "update_time": "1577017722",
      "goal_type": 1,
      "cost_type": 1,
      "day_limit": "0",
      "all_limit": "0",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "339",
      "category2_id": "0",
      "age_restriction": "5",
      "name": "Button",
      "events_retargeting_groups": [],
      "ad_format": 9,
      "cpm": "3000",
      "impressions_limit": 5,
      "ad_platform": "all",
      "ad_platform_no_ad_network": 1
      }, {
      "id": "64313621",
      "campaign_id": 1013965043,
      "status": 0,
      "approved": "0",
      "create_time": "1577016708",
      "update_time": "1577016725",
      "goal_type": 1,
      "cost_type": 1,
      "day_limit": "0",
      "all_limit": "0",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "339",
      "category2_id": "0",
      "age_restriction": "5",
      "name": "Universal",
      "events_retargeting_groups": [],
      "ad_format": 9,
      "cpm": "3000",
      "impressions_limit": 1,
      "ad_platform": "mobile",
      "ad_platform_no_ad_network": 1
      }, {
      "id": "64148776",
      "campaign_id": 1013965043,
      "status": 0,
      "approved": "0",
      "create_time": "1576641290",
      "update_time": "1576642825",
      "goal_type": 1,
      "cost_type": 1,
      "day_limit": "0",
      "all_limit": "0",
      "start_time": "0",
      "stop_time": "0",
      "category1_id": "358",
      "category2_id": "0",
      "age_restriction": "5",
      "name": "Carousel",
      "events_retargeting_groups": {
      "31767108": [25, 24, 1, 2, 3, 20, 21, 4, 5, 6]
      },
      "weekly_schedule_hours": ["111111111111000000000000", "111111111111000000000000", "111111111111000000000000", "111111111111000000000000", "111111111111000000000000", "111111111111000000000000", "111111111111000000000000"],
      "weekly_schedule_use_holidays": 1,
      "ad_format": 9,
      "cpm": "3000",
      "impressions_limit": 2,
      "ad_platform": "mobile"
      }]
      }''';
    final map = json.decode(jsonString);
    final ads = AdsList.fromJson(map);
    print(ads.ads[2].weeklyScheduleHours);
    expect(ads.ads.length, 3);
  });
}
