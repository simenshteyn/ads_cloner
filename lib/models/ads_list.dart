import 'package:ads_cloner/models/ad.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ads_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class AdsList {
  @JsonKey(name: 'response')
  List<Ad> ads;
  AdsList(this.ads);

  factory AdsList.fromJson(Map<String, dynamic> json) =>
      _$AdsListFromJson(json);
  Map<String, dynamic> toJson() => _$AdsListToJson(this);
}
