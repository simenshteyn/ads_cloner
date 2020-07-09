//import 'package:flutter/foundation.dart';

class Comments {
  /// https://vk.com/dev/objects/post -- comments object
  int count, canPost, canClose;
  bool groupsCanPost, canOpen;
  Comments.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('count')) {
      this.count = json['count'];
    }
    if (json.containsKey('can_post')) {
      this.canPost = json['can_post'];
    }
    if (json.containsKey('groups_can_post')) {
      this.groupsCanPost = json['groups_can_post'];
    }
    if (json.containsKey('can_close')) {
      this.canClose = json['can_close'];
    }
    if (json.containsKey('can_open')) {
      this.canOpen = json['can_open'];
    }
  }
}

class Likes {
  /// https://vk.com/dev/objects/post -- likes object
  int count, userLikes, canLike, canPublish;
  Likes.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('count')) {
      this.count = json['count'];
    }
    this.userLikes = json['user_likes'];
    this.canLike = json['can_like'];
    this.canPublish = json['can_publish'];
  }
}

class Reposts {
  /// https://vk.com/dev/objects/post -- reposts object
  int count, userReposted;
  Reposts.fromJSON(Map<String, dynamic> json) {
    this.count = json['count'];
    this.userReposted = json['user_reposted'];
  }
}

class Views {
  /// https://vk.com/dev/objects/post -- views object
  int count;
  Views.fromJSON(Map<String, dynamic> json) {
    this.count = json['count'];
  }
}

class PostSource {
  /// https://vk.com/dev/objects/post - post_source object
  /// More info at: https://vk.com/dev/objects/post_source
  String type, platform, data, url;
  PostSource.fromJSON(Map<String, dynamic> json) {
    this.type = json['type'];
    this.platform = json['platform'];
    this.data = json['data'];
    this.url = json['url'];
  }
}

// ATTACHMENTS, more info at: https://vk.com/dev/objects/attachments_w

class PostAttachment {
  String type;
  Photo photo;
  Video video;
  Audio audio;
  //Doc doc;
  //Graffiti graffiti;
  Link link;
  Note note;
  Poll poll; //TODO: make this
  //Page page;
  Album album;
  //PhotosList photosList;
  MarketItem market;
  MarketAlbum marketAlbum;
  //Sticker sticker;
  PrettyCards prettyCards;
  Event event;

  PostAttachment.fromJSON(Map<String, dynamic> json) {
    this.type = json['type'];
    if (json.containsKey('photo')) {
      this.photo = Photo.fromJSON(json['photo']);
    }
    if (json.containsKey('video')) {
      this.video = Video.fromJSON(json['video']);
    }
    if (json.containsKey('audio')) {
      this.audio = Audio.fromJSON(json['audio']);
    }
    if (json.containsKey('link')) {
      this.link = Link.fromJSON(json['link']);
    }
    if (json.containsKey('note')) {
      this.note = Note.fromJSON(json['note']);
    }
    if (json.containsKey('album')) {
      this.album = Album.formJSON(json['album']);
    }
    if (json.containsKey('market')) {
      this.market = MarketItem.fromJSON(json['market']);
    }
    if (json.containsKey('market_album')) {
      this.marketAlbum = MarketAlbum.fromJSON(json['market_album']);
    }
    if (json.containsKey('pretty_cards')) {
      this.prettyCards = PrettyCards.fromJSON(json['pretty_cards']);
    }
    if (json.containsKey('event')) {
      this.event = Event.fromJSON(json['event']);
    }
  }
}

class Photo {
  // More info at: https://vk.com/dev/objects/photo
  int id, albumId, ownerId, userId, date, width, height;
  String text;
  List<PhotoSizesObject> sizes;
  Photo.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.albumId = json['album_id'];
    this.ownerId = json['owner_id'];
    this.userId = json['user_id'];
    this.date = json['date'];
    var list = json['sizes'] as List;
    this.sizes = list.map((i) => PhotoSizesObject.jromJSON(i)).toList();
    this.width = json['width'];
    this.height = json['height'];
    this.text = json['text'];
  }
}

class PhotoSizesObject {
  /// To use with Photo class
  String type, url;
  int width, height;
  PhotoSizesObject.jromJSON(Map<String, dynamic> json) {
    this.type = json['type'];
    this.url = json['url'];
    this.width = json['width'];
    this.height = json['height'];
  }
}

