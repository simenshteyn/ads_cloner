import 'dart:convert';

import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wall_post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallPost {
  int id, ownerId, fromId, createdBy, date, replyOwnerId, replyPostId;
  int friendsOnly, signerId, canPin, canDelete, canEdit, isPinned;
  int markedAsAds, postponedId;
  String text, postType;
  bool isFavorite, isPromotedPostStealth;
  Comments comments;
  Likes likes;
  Reposts reposts;
  Views views;
  PostSource postSource;
  List<PostAttachment> attachments;
  Geo geo;
  // copy_history,

  WallPost(
      this.id,
      this.ownerId,
      this.fromId,
      this.createdBy,
      this.date,
      this.replyOwnerId,
      this.replyPostId,
      this.friendsOnly,
      this.signerId,
      this.canPin,
      this.canDelete,
      this.canEdit,
      this.isPinned,
      this.markedAsAds,
      this.postponedId,
      this.text,
      this.postType,
      this.isFavorite,
      this.isPromotedPostStealth,
      this.comments,
      this.likes,
      this.reposts,
      this.views,
      this.postSource,
      this.attachments,
      this.geo);

  String get attachmentsToString {
    // Returns attachments in string for PostAdsStealth Creation
    // More info at https://vk.com/dev/wall.postAdsStealth
    String _result = '';
    for (var attachment in this.attachments) {
      switch (attachment.type) {
        case 'photo':
          _result += attachment.type;
          _result += attachment.photo.ownerId.toString();
          _result += '_' + attachment.photo.id.toString() + ',';
          break;
        case 'video':
          _result += attachment.type;
          _result += attachment.video.ownerId.toString();
          _result += '_' + attachment.video.id.toString() + ',';
          break;
        case 'audio':
          _result += attachment.type;
          _result += attachment.audio.ownerId.toString();
          _result += '_' + attachment.audio.id.toString() + ',';
          break;
        case 'link':
          _result += attachment.link.url + ',';
          break;
        case 'doc':
          _result += attachment.type;
          _result += attachment.doc.ownerId.toString();
          _result += '_' + attachment.doc.id.toString() + ',';
          break;
        case 'page':
          _result += attachment.type;
          _result += attachment.page.creatorId.toString();
          _result += '_' + attachment.doc.id.toString() + ',';
          break;
        case 'note':
          _result += attachment.type;
          _result += attachment.note.ownerId.toString();
          _result += '_' + attachment.note.id.toString() + ',';
          break;
        case 'poll':
          _result += attachment.type;
          _result += attachment.poll.ownerId.toString();
          _result += '_' + attachment.poll.id.toString() + ',';
          break;
        case 'album':
          _result += attachment.type;
          _result += attachment.album.ownerId.toString();
          _result += '_' + attachment.album.id.toString() + ',';
          break;
        case 'market':
          _result += attachment.type;
          _result += attachment.market.ownerId.toString();
          _result += '_' + attachment.market.id.toString() + ',';
          break;
        case 'market_album':
          _result += attachment.type;
          _result += attachment.marketAlbum.ownerId.toString();
          _result += attachment.marketAlbum.id.toString() + ',';
          break;
        case 'pretty_cards':
          for (var card in attachment.prettyCards.cards) {
            _result += 'pretty_card';
            _result += ownerId.toString();
            _result += '_' + card.cardId.toString() + ',';
          }
          break;
        default:
          break;
      }
    }
    if (_result != '') {
      return _result.substring(0, _result.length - 1);
    } else
      return 'no result';
  }

  String get attachmentsToLinkButton {
    // Returns proper link_button string for method wall.postAdsStealth
    // More info: https://vk.com/dev/wall.postAdsStealth
    String _result;
    var _map = {
      "??????????????????": "app_join",
      "??????????????": "open_url",
      "??????????????": "open",
      "??????????????????": "more",
      "??????????????????": "call",
      "??????????????????????????": "book",
      "????????????????????": "enroll",
      "????????????????????????????????????": "register",
      "????????????": "buy",
      "???????????? ??????????": "buy_ticket",
      "????????????????": "order",
      "??????????????": "create",
      "????????????????????": "install",
      //"??????????????????": "contact", ?????? ?????????????? ????????????
      "??????????????????": "fill",
      "??????????????????????": "join_public",
      "?? ??????????": "join_event",
      "????????????????": "join",
      "??????????????????": "im",
      "????????????????": "im2",
      "????????????": "begin",
      "????????????????": "get",
      "????????????????": "watch",
      "??????????????": "download",
      "??????????????????????": "participate",
      "????????????": "play",
      "???????????? ????????????": "apply",
      "???????????????? ??????????????????????": "get_an_offer",
      //"????????????????": "to_write",  ?????? ?????????????? ????????????
      "????????????????????????": "reply",
    };

    for (var attachment in this.attachments) {
      if (attachment.type == 'link') {
        _result = _map[attachment.link.button.title];
      }
    }
    return _result;
  }

  String get attachmentsToLinkVideo {
    // Returns proper link_video in format <owner_id>_<media_id> to work
    // in wall.postAdsStealth method: https://vk.com/dev/wall.postAdsStealth
    String _result;
    for (var attachment in this.attachments) {
      if ((attachment.type == 'link') && (attachment.link.video != null)) {
        _result = "${attachment.link.video.ownerId}"
            "_"
            "${attachment.link.video.id}";
      }
    }
    return _result;
  }

  bool get hasPrettyCards {
    for (var attach in attachments) {
      if (attach.prettyCards != null) {
        return true;
      }
    }
    return false;
  }

  WallPost clone() {
    final String jsonString = json.encode(this);
    final jsonResponse = json.decode(jsonString);
    return WallPost.fromJson(jsonResponse as Map<String, dynamic>);
  }

  factory WallPost.fromJson(Map<String, dynamic> json) =>
      _$WallPostFromJson(json);
  Map<String, dynamic> toJson() => _$WallPostToJson(this);
}
