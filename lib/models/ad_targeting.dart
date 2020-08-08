import 'package:ads_cloner/api/vk_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ads_cloner/api/target_objects_ids.dart';

part 'ad_targeting.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdTargeting {
  String sex, ageFrom, ageTo, birthday, country, cities, citiesNot;
  String geoNear, geoPointType, statuses, groups, groupsNot, groupsActive;
  String apps, appsNot, districts, stations, streets, schools, positions;
  String religions, interestCategories, interests, userDevices, userOs;
  String userBrowsers, retargetingGroups, retargetingGroupsNot;
  String groupsRecommended, groupsFormula, groupsActiveFormula, groupsActiveRecommended; // Not documented in api
  //Map<String, List<int>> eventsRetargetingGroups;
  String paying, travellers, schoolFrom;
  String schoolTo, uniFrom, uniTo;
  String count, campaignId, id; //not targeting, but still exists.
  // More field information here: https://vk.com/dev/ads_targeting

  AdTargeting(
    this.sex,
    this.ageFrom,
    this.ageTo,
    this.birthday,
    this.country,
    this.cities,
    this.citiesNot,
    this.geoNear,
    this.geoPointType,
    this.statuses,
    this.groups,
    this.groupsNot,
    this.groupsActive,
    this.apps,
    this.appsNot,
    this.districts,
    this.stations,
    this.streets,
    this.schools,
    this.positions,
    this.religions,
    this.interestCategories,
    this.interests,
    this.userDevices,
    this.userOs,
    this.userBrowsers,
    this.retargetingGroups,
    this.retargetingGroupsNot,
    this.groupsRecommended, //not documented in api
    this.groupsFormula, //not documented in api
    this.groupsActiveFormula, //not documentes
    this.groupsActiveRecommended, //not documented
    //this.eventsRetargetingGroups,
    this.paying,
    this.travellers,
    this.schoolFrom,
    this.schoolTo,
    this.uniFrom,
    this.uniTo,
    this.count,
    this.campaignId,
    this.id,
  );

  factory AdTargeting.fromJson(Map<String, dynamic> json) =>
      _$AdTargetingFromJson(json);
  Map<String, dynamic> toJson() => _$AdTargetingToJson(this);

  String get getCountryString {
    return _getFieldString(this.country, getCountyById);
  }

  String get getInterestsCategoriesString {
    return _getFieldString(this.interestCategories, getInterestCategoryById);
  }

  Future<String> getCitiesString(VkApi vkApi) async {
    var citiesList = await vkApi.databaseGetCitiesById(this.cities);
    String resultString = '';
    for (var city in citiesList.cities) {
      resultString += city.title + ', ';
    }
    return resultString.substring(0, resultString.length - 2);
  }

  Future<String> getCitiesNotString(VkApi vkApi) async {
    var citiesList = await vkApi.databaseGetCitiesById(this.citiesNot);
    String resultString = '';
    for (var city in citiesList.cities) {
      resultString += city.title + ', ';
    }
    return resultString.substring(0, resultString.length - 2);
  }

  String _getFieldString(String str, Function func) {
    var idList = str.split(',');
    String resultString = '';
    for (var id in idList) {
      var string = func(int.tryParse(id)) + ', ';
      resultString += string;
      return resultString.substring(0, resultString.length - 2);
    }
  }
}
