import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:SmmHub/models/wall_post_adsstealth.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wall_post_adsstealth_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallPostAdsStealthResultObject {
  int postId, errorCode;
  String errorDesc;
  WallPostAdsStealthResultObject(this.postId, this.errorCode, this.errorDesc);
  factory WallPostAdsStealthResultObject.fromJson(Map<String, dynamic> json) =>
      _$WallPostAdsStealthResultObjectFromJson(json);
  Map<String, dynamic> toJson() => _$WallPostAdsStealthResultObjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallPostAdsStealthResult {
  @JsonKey(name: 'response')
  WallPostAdsStealthResultObject result;
    @JsonKey(name: 'error')
  ErrorObject errorResponse;
  WallPostAdsStealthResult(this.result, this.errorResponse);
  factory WallPostAdsStealthResult.fromJson(Map<String, dynamic> json) =>
      _$WallPostAdsStealthResultFromJson(json);
  Map<String, dynamic> toJson() => _$WallPostAdsStealthResultToJson(this);

  String wallLink(WallPostAdsStealth wall) {
    return "https://vk.com/wall" "${wall.ownerId}" "_" "${this.result?.postId}";
  }
}
