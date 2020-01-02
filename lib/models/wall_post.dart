import 'package:ads_cloner/api/vk_api_objects.dart';

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
          //_result += attachment.type;
          _result += attachment.link.url + ',';
          break;
        // case 'doc':
        //   _result += attachment.doc.ownerId.toString();
        //   break;
        // TODO: after Doc attachment is made!
        // case 'page':
        //   _result += attachment.page.ownerId.toString();
        //   break;
        // TODO: after WikiPage attachment is made!
        case 'note':
          _result += attachment.type;
          _result += attachment.note.ownerId.toString();
          _result += '_' + attachment.note.id.toString() + ',';
          break;
        // case 'poll':
        //   _result += attachment.poll.ownerId.toString();
        //   break;
        // TODO after Poll attachment is made;
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
            _result += 'pretty_card' + card.cardId.toString() + ',';
          }
          break;
        default:
          break;
      }
    }
    print(_result);
    if (_result != '') {
      return _result.substring(0, _result.length - 1);
    } else
      return 'no result';
  }

  WallPost.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      this.id = json['id'];
    }
    if (json.containsKey('owner_id')) {
      this.ownerId = json['owner_id'];
    }
    if (json.containsKey('from_id')) {
      this.fromId = json['from_id'];
    }
    if (json.containsKey('created_by')) {
      this.createdBy = json['created_by'];
    }
    if (json.containsKey('date')) {
      this.date = json['date'];
    }
    if (json.containsKey('text')) {
      this.text = json['text'];
    }
    if (json.containsKey('reply_owner_id')) {
      this.replyOwnerId = json['reply_owner_id'];
    }
    if (json.containsKey('reply_post_id')) {
      this.replyPostId = json['reply_post_id'];
    }
    if (json.containsKey('friends_only')) {
      this.friendsOnly = json['friends_only'];
    }
    if (json.containsKey('comments')) {
      this.comments = Comments.fromJSON(json['comments']);
    }
    if (json.containsKey('likes')) {
      this.likes = Likes.fromJSON(json['likes']);
    }
    if (json.containsKey('reposts')) {
      this.reposts = Reposts.fromJSON(json['reposts']);
    }
    if (json.containsKey('views')) {
      this.views = Views.fromJSON(json['views']);
    }
    if (json.containsKey('post_type')) {
      this.postType = json['post_type'];
    }
    if (json.containsKey('post_source')) {
      this.postSource = PostSource.fromJSON(json['post_source']);
    }
    if (json.containsKey('attachments')) {
      var list = json['attachments'] as List;
      this.attachments = list.map((i) => PostAttachment.fromJSON(i)).toList();
    }
    if (json.containsKey('geo')) {
      this.geo = Geo.fromJSON(json['geo']);
    }

    if (json.containsKey('signer_id')) {
      this.signerId = json['signer_id'];
    }
    //copy_history
    if (json.containsKey('can_pin')) {
      this.canPin = json['can_pin'];
    }
    if (json.containsKey('can_delete')) {
      this.canDelete = json['can_delete'];
    }
    if (json.containsKey('can_edit')) {
      this.canEdit = json['can_edit'];
    }
    if (json.containsKey('is_pinned')) {
      this.isPinned = json['is_pinned'];
    }
    if (json.containsKey('marked_ad_ads')) {
      this.markedAsAds = json['marked_as_ads'];
    }
    if (json.containsKey('is_favorite')) {
      this.isFavorite = json['is_favorite'];
    }
    if (json.containsKey('postponed_id')) {
      this.postponedId = json['postponed_id'];
    }
    if (json.containsKey('is_promoted_post_stealth')) {
      this.isPromotedPostStealth = json['is_promoted_post_stealth'];
    }
  }
}