class Video {
  /// More info at: https://vk.com/dev/objects/video
  int id,
      ownerId,
      duration,
      date,
      addingDate,
      views,
      comments,
      canEdit,
      canAdd,
      isPrivate;
  String title, description, photo130, photo320, photo640, photo800, photo1280;
  String firstFrame130,
      firstFrame320,
      firstFrame640,
      firstFrame800,
      firstFrame1280;
  String player, platform, accessKey;
  int processing, live, upcoming;
  bool isFavorite;

  Video.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['owner_id'];
    this.duration = json['duration'];
    this.date = json['date'];
    this.addingDate = json['adding_date'];
    this.views = json['views'];
    this.comments = json['comments'];
    this.canEdit = json['can_edit'];
    this.canAdd = json['can_add'];
    this.isPrivate = json['is_private'];
    this.title = json['title'];
    this.description = json['description'];
    this.photo130 = json['photo_130'];
    this.photo320 = json['photo_320'];
    this.photo640 = json['photo_640'];
    this.photo800 = json['photo_800'];
    this.photo1280 = json['photo_1280'];
    this.firstFrame130 = json['first_frame_130'];
    this.firstFrame320 = json['first_frame_320'];
    this.firstFrame640 = json['first_frame_640'];
    this.firstFrame800 = json['first_frame_800'];
    this.firstFrame1280 = json['first_frame_1280'];
    this.player = json['player'];
    this.platform = json['platform'];
    this.accessKey = json['access_key'];
    this.processing = json['processing'];
    this.live = json['live'];
    this.upcoming = json['upcoming'];
    this.isFavorite = json['is_favorite'];
  }
}

class Audio {
  /// More info at: https://vk.com/dev/objects/audio
  int id, ownerId, duration, lyricsId, albumId, genreId, date, noSearch, isHq;
  String artist, title, url;
  Audio.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['owner_id'];
    this.duration = json['duration'];
    this.lyricsId = json['lyrics_id'];
    this.albumId = json['album_id'];
    this.genreId = json['genre_id'];
    this.date = json['date'];
    this.noSearch = json['no_search'];
    this.isHq = json['is_hq'];
    this.artist = json['artist'];
    this.title = json['title'];
    this.url = json['url'];
  }
}

class Link {
  /// More info at: https://vk.com/dev/objects/link
  String url, title, caption, description, previewPage, previewUrl;
  Photo photo;
  Video video;
  Product product;
  Button button;
  Link.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('url')) {
      this.url = json['url'];
    }
    if (json.containsKey('title')) {
      this.title = json['title'];
    }
    if (json.containsKey('caption')) {
      this.caption = json['caption'];
    }
    if (json.containsKey('description')) {
      this.description = json['description'];
      //Can contain shit that cause JSON parsing error
    }
    if (json.containsKey('preview_page')) {
      this.previewPage = json['preview_page'];
    }
    if (json.containsKey('preview_url')) {
      this.previewUrl = json['preview_url'];
    }
    if (json.containsKey('photo')) {
      this.photo = Photo.fromJSON(json['photo']);
    }
    if (json.containsKey('video')) {
      this.video = Video.fromJSON(json['video']);
    }
    if (json.containsKey('product')) {
      this.product = Product.fromJSON(json['product']);
    }
    if (json.containsKey('button')) {
      this.button = Button.fromJSON(json['button']);
    }
  }
}

class Button {
  String title;
  Action action;
  Button.fromJSON(Map<String, dynamic> json) {
    this.title = json['title'];
    this.action = Action.fromJSON(json['action']);
  }
}

class Action {
  String type, url;
  Action.fromJSON(Map<String, dynamic> json) {
    this.type = json['type'];
    this.url = json['url'];
  }
}

class Product {
  /// More info at: https://vk.com/dev/link_product
  Price price;
  Product.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('price')) {
      this.price = Price.fromJSON(json['price']);
    }
  }
}

class Price {
  /// More info at: https://vk.com/dev/price
  int amount;
  Currency currency;
  String text;
  Price.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('amount')) {
      this.amount = json['amount'];
    }
    if (json.containsKey('text')) {
      this.text = json['text'];
    }
    if (json.containsKey('currency')) {
      this.currency = Currency.fromJSON(json['currency']);
    }
  }
}

class Currency {
  /// More info at: https://vk.com/dev/price
  int id;
  String name;
  Currency.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }
}

