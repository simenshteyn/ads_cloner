class AdTargeting {
  String sex, ageFrom, ageTo, birthday, country, cities, citiesNot;
  String geoNear, geoPointType, statuses, groups, groupsNot, groupsActive;
  String apps, appsNot, districts, stations, streets, schools, positions;
  String religions, interestCategories, interests, userDevices, userOs;
  String userBrowsers, retargetingGroups, retargetingGroupsNot;
  String eventsRetargetingGroups, paying, travellers, schoolFrom;
  String schoolTo, uniFrom, uniTo; 
  String count, campaignId, id; //not targeting, but still exists.
  // More field information here: https://vk.com/dev/ads_targeting

  AdTargeting.fromJSON(Map<String, dynamic> json) {
    this.sex = json['sex'];
    this.ageFrom = json['age_from'];
    this.ageTo = json['age_to'];
    this.birthday = json['birthday'];
    this.country = json['country'];
    this.cities = json['cities'];
    this.citiesNot = json['cities_not'];
    this.geoNear = json['geo_near'];
    this.geoPointType = json['geo_point_type'];
    this.statuses = json['statuses'];
    this.groups = json['groups'];
    this.groupsNot = json['groups_not'];
    this.groupsActive = json['groups_active'];
    this.apps = json['apps'];
    this.appsNot = json['appsNot'];
    this.districts = json['districts'];
    this.stations = json['stations'];
    this.streets = json['streets'];
    this.schools = json['schools'];
    this.positions = json['positions'];
    this.religions = json['religions'];
    this.interestCategories = json['interest_categories'];
    this.interests = json['interests'];
    this.userDevices = json['user_devices'];
    this.userOs = json['user_os'];
    this.userBrowsers = json['user_browsers'];
    this.retargetingGroups = json['retargeting_groups'];
    this.retargetingGroupsNot = json['retargeting_groups_not'];
    this.eventsRetargetingGroups = json['events_retargeting_groups'];
    this.paying = json['paying'];
    this.travellers = json['travellers'];
    this.schoolFrom = json['scholl_from'];
    this.schoolTo = json['scholl_to'];
    this.uniFrom = json['uni_from'];
    this.uniTo = json['uni_to'];
    this.count = json['count'];
    this.campaignId = json['campaign_id'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() =>
  {
    'sex': sex,
    'age_from': ageFrom,
    'age_to': ageTo,
    'birthday': birthday,
    'country': country,
    'cities': cities,
    'cities_not': citiesNot,
    'geo_near': geoNear,
    'geo_point_type': geoPointType,
    'statuses': statuses,
    'groups': groups,
    'groups_not': groupsNot,
    'groups_active': groupsActive,
    'apps': apps,
    'appsNot': appsNot,
    'districts': districts,
    'stations': stations,
    'streets': streets,
    'schools': schools,
    'positions': positions,
    'religions': religions,
    'interest_categories': interestCategories,
    'interests': interests,
    'user_devices': userDevices,
    'user_os': userOs,
    'user_browsers': userBrowsers,
    'retargeting_groups': retargetingGroups,
    'retargeting_groups_not': retargetingGroupsNot,
    'events_retargeting_groups': eventsRetargetingGroups,
    'paying': paying,
    'travellers': travellers,
    'scholl_from': schoolFrom,
    'scholl_to': schoolTo,
    'uni_from': uniFrom,
    'uni_to': uniTo,
    'count': count,
    'campaign_id': campaignId,
    'id': id,
  };
}
