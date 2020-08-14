import 'package:SmmHub/models/pretty_card_list.dart';
import 'package:json_annotation/json_annotation.dart';
part 'vk_api_objects.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Comments {
  /// https://vk.com/dev/objects/post -- comments object
  int count, canPost, canClose;
  bool groupsCanPost, canOpen;
  Comments(this.count, this.canPost, this.canClose, this.groupsCanPost,
      this.canOpen);
  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);
  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Likes {
  /// https://vk.com/dev/objects/post -- likes object
  int count, userLikes, canLike, canPublish;
  Likes(this.count, this.userLikes, this.canLike, this.canPublish);
  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);
  Map<String, dynamic> toJson() => _$LikesToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Reposts {
  /// https://vk.com/dev/objects/post -- reposts object
  int count, userReposted;
  Reposts(this.count, this.userReposted);
  factory Reposts.fromJson(Map<String, dynamic> json) =>
      _$RepostsFromJson(json);
  Map<String, dynamic> toJson() => _$RepostsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Views {
  /// https://vk.com/dev/objects/post -- views object
  int count;
  Views(this.count);
  factory Views.fromJson(Map<String, dynamic> json) => _$ViewsFromJson(json);
  Map<String, dynamic> toJson() => _$ViewsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PostSource {
  /// https://vk.com/dev/objects/post - post_source object
  /// More info at: https://vk.com/dev/objects/post_source
  String type, platform, data, url;
  PostSource(this.type, this.platform, this.data, this.url);
  factory PostSource.fromJson(Map<String, dynamic> json) =>
      _$PostSourceFromJson(json);
  Map<String, dynamic> toJson() => _$PostSourceToJson(this);
}

// ATTACHMENTS, more info at: https://vk.com/dev/objects/attachments_w
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PostAttachment {
  String type;
  Photo photo;
  Video video;
  Audio audio;
  Doc doc;
  Graffiti graffiti;
  Link link;
  Note note;
  Poll poll; //TODO: make this
  Page page;
  Album album;
  List<String> photosList;
  MarketItem market;
  MarketAlbum marketAlbum;
  Sticker sticker;
  PrettyCards prettyCards;
  Event event;
  PostAttachment(
      this.type,
      this.photo,
      this.video,
      this.audio,
      this.doc,
      this.graffiti,
      this.link,
      this.note,
      this.poll,
      this.page,
      this.album,
      this.photosList,
      this.market,
      this.marketAlbum,
      this.sticker,
      this.prettyCards,
      this.event);
  factory PostAttachment.fromJson(Map<String, dynamic> json) =>
      _$PostAttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$PostAttachmentToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Photo {
  // More info at: https://vk.com/dev/objects/photo
  int id, albumId, ownerId, userId, date, width, height;
  String text;
  List<PhotoSizesObject> sizes;
  Photo(this.id, this.albumId, this.ownerId, this.userId, this.date, this.width,
      this.height, this.text, this.sizes);
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PhotoSizesObject {
  /// To use with Photo class
  String type, url;
  int width, height;
  PhotoSizesObject(this.type, this.url, this.width, this.height);
  factory PhotoSizesObject.fromJson(Map<String, dynamic> json) =>
      _$PhotoSizesObjectFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoSizesObjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
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
  String title, description;
  @JsonKey(name: 'photo_130')
  String photo130;
  @JsonKey(name: 'photo_320')
  String photo320;
  @JsonKey(name: 'photo_640')
  String photo640;
  @JsonKey(name: 'photo_800')
  String photo800;
  @JsonKey(name: 'photo_1280')
  String photo1280;
  @JsonKey(name: 'first_frame_130')
  String firstFrame130;
  @JsonKey(name: 'first_frame_320')
  String firstFrame320;
  @JsonKey(name: 'first_frame_640')
  String firstFrame640;
  @JsonKey(name: 'first_frame_800')
  String firstFrame800;
  @JsonKey(name: 'first_frame_1280')
  String firstFrame1280;
  String player, platform, accessKey;
  int processing, live, upcoming;
  bool isFavorite;
  Video(
    this.id,
    this.ownerId,
    this.duration,
    this.date,
    this.addingDate,
    this.views,
    this.comments,
    this.canEdit,
    this.canAdd,
    this.isPrivate,
    this.title,
    this.description,
    this.photo130,
    this.photo320,
    this.photo640,
    this.photo800,
    this.photo1280,
    this.firstFrame130,
    this.firstFrame320,
    this.firstFrame640,
    this.firstFrame800,
    this.firstFrame1280,
    this.player,
    this.platform,
    this.accessKey,
    this.processing,
    this.live,
    this.upcoming,
    this.isFavorite,
  );
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Audio {
  /// More info at: https://vk.com/dev/objects/audio
  int id, ownerId, duration, lyricsId, albumId, genreId, date, noSearch, isHq;
  String artist, title, url;
  Audio(
      this.id,
      this.ownerId,
      this.duration,
      this.lyricsId,
      this.albumId,
      this.genreId,
      this.date,
      this.noSearch,
      this.isHq,
      this.artist,
      this.title,
      this.url);
  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
  Map<String, dynamic> toJson() => _$AudioToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Doc {
  int id, ownerId, size, date, type;
  String title, ext, url;
  DocPreview preview;
  Doc(this.id, this.ownerId, this.title, this.size, this.ext, this.url,
      this.date, this.type, this.preview);
  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
  Map<String, dynamic> toJson() => _$DocToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class DocPreview {
  Photo photo;
  Graffiti graffiti;
  AudioMessage audioMessage;
  DocPreview(this.photo, this.graffiti, this.audioMessage);
  factory DocPreview.fromJson(Map<String, dynamic> json) =>
      _$DocPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$DocPreviewToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AudioMessage {
  int duration;
  List<int> waveform;
  String linkOgg;
  String linkMp3;
  AudioMessage(this.duration, this.waveform, this.linkOgg, this.linkMp3);
  factory AudioMessage.fromJson(Map<String, dynamic> json) =>
      _$AudioMessageFromJson(json);
  Map<String, dynamic> toJson() => _$AudioMessageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Graffiti {
  int id, ownerId;
  @JsonKey(name: 'photo_130')
  String photo130;
  @JsonKey(name: 'photo_604')
  String photo604;
  Graffiti(this.id, this.ownerId, this.photo130, this.photo604);
  factory Graffiti.fromJson(Map<String, dynamic> json) =>
      _$GraffitiFromJson(json);
  Map<String, dynamic> toJson() => _$GraffitiToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Link {
  /// More info at: https://vk.com/dev/objects/link
  String url, title, caption, description, previewPage, previewUrl;
  Photo photo;
  Video video;
  Product product;
  Button button;
  Link(this.url, this.title, this.caption, this.description, this.previewPage,
      this.previewUrl, this.photo, this.video, this.product, this.button);
  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Button {
  String title;
  Action action;
  Button(this.title, this.action);
  factory Button.fromJson(Map<String, dynamic> json) => _$ButtonFromJson(json);
  Map<String, dynamic> toJson() => _$ButtonToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Action {
  String type, url;
  Action(this.type, this.url);
  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
  Map<String, dynamic> toJson() => _$ActionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Product {
  /// More info at: https://vk.com/dev/link_product
  Price price;
  Product(this.price);
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Price {
  /// More info at: https://vk.com/dev/price
  int amount;
  Currency currency;
  String text;
  Price(this.amount, this.currency, this.text);
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Currency {
  /// More info at: https://vk.com/dev/price
  int id;
  String name;
  Currency(this.id, this.name);
  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Note {
  /// Additional info at https://vk.com/dev/objects/note
  int id, ownerId, date, comments, readComments;
  String title, text, viewUrl;
  Note(
    this.id,
    this.ownerId,
    this.date,
    this.comments,
    this.readComments,
    this.title,
    this.text,
    this.viewUrl,
  );
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Poll {
  /// TODO, https://vk.com/dev/objects/poll
  int id, ownerId, created, votes, endDate, authorId;
  String question;
  List<PollAnswer> answers;
  bool anonymous,
      multiple,
      closed,
      isBoard,
      canEdit,
      canVote,
      canReport,
      canShare;
  List answerIds;
  Photo photo;
  PollBackground background;
  List friends;
  Poll(
    this.id,
    this.ownerId,
    this.created,
    this.votes,
    this.endDate,
    this.authorId,
    this.question,
    this.answers,
    this.anonymous,
    this.multiple,
    this.closed,
    this.isBoard,
    this.canEdit,
    this.canVote,
    this.canReport,
    this.canShare,
    this.answerIds,
    this.photo,
    this.background,
    this.friends,
  );
  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);
  Map<String, dynamic> toJson() => _$PollToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PollAnswer {
  int id, votes;
  String text;
  double rate; // (number) id api docs?

  PollAnswer(this.id, this.votes, this.text, this.rate);
  factory PollAnswer.fromJson(Map<String, dynamic> json) =>
      _$PollAnswerFromJson(json);
  Map<String, dynamic> toJson() => _$PollAnswerToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PollBackground {
  int id, angle, width, height;
  String type, color;
  List<PhotoSizesObject> images;
  List<PollBackgroundPoints> points;
  PollBackground(this.id, this.type, this.angle, this.color, this.width,
      this.height, this.images, this.points);
  factory PollBackground.fromJson(Map<String, dynamic> json) =>
      _$PollBackgroundFromJson(json);
  Map<String, dynamic> toJson() => _$PollBackgroundToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PollBackgroundPoints {
  double position;
  String color;
  PollBackgroundPoints(this.position, this.color);
  factory PollBackgroundPoints.fromJson(Map<String, dynamic> json) =>
      _$PollBackgroundPointsFromJson(json);
  Map<String, dynamic> toJson() => _$PollBackgroundPointsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Page {
  /// More info at https://vk.com/dev/objects/page
  int id,
      groupId,
      creatorId,
      currentUserCanEdit,
      currentUserCanEditAccess,
      whoCanView,
      whoCanEdit,
      edited,
      created,
      editorId,
      views;
  String title, parent, parent2, source, html, viewUrl;
  Page(
    this.id,
    this.groupId,
    this.creatorId,
    this.currentUserCanEdit,
    this.currentUserCanEditAccess,
    this.whoCanView,
    this.whoCanEdit,
    this.edited,
    this.created,
    this.editorId,
    this.views,
    this.title,
    this.parent,
    this.parent2,
    this.source,
    this.html,
    this.viewUrl,
  );
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Album {
  /// More info at https://vk.com/dev/objects/attachments_w
  int id, ownerId, created, updated, size;
  String title, description;
  Photo thumb;
  Album(this.id, this.ownerId, this.created, this.updated, this.size,
      this.title, this.description, this.thumb);
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MarketItem {
  /// More info at: https://vk.com/dev/objects/market_item
  /// TODO: add optional fields for extended=1
  int id, ownerId, date, availability;
  String title, description, thumbPhoto;
  Price price;
  MarketItemCategory category;
  bool isFavorite;
  MarketItem(
      this.id,
      this.ownerId,
      this.date,
      this.availability,
      this.title,
      this.description,
      this.thumbPhoto,
      this.price,
      this.category,
      this.isFavorite);
  factory MarketItem.fromJson(Map<String, dynamic> json) =>
      _$MarketItemFromJson(json);
  Map<String, dynamic> toJson() => _$MarketItemToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MarketItemCategory {
  /// To work with MarketItem Class
  /// More info: https://vk.com/dev/objects/market_item
  int id;
  String name;
  Section section;
  MarketItemCategory(this.id, this.name, this.section);
  factory MarketItemCategory.fromJson(Map<String, dynamic> json) =>
      _$MarketItemCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$MarketItemCategoryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Section {
  /// To work with MarketItemCategory Class
  /// More info: https://vk.com/dev/objects/market_item
  int id;
  String name;
  Section(this.id, this.name);
  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class MarketAlbum {
  int id, ownerId, title, count, updatedTime;
  Photo photo;
  MarketAlbum(this.id, this.ownerId, this.title, this.count, this.updatedTime,
      this.photo);
  factory MarketAlbum.fromJson(Map<String, dynamic> json) =>
      _$MarketAlbumFromJson(json);
  Map<String, dynamic> toJson() => _$MarketAlbumToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Sticker {
  int productId;
  int stickerId;
  List<StickerImage> images;
  List<StickerImage> imagesWithBackground;
  Sticker(
      this.productId, this.stickerId, this.images, this.imagesWithBackground);
  factory Sticker.fromJson(Map<String, dynamic> json) =>
      _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class StickerImage {
  String url;
  int width, height;
  StickerImage(this.url, this.width, this.height);
  factory StickerImage.fromJson(Map<String, dynamic> json) =>
      _$StickerImageFromJson(json);
  Map<String, dynamic> toJson() => _$StickerImageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PrettyCards {
  List<Card> cards;
  PrettyCards(this.cards);
  factory PrettyCards.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardsFromJson(json);
  Map<String, dynamic> toJson() => _$PrettyCardsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Card {
  String cardId, linkUrl, title, price, priceOld;
  List<CardImage> images;
  Button button;
  String buttonText, photo;
  Card(this.cardId, this.linkUrl, this.title, this.price, this.priceOld,
      this.images, this.button, this.buttonText, this.photo);

  String get prettyCardButton {
    //returns string value for button in PrettyCard class
    // more info at: https://vk.com/dev/prettyCards.create
    switch (button.title) {
      case 'Запустить':
        return 'app_join';
        break;
      case 'Играть':
        return 'app_game_join';
        break;
      case 'Перейти':
        return 'open_url';
        break;
      case 'Открыть':
        return 'open';
        break;
      case 'Подробнее':
        return 'more';
        break;
      case 'Позвонить':
        return 'call';
        break;
      case 'Забронировать':
        return 'book';
        break;
      case 'Записаться':
        return 'enroll';
        break;
      case 'Зарегистрироваться':
        return 'register';
        break;
      case 'Купить':
        return 'buy';
        break;
      case 'Купить билет':
        return 'buy_ticket';
        break;
      case 'В магазин':
        return 'to_shop';
        break;
      case 'Заказать':
        return 'order';
        break;
      case 'Создать':
        return 'create';
        break;
      case 'Установить':
        return 'install';
        break;
      case 'Связаться':
        return 'contact';
        break;
      case 'Заполнить':
        return 'fill';
        break;
      case 'Выбрать':
        return 'choose';
        break;
      case 'Попробовать':
        return 'try';
        break;
      case 'Подписаться':
        return 'join_public';
        break;
      case 'Я пойду':
        return 'join_event';
        break;
      case 'Вступить':
        return 'join_group';
        break;
      case 'Связаться':
        return 'im_group';
        break;
      case 'Написать':
        return 'im_group2';
        break;
      case 'Начать':
        return 'begin';
        break;
      case 'Получить':
        return 'get';
        break;
      default:
        return null;
    }
  }

  String get clearPrice {
    //Should remove any letters to create via API
    RegExp digitsOnly = RegExp(r"([+-]?[0-9]+(?:\.[0-9]*)?)");
    if (price != null) {
      return digitsOnly.firstMatch(price).group(0);
    } else {
      return null;
    }
  }

  String get clearPriceOld {
    //Should remove any letters to create via API
    RegExp digitsOnly = RegExp(r"([+-]?[0-9]+(?:\.[0-9]*)?)");
    if (priceOld != null) {
      return digitsOnly.firstMatch(priceOld).group(0);
    } else {
      return null;
    }
  }

  void updateFromPrettyCard(PrettyCard prettyCard) {
    cardId = prettyCard.cardId;
  }

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CardImage {
  String url;
  int width, height;
  CardImage(this.url, this.width, this.height);
  factory CardImage.fromJson(Map<String, dynamic> json) =>
      _$CardImageFromJson(json);
  Map<String, dynamic> toJson() => _$CardImageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Event {
  /// More info at: https://vk.com/dev/objects/attachments_w
  int id, time, memberStatus;
  bool isFavorite;
  String address, text, buttonText;
  List<int> friends;
  Event(this.id, this.time, this.memberStatus, this.isFavorite, this.address,
      this.text, this.buttonText, this.friends);
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

// END OF ATTACHMENTS

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Geo {
  String type, coordinates;
  Place place;
  Geo(this.type, this.coordinates, this.place);
  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Place {
  int id, latitude, longitude, created, checkins, updated, type, country, city;
  String title, icon, address;
  Place(
    this.id,
    this.latitude,
    this.longitude,
    this.created,
    this.checkins,
    this.updated,
    this.type,
    this.country,
    this.city,
    this.title,
    this.icon,
    this.address,
  );
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ErrorResponse {
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  ErrorResponse(this.errorResponse);
  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ErrorObject {
  int errorCode;
  String errorMsg;
  ErrorObject(this.errorCode, this.errorMsg);
  factory ErrorObject.fromJson(Map<String, dynamic> json) =>
      _$ErrorObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorObjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CityList {
  @JsonKey(name: 'response')
  List<City> cities;
  CityList(this.cities);
  factory CityList.fromJson(Map<String, dynamic> json) =>
      _$CityListFromJson(json);
  Map<String, dynamic> toJson() => _$CityListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class City {
  int id;
  String title;
  City(this.id, this.title);
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class UploadUrl {
  @JsonKey(name: 'response')
  String uploadUrl;
  UploadUrl(this.uploadUrl);
  factory UploadUrl.fromJson(Map<String, dynamic> json) =>
      _$UploadUrlFromJson(json);
  Map<String, dynamic> toJson() => _$UploadUrlToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallUploadServerUrlResponse {
  @JsonKey(name: 'response')
  WallUploadServerUrlObject result;
  WallUploadServerUrlResponse(this.result);
  factory WallUploadServerUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$WallUploadServerUrlResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WallUploadServerUrlResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallUploadServerUrlObject {
  String uploadUrl;
  int albumId, userId;
  WallUploadServerUrlObject(this.uploadUrl, this.albumId, this.userId);
  factory WallUploadServerUrlObject.fromJson(Map<String, dynamic> json) =>
      _$WallUploadServerUrlObjectFromJson(json);
  Map<String, dynamic> toJson() => _$WallUploadServerUrlObjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallUploadedPhoto {
  int server;
  String photo, hash;
  WallUploadedPhoto(this.server, this.photo, this.hash);
  factory WallUploadedPhoto.fromJson(Map<String, dynamic> json) =>
      _$WallUploadedPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$WallUploadedPhotoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PhotosSaveWallPhotoResult {
  @JsonKey(name: 'response')
  List<Photo> photos;
  PhotosSaveWallPhotoResult(this.photos);
  factory PhotosSaveWallPhotoResult.fromJson(Map<String, dynamic> json) =>
      _$PhotosSaveWallPhotoResultFromJson(json);
  Map<String, dynamic> toJson() => _$PhotosSaveWallPhotoResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class UploadedPhoto {
  String photo;
  UploadedPhoto(this.photo);
  factory UploadedPhoto.fromJson(Map<String, dynamic> json) =>
      _$UploadedPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedPhotoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class UploadedVideo {
  String videoData;
  UploadedVideo(this.videoData);
  factory UploadedVideo.fromJson(Map<String, dynamic> json) =>
      _$UploadedVideoFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedVideoToJson(this);
}
