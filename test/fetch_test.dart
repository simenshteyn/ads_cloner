import 'dart:convert';
import 'dart:io';

import 'package:ads_cloner/api/vk_api.dart';
import 'package:ads_cloner/models/ads_layout_list.dart';
import 'package:ads_cloner/models/ads_targeting_list.dart';
import 'package:test/test.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

void main() {
  test('Testing bytefetch from img', () async {
    var jsonString =
        '''{"response":[{"campaign_id":1014196139,"id":"65121493","goal_type":2,"cost_type":0,"age_restriction":"0","title":"Внимание, отличная работа","description":"Бесплатно обучим с нуля за 6 недель и трудоустроим мастера по ресницам, зарплата до 65 тыс","link_url":"https:\/\/lash.pro\/?utm_source=vk&utm_medium=cpc&utm_campaign=job_lashmaker&utm_term=job_int&utm_content=01","link_domain":"lash.pro","link_title":"Жми, чтобы узнать больше⇒","link_button":"more","ad_format":11,"preview_link":"https:\/\/vk.com\/ads?act=preview_ad&mid=21307092&id=65121493&t=1596543530&hash=19c551f485664099f7","image_src":"https:\/\/sun9-45.userapi.com\/c846120\/v846120530\/1cb5dd\/a-Xs280aSlg.jpg","image_src_2x":"https:\/\/sun9-55.userapi.com\/c846120\/v846120992\/1cbc9c\/b6hTrio1qiI.jpg","icon_src":"https:\/\/sun9-52.userapi.com\/c846320\/v846320619\/1ca832\/rZUeCOUI0PM.jpg"}]}''';
    var map = json.decode(jsonString);
    var lst = AdsLayoutList.fromJson(map);
    expect(lst.adsLayout[0].id, "65121493");
    var vk = VkApi(
        userToken:
            'a889969ff058900b4df0b25aed1eb56d27cf2d4776a27f238b0030603c145ddf4cd59968085ae83c105b4');
    var result = await vk.uploadFileFromUrl(
        url: lst.adsLayout[0].imageSrc2x, adFormat: 11);
    print(result.toJson().toString());
  });
}
