// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wall_post_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallPostList _$WallPostListFromJson(Map<String, dynamic> json) {
  return WallPostList(
    (json['response'] as List)
        ?.map((e) =>
            e == null ? null : WallPost.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WallPostListToJson(WallPostList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.wallPosts);
  return val;
}
