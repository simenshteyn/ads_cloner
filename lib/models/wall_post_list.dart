import 'package:SmmHub/api/vk_api_objects.dart';
import 'package:SmmHub/models/wall_post.dart';

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

  bool get isNotEmpty {
    if (this.wallPosts != null) {
      if (this.wallPosts.length > 0) {
        return true;
      }
      return false;
    }
    return false;
  }
}
