import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:ads_cloner/models/wall_post.dart';

import 'package:json_annotation/json_annotation.dart';
part 'wall_post_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WallPostList {
  @JsonKey(name: 'response')
  List<WallPost> wallPosts;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  WallPostList(this.wallPosts, this.errorResponse);
  factory WallPostList.fromJson(Map<String, dynamic> json) =>
      _$WallPostListFromJson(json);
  Map<String, dynamic> toJson() => _$WallPostListToJson(this);
}