class Note {
  /// Additional info at https://vk.com/dev/objects/note
  int id, ownerId, date, comments, readComments;
  String title, text, viewUrl;
  Note.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['owner_id'];
    this.title = json['title'];
    this.text = json['text'];
    this.date = json['date'];
    this.comments = json['comments'];
    this.readComments = json['read_comments'];
    this.viewUrl = json['view_url'];
  }
}

class Poll {
  /// TODO, https://vk.com/dev/objects/poll
}

class Album {
  /// More info at https://vk.com/dev/objects/attachments_w
  int id, ownerId, created, updated, size;
  String title, description;
  Photo thumb;
  Album.formJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.thumb = Photo.fromJSON(json['thumb']);
    this.ownerId = json['owner_id'];
    this.title = json['title'];
    this.description = json['description'];
    this.created = json['created'];
    this.updated = json['updated'];
    this.size = json['size'];
  }
}

class MarketItem {
  /// More info at: https://vk.com/dev/objects/market_item
  /// TODO: add optional fields for extended=1
  int id, ownerId, date, availability;
  String title, description, thumbPhoto;
  Price price;
  MarketItemCategory category;
  bool isFavorite;
  MarketItem.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['owner_id'];
    this.title = json['title'];
    this.description = json['description'];
    this.price = Price.fromJSON(json['price']);
    this.category = MarketItemCategory.fromJSON(json['category']);
    this.thumbPhoto = json['thumb_photo'];
    this.date = json['date'];
    this.availability = json['availability'];
    this.isFavorite = json['is_favorite'];
  }
}

class MarketItemCategory {
  /// To work with MarketItem Class
  /// More info: https://vk.com/dev/objects/market_item
  int id;
  String name;
  Section section;
  MarketItemCategory.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.section = Section.fromJSON(json['section']);
  }
}

class Section {
  /// To work with MarketItemCategory Class
  /// More info: https://vk.com/dev/objects/market_item
  int id;
  String name;
  Section.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }
}

class MarketAlbum {
  int id, ownerId, title, count, updatedTime;
  Photo photo;
  MarketAlbum.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['owner_id'];
    this.title = json['title'];
    this.photo = Photo.fromJSON(json['photo']);
    this.count = json['count'];
    this.updatedTime = json['updated_time'];
  }
}

class Sticker {
  ///TODO: https://vk.com/dev/objects/sticker
}

class PrettyCards {
  List<Card> cards;
  PrettyCards.fromJSON(Map<String, dynamic> json) {
    var list = json['cards'] as List;
    this.cards = list.map((i) => Card.fromJSON(i)).toList();
  }
}

class Card {
  String cardId, linkUrl, title, price, priceOld;
  List<CardImage> images;
  Button button;
  Card.fromJSON(Map<String, dynamic> json) {
    this.cardId = json['card_id'];
    this.linkUrl = json['link_url'];
    this.title = json['title'];
    var list = json['images'] as List;
    this.images = list.map((i) => CardImage.fromJSON(i)).toList();
    this.button = Button.fromJSON(json['button']);
    this.price = json['price'];
    this.priceOld = json['price_old'];
  }
}

class CardImage {
  String url;
  int width, height;
  CardImage.fromJSON(Map<String, dynamic> json) {
    this.url = json['url'];
    this.width = json['width'];
    this.height = json['height'];
  }
}

class Event {
  /// More info at: https://vk.com/dev/objects/attachments_w
  int id, time, memberStatus;
  bool isFavorite;
  String address, text, buttonText;
  List<int> friends;
  Event.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.time = json['time'];
    this.memberStatus = json['member_status'];
    this.isFavorite = json['is_favorite'];
    this.address = json['address'];
    this.text = json['text'];
    this.buttonText = json['button_text'];
    var list = json['friends'] as List;
    this.friends = list.cast<int>();
  }
}

// END OF ATTACHMENTS

class Geo {
  String type, coordinates;
  Place place;
  Geo.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey('type')) {
      this.type = json['type'];
    }
    if (json.containsKey('coordinates')) {
      this.coordinates = json['coordinates'];
    }
    if (json.containsKey('place')) {
      this.place = Place.fromJSON(json['place']);
    }
  }
}

class Place {
  int id, latitude, longitude, created, checkins, updated, type, country, city;
  String title, icon, address;
  Place.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
    this.created = json['created'];
    this.icon = json['icon'];
    this.checkins = json['checkins'];
    this.updated = json['updated'];
    this.type = json['type'];
    this.country = json['country'];
    this.city = json['city'];
    this.address = json['address'];
  }
}
