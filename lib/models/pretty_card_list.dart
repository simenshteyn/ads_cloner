import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pretty_card_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PrettyCardList {
  @JsonKey(name: 'response')
  List<PrettyCard> result;
  PrettyCardList(this.result);
  factory PrettyCardList.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardListFromJson(json);
  Map<String, dynamic> toJson() => _$PrettyCardListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PrettyCard {
  //Special class for PrettyCard creation, some field are differ from
  //very close Card class: button is string, not object.
  String cardId, linkUrl, title, price, priceOld;
  List<CardImage> images;
  String button;
  String buttonText, photo;
  PrettyCard(this.cardId, this.linkUrl, this.title, this.price, this.priceOld,
      this.images, this.button, this.buttonText, this.photo);
  factory PrettyCard.fromJson(Map<String, dynamic> json) =>
      _$PrettyCardFromJson(json);
  Map<String, dynamic> toJson() => _$PrettyCardToJson(this);
}
