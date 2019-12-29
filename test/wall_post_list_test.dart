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

  test('Second Wall Post List Testing', () async {
    final stringJson = '''{"response":
    [
      {"id":119,
      "from_id":-172481799,
      "owner_id":-172481799,
      "date":1554992805,
      "marked_as_ads":0,
      "post_type":"post_ads",
      "text":"Руководитель? Жми! —---->->",
      "attachments":
      [
        {"type":"link",
        "link":
        {"url":"http:\/\/vk.com\/bosslvlgod",
        "title":"Руководитель. Уровень Бог",
        "caption":"vk.com",
        "description":"Коучинг по личной эффективности для предпринимателей",
        "photo":
        {"id":456265796,
        "album_id":-28,
        "owner_id":2000029089,
        "sizes":
        [
          {"type":"a",
          "url":"https:\/\/sun9-39.userapi.com\/c850032\/v850032360\/16b100\/674La6DKpJU.jpg",
          "width":200,"height":89},
          {"type":"b",
          "url":"https:\/\/sun9-31.userapi.com\/c850032\/v850032360\/16b0fe\/qdAmulgnPDM.jpg",
          "width":400,"height":179},
          {"type":"c",
          "url":"https:\/\/sun9-5.userapi.com\/c850032\/v850032360\/16b102\/XrLq6iox1eg.jpg",
          "width":200,
          "height":200},
          {"type":"d",
          "url":"https:\/\/sun9-18.userapi.com\/c850032\/v850032360\/16b103\/oBPWIpqfTII.jpg",
          "width":100,
          "height":100},
          {"type":"e",
          "url":"https:\/\/sun9-60.userapi.com\/c850032\/v850032360\/16b104\/NKu5rSWKAjo.jpg",
          "width":50,
          "height":50},
          {"type":"k",
          "url":"https:\/\/sun9-49.userapi.com\/c850032\/v850032360\/16b0ff\/7YcY7NHfxok.jpg",
          "width":1074,
          "height":479},
          {"type":"l",
          "url":"https:\/\/sun9-38.userapi.com\/c850032\/v850032360\/16b101\/imzcyhUhJeU.jpg",
          "width":537,
          "height":240},
          {"type":"o",
          "url":"https:\/\/sun9-127.userapi.com\/c850032\/v850032360\/16b0fd\/qFr0nMuZyeA.jpg",
          "width":849,
          "height":379}
          ],
        "text":"",
        "date":1554992915},
        "button":
        {"title":"Подписаться",
        "action":
        {"type":"open_url",
        "url":"http:\/\/vk.com\/bosslvlgod"}
        },
        "is_favorite":false}}],
        "post_source":{"type":"vk"},
        "comments":{"count":0,"can_post":0},
        "likes":{"count":0,"user_likes":0,"can_like":1,"can_publish":1},
        "reposts":{"count":0,"user_reposted":0},
        "is_favorite":false,
        "edited":1554992915}]}''';
    final wallPosts = WallPostList.fromJSON(stringJson);
    expect(wallPosts.wallPosts.length, 1);
    expect(wallPosts.wallPosts[0].attachments[0].type, "link");
    expect(wallPosts.wallPosts[0].attachments[0].link.caption, "vk.com");
  });

  test('Carousel testing', () async {
    final stringJson = '''{"response":[{"id":2957,"from_id":-25212245,"owner_id":-25212245,"date":1576640854,"marked_as_ads":0,"post_type":"post_ads","text":"Carousel text","attachments":[{"type":"pretty_cards","pretty_cards":{"cards":[{"card_id":"-25212245_6444439","link_url_target":"internal","link_url":"http:\/\/mail.ru","title":"Title","button":{"title":"В магазин","action":{"type":"open_url","url":"http:\/\/mail.ru","target":"internal"}},"photo":"-25212245_457243658","images":[{"url":"https:\/\/sun9-27.userapi.com\/c855220\/v855220025\/1a7b97\/c3_7FK1RPFg.jpg","width":200,"height":200},{"url":"https:\/\/sun9-127.userapi.com\/c855220\/v855220843\/1a930b\/QoxaRls2lOk.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444440","link_url_target":"external","link_url":"tel:+78121234567","title":"Title2","button":{"title":"Выбрать","action":{"type":"open_url","url":"tel:+78121234567","target":"external"}},"photo":"-25212245_457243659","images":[{"url":"https:\/\/sun9-20.userapi.com\/c855236\/v855236785\/1a98a2\/LYZJQqYfkK8.jpg","width":200,"height":200},{"url":"https:\/\/sun9-35.userapi.com\/c855236\/v855236808\/1a20cb\/O9itThVr8_c.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444441","link_url_target":"internal","link_url":"http:\/\/vk.com\/app5619682_-103600381","title":"Title3","button":{"title":"Узнать","action":{"type":"open_url","url":"http:\/\/vk.com\/app5619682_-103600381","target":"internal"}},"photo":"-25212245_457243660","images":[{"url":"https:\/\/sun9-38.userapi.com\/c855216\/v855216687\/1ab0b3\/8CNtbK6UpYo.jpg","width":200,"height":200},{"url":"https:\/\/sun9-11.userapi.com\/c855216\/v855216545\/1a5c7c\/U0fA49eh0Og.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444442","link_url_target":"internal","link_url":"http:\/\/vk.me\/adsnews","title":"Title4","button":{"title":"Перейти","action":{"type":"open_url","url":"https:\/\/vk.com\/im?sel=-19542789","target":"internal","group_id":19542789}},"photo":"-25212245_457243661","images":[{"url":"https:\/\/sun9-43.userapi.com\/c858532\/v858532738\/861b6\/nWtG_Qn9e5I.jpg","width":200,"height":200},{"url":"https:\/\/sun9-52.userapi.com\/c858532\/v858532158\/84909\/KsqjWQV-8UQ.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444443","link_url_target":"internal","link_url":"http:\/\/vk.com\/team","title":"Title5","button":{"title":"Открыть","action":{"type":"open_url","url":"https:\/\/vk.com\/public22822305","target":"internal","group_id":22822305}},"photo":"-25212245_457243662","images":[{"url":"https:\/\/sun9-5.userapi.com\/c855616\/v855616926\/1a5859\/INB0zaxjgB0.jpg","width":200,"height":200},{"url":"https:\/\/sun9-67.userapi.com\/c855616\/v855616437\/1a450b\/X5FFcTkwl5Q.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444444","link_url_target":"internal","link_url":"http:\/\/vk.com\/team","title":"Title6","button":{"title":"Начать","action":{"type":"open_url","url":"https:\/\/vk.com\/public22822305","target":"internal","group_id":22822305}},"photo":"-25212245_457243663","images":[{"url":"https:\/\/sun9-45.userapi.com\/c205328\/v205328194\/134e1\/Fvw_HqB1thQ.jpg","width":200,"height":200},{"url":"https:\/\/sun9-41.userapi.com\/c205328\/v205328350\/13754\/_ECK2X56ijs.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444445","link_url_target":"internal","link_url":"http:\/\/vk.com\/team","title":"Title7","button":{"title":"Перейти","action":{"type":"open_url","url":"https:\/\/vk.com\/public22822305","target":"internal","group_id":22822305}},"photo":"-25212245_457243664","images":[{"url":"https:\/\/sun9-32.userapi.com\/c206724\/v206724361\/13a56\/uMu2Vm9T5sU.jpg","width":200,"height":200},{"url":"https:\/\/sun9-37.userapi.com\/c206724\/v206724071\/1401a\/QTDWvCd0Ris.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444446","link_url_target":"internal","link_url":"http:\/\/vk.com\/team","title":"Title8","button":{"title":"Открыть","action":{"type":"open_url","url":"https:\/\/vk.com\/public22822305","target":"internal","group_id":22822305}},"photo":"-25212245_457243665","images":[{"url":"https:\/\/sun9-25.userapi.com\/c855428\/v855428823\/1a8066\/9YC6-_QkYog.jpg","width":200,"height":200},{"url":"https:\/\/sun9-24.userapi.com\/c855428\/v855428038\/1a93d5\/g1c0mSHw9Uc.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444447","link_url_target":"internal","link_url":"http:\/\/vk.com\/team","title":"Title9","button":{"title":"Попробовать","action":{"type":"open_url","url":"https:\/\/vk.com\/public22822305","target":"internal","group_id":22822305}},"photo":"-25212245_457243666","images":[{"url":"https:\/\/sun9-17.userapi.com\/c204524\/v204524120\/13570\/xCELjl0nTDQ.jpg","width":200,"height":200},{"url":"https:\/\/sun9-44.userapi.com\/c204524\/v204524967\/13f06\/_FCka9sII5c.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."},{"card_id":"-25212245_6444448","link_url_target":"internal","link_url":"http:\/\/vk.com\/team","title":"Title10","button":{"title":"Связаться","action":{"type":"open_url","url":"https:\/\/vk.com\/im?sel=-22822305","target":"internal","group_id":22822305}},"photo":"-25212245_457243667","images":[{"url":"https:\/\/sun9-29.userapi.com\/c855232\/v855232614\/1a3cbc\/ErCQcM3Otzo.jpg","width":200,"height":200},{"url":"https:\/\/sun9-69.userapi.com\/c855232\/v855232187\/1a4936\/0dJiAZ8A5vA.jpg","width":400,"height":400}],"price":"500 руб.","price_old":"1 000 руб."}]}}],"post_source":{"type":"vk"},"comments":{"count":0,"can_post":0},"likes":{"count":0,"user_likes":0,"can_like":1,"can_publish":1},"reposts":{"count":0,"user_reposted":0},"is_favorite":false,"is_promoted_post_stealth":true}]}''';
    final wallPosts = WallPostList.fromJSON(stringJson);
    expect(wallPosts.wallPosts.length, 1);
    expect(wallPosts.wallPosts[0].attachments[0].type, "pretty_cards");
    expect(wallPosts.wallPosts[0].attachments[0].prettyCards.cards[0].cardId, "-25212245_6444439");
  });
}
