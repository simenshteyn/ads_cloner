import 'package:ads_cloner/models/wall_post_list.dart';
import 'package:test/test.dart';
import 'dart:async';

void main() {
  test('WallPostList Class testing from JSON', () async {
    final stringJson = '''{"response":[
          {"id":118,
          "from_id":-172481799,
          "owner_id":-172481799,
          "date":1554972496,
          "marked_as_ads":0,
          "post_type":"post_ads",
          "text":"Руководитель? Жми! —---->->",
          "attachments":[{"type":"link","link":{"url":"http:\/\/vk.com\/bosslvlgod","title":"Руководитель. Уровень Бог","caption":"vk.com","description":"Коучинг по личной эффективности для предпринимателей","photo":{"id":456265329,"album_id":-25,"owner_id":2000028971,"sizes":[{"type":"a","url":"https:\/\/sun9-29.userapi.com\/c847121\/v847121003\/1db129\/giECJVPeeAo.jpg","width":200,"height":90},{"type":"b","url":"https:\/\/sun9-34.userapi.com\/c847121\/v847121003\/1db127\/WBa_T1B_wC4.jpg","width":400,"height":179},{"type":"c","url":"https:\/\/sun9-50.userapi.com\/c847121\/v847121003\/1db12b\/RMD45O_um0w.jpg","width":200,"height":200},{"type":"d","url":"https:\/\/sun9-40.userapi.com\/c847121\/v847121003\/1db12c\/GcUbuuvaQVs.jpg","width":100,"height":100},{"type":"e","url":"https:\/\/sun9-18.userapi.com\/c847121\/v847121003\/1db12d\/Z7yJ3r5_FbQ.jpg","width":50,"height":50},{"type":"k","url":"https:\/\/sun9-15.userapi.com\/c847121\/v847121003\/1db128\/lcvbWoas5rA.jpg","width":1070,"height":480},{"type":"l","url":"https:\/\/sun9-58.userapi.com\/c847121\/v847121003\/1db12a\/imZnPyQu_GE.jpg","width":537,"height":240},{"type":"o","url":"https:\/\/sun9-63.userapi.com\/c847121\/v847121003\/1db126\/Gx-C95oLlrI.jpg","width":1121,"height":503}],"text":"","date":1554969902},"button":{"title":"Подписаться","action":{"type":"open_url","url":"http:\/\/vk.com\/bosslvlgod"}},"is_favorite":false}}],
          "post_source":{"type":"vk"},
          "comments":{"count":0,"can_post":0},
          "likes":{"count":0,"user_likes":0,"can_like":1,"can_publish":1},
          "reposts":{"count":0,"user_reposted":0},
          "is_favorite":false}
          ]}''';
    final wallPosts = WallPostList.fromJSON(stringJson);
    expect(wallPosts.wallPosts.length, 1);
    expect(wallPosts.wallPosts[0].id, 118);
    expect(wallPosts.wallPosts[0].views, null);
  });
}
