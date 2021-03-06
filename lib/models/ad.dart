import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ad.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Ad {
  int campaignId,
      status,
      goalType,
      costType,
      adFormat,
      impressionsLimit,
      adPlatformNoAdNetwork;
  String id,
      approved,
      createTime,
      updateTime,
      dayLimit,
      allLimit,
      startTime,
      stopTime,
      category1Id;
  String category2Id, ageRestriction, name, cpc, cpm, ocpm;
  dynamic adPlatform;
  int impressionsLimited, adPlatformNoWall, autobidding;
  String autobiddingMaxCost;
  int video, disclaimerMedical, disclaimerSpecialist, disclaimerSupplements;
  List weeklyScheduleHours;
  int weeklyScheduleUseHolidays;
  Map<String, List<int>> eventsRetargetingGroups;

  Ad(
    this.campaignId,
    this.status,
    this.goalType,
    this.costType,
    this.adFormat,
    this.impressionsLimit,
    this.adPlatformNoAdNetwork,
    this.id,
    this.approved,
    this.createTime,
    this.updateTime,
    this.dayLimit,
    this.allLimit,
    this.startTime,
    this.stopTime,
    this.category1Id,
    this.category2Id,
    this.ageRestriction,
    this.name,
    this.adPlatform,
    this.cpc,
    this.ocpm,
    this.cpm,
    this.impressionsLimited,
    this.adPlatformNoWall,
    this.autobidding,
    this.autobiddingMaxCost,
    this.video,
    this.disclaimerMedical,
    this.disclaimerSpecialist,
    this.disclaimerSupplements,
    this.weeklyScheduleHours,
    this.weeklyScheduleUseHolidays,
    this.eventsRetargetingGroups,
  );

  factory Ad.fromJson(Map<String, dynamic> json) {
    if (json['events_retargeting_groups'] is List<dynamic>) {
      json.remove('events_retargeting_groups');
    }
    return _$AdFromJson(json);
  }
  Map<String, dynamic> toJson() => _$AdToJson(this);

  Ad clone() {
    final String jsonString = json.encode(this);
    final jsonResponse = json.decode(jsonString);
    return Ad.fromJson(jsonResponse as Map<String, dynamic>);
  }

  bool get isWallPostFormat => this.adFormat == 9 ? true : false;

  bool get isAdaptiveFormat => this.adFormat == 11 ? true : false;

  bool get isImageTextFormat => this.adFormat == 1 ? true : false;

  bool get isBigImageFormat => this.adFormat == 2 ? true : false;

  Widget get getClickInfoWidget {
    final TextStyle _textStyleUp = TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 12.0);
    final TextStyle _textStyleDown = TextStyle(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14.0);
    switch (this.costType) {
      case 0:
        {
          return ListTile(
            dense: true,
            title: Text('???????? ???? ????????', style: _textStyleUp),
            subtitle: Text('${int.tryParse(this.cpc) / 100} ???',
                style: _textStyleDown),
          );
        }
      case 1:
        {
          return ListTile(
            dense: true,
            title: Text('???????? ???? 1000 ??????????????', style: _textStyleUp),
            subtitle: Text('${int.tryParse(this.cpm) / 100} ???',
                style: _textStyleDown),
          );
        }
      case 3:
        {
          return ListTile(
            dense: true,
            title: Text('???????????????? ???????? ????????????', style: _textStyleUp),
            subtitle: Text('${int.tryParse(this.ocpm) / 100} ???',
                style: _textStyleDown),
          );
        }
      default:
        {
          return ListTile(
            dense: true,
            title: Text('???????? ????????????????????', style: _textStyleUp),
            subtitle: Text('???? ????????????????????', style: _textStyleDown),
          );
        }
    }
  }
}
