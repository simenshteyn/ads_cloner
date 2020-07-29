// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wall_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WallPost _$WallPostFromJson(Map<String, dynamic> json) {
  return WallPost(
    json['id'] as int,
    json['owner_id'] as int,
    json['from_id'] as int,
    json['created_by'] as int,
    json['date'] as int,
    json['reply_owner_id'] as int,
    json['reply_post_id'] as int,
    json['friends_only'] as int,
    json['signer_id'] as int,
    json['can_pin'] as int,
    json['can_delete'] as int,
    json['can_edit'] as int,
    json['is_pinned'] as int,
    json['marked_as_ads'] as int,
    json['postponed_id'] as int,
    json['text'] as String,
    json['post_type'] as String,
    json['is_favorite'] as bool,
    json['is_promoted_post_stealth'] as bool,
    json['comments'] == null
        ? null
        : Comments.fromJson(json['comments'] as Map<String, dynamic>),
    json['likes'] == null
        ? null
        : Likes.fromJson(json['likes'] as Map<String, dynamic>),
    json['reposts'] == null
        ? null
        : Reposts.fromJson(json['reposts'] as Map<String, dynamic>),
    json['views'] == null
        ? null
        : Views.fromJson(json['views'] as Map<String, dynamic>),
    json['post_source'] == null
        ? null
        : PostSource.fromJson(json['post_source'] as Map<String, dynamic>),
    (json['attachments'] as List)
        ?.map((e) => e == null
            ? null
            : PostAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WallPostToJson(WallPost instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('from_id', instance.fromId);
  writeNotNull('created_by', instance.createdBy);
  writeNotNull('date', instance.date);
  writeNotNull('reply_owner_id', instance.replyOwnerId);
  writeNotNull('reply_post_id', instance.replyPostId);
  writeNotNull('friends_only', instance.friendsOnly);
  writeNotNull('signer_id', instance.signerId);
  writeNotNull('can_pin', instance.canPin);
  writeNotNull('can_delete', instance.canDelete);
  writeNotNull('can_edit', instance.canEdit);
  writeNotNull('is_pinned', instance.isPinned);
  writeNotNull('marked_as_ads', instance.markedAsAds);
  writeNotNull('postponed_id', instance.postponedId);
  writeNotNull('text', instance.text);
  writeNotNull('post_type', instance.postType);
  writeNotNull('is_favorite', instance.isFavorite);
  writeNotNull('is_promoted_post_stealth', instance.isPromotedPostStealth);
  writeNotNull('comments', instance.comments);
  writeNotNull('likes', instance.likes);
  writeNotNull('reposts', instance.reposts);
  writeNotNull('views', instance.views);
  writeNotNull('post_source', instance.postSource);
  writeNotNull('attachments', instance.attachments);
  writeNotNull('geo', instance.geo);
  return val;
}
