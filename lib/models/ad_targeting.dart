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
    if (json.containsKey('sex')) {
      this.sex = json['sex'];
    }
    if (json.containsKey('age_from')) {
      this.ageFrom = json['age_from'];
    }
    if (json.containsKey('age_to')) {
      this.ageTo = json['age_to'];
    }
    if (json.containsKey('birthday')) {
      this.birthday = json['birthday'];
    }
    if (json.containsKey('country')) {
      this.country = json['country'];
    }
    if (json.containsKey('cities')) {
      this.cities = json['cities'];
    }
    if (json.containsKey('cities_not')) {
      this.citiesNot = json['cities_not'];
    }
    if (json.containsKey('geo_near')) {
      this.geoNear = json['geo_near'];
    }
    if (json.containsKey('geo_point_type')) {
      this.geoPointType = json['geo_point_type'];
    }
    if (json.containsKey('statuses')) {
      this.statuses = json['statuses'];
    }
    if (json.containsKey('groups')) {
      this.groups = json['groups'];
    }
    if (json.containsKey('groups_not')) {
      this.groupsNot = json['groups_not'];
    }
    if (json.containsKey('groups_active')) {
      this.groupsActive = json['groups_active'];
    }
    if (json.containsKey('apps')) {
      this.apps = json['apps'];
    }
    if (json.containsKey('apps_not')) {
      this.appsNot = json['apps_not'];
    }
    if (json.containsKey('districts')) {
      this.districts = json['districts'];
    }
    if (json.containsKey('stations')) {
      this.stations = json['stations'];
    }
    if (json.containsKey('streets')) {
      this.streets = json['streets'];
    }
    if (json.containsKey('schools')) {
      this.schools = json['schools'];
    }
    if (json.containsKey('positions')) {
      this.positions = json['positions'];
    }
    if (json.containsKey('religions')) {
      this.religions = json['religions'];
    }
    if (json.containsKey('interest_categories')) {
      this.interestCategories = json['interest_categories'];
    }
    if (json.containsKey('interests')) {
      this.interests = json['interests'];
    }
    if (json.containsKey('user_devices')) {
      this.userDevices = json['user_devices'];
    }
    if (json.containsKey('user_os')) {
      this.userOs = json['user_os'];
    }
    if (json.containsKey('user_browsers')) {
      this.userBrowsers = json['user_browsers'];
    }
    if (json.containsKey('retargeting_groups')) {
      this.retargetingGroups = json['retargeting_groups'];
    }
    if (json.containsKey('retargeting_groups_not')) {
      this.retargetingGroupsNot = json['retargeting_groups_not'];
    }
    if (json.containsKey('events_retargeting_groups')) {
      this.eventsRetargetingGroups = json['events_retargeting_groups'];
    }
    if (json.containsKey('paying')) {
      this.paying = json['paying'];
    }
    if (json.containsKey('travellers')) {
      this.travellers = json['travellers'];
    }
    if (json.containsKey('school_from')) {
      this.schoolFrom = json['school_from'];
    }
    if (json.containsKey('school_to')) {
      this.schoolTo = json['school_to'];
    }
    if (json.containsKey('uni_from')) {
      this.uniFrom = json['uni_from'];
    }
    if (json.containsKey('uni_to')) {
      this.uniTo = json['uni_to'];
    }
    if (json.containsKey('count')) {
      this.count = json['count'];
    }
    if (json.containsKey('campaign_id')) {
      this.campaignId = json['campaign_id'];
    }
    if (json.containsKey('id')) {
      this.id = json['id'];
    }
  }

  Map<String, dynamic> toJson() => {
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
