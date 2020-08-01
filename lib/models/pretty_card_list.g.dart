// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pretty_card_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrettyCardList _$PrettyCardListFromJson(Map<String, dynamic> json) {
  return PrettyCardList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : PrettyCard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PrettyCardListToJson(PrettyCardList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.result);
  return val;
}

PrettyCard _$PrettyCardFromJson(Map<String, dynamic> json) {
  return PrettyCard(
    json['card_id'] as String,
    json['link_url'] as String,
    json['title'] as String,
    json['price'] as String,
    json['price_old'] as String,
    (json['images'] as List)
        ?.map((e) =>
            e == null ? null : CardImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['button'] as String,
    json['button_text'] as String,
    json['photo'] as String,
  );
}

Map<String, dynamic> _$PrettyCardToJson(PrettyCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('card_id', instance.cardId);
  writeNotNull('link_url', instance.linkUrl);
  writeNotNull('title', instance.title);
  writeNotNull('price', instance.price);
  writeNotNull('price_old', instance.priceOld);
  writeNotNull('images', instance.images);
  writeNotNull('button', instance.button);
  writeNotNull('button_text', instance.buttonText);
  writeNotNull('photo', instance.photo);
  return val;
}
