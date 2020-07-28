// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vk_api_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentsFromJson(Map<String, dynamic> json) {
  return Comments(
    json['count'] as int,
    json['can_post'] as int,
    json['can_close'] as int,
    json['groups_can_post'] as bool,
    json['can_open'] as bool,
  );
}

Map<String, dynamic> _$CommentsToJson(Comments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('can_post', instance.canPost);
  writeNotNull('can_close', instance.canClose);
  writeNotNull('groups_can_post', instance.groupsCanPost);
  writeNotNull('can_open', instance.canOpen);
  return val;
}

Likes _$LikesFromJson(Map<String, dynamic> json) {
  return Likes(
    json['count'] as int,
    json['user_likes'] as int,
    json['can_like'] as int,
    json['can_publish'] as int,
  );
}

Map<String, dynamic> _$LikesToJson(Likes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('user_likes', instance.userLikes);
  writeNotNull('can_like', instance.canLike);
  writeNotNull('can_publish', instance.canPublish);
  return val;
}

Reposts _$RepostsFromJson(Map<String, dynamic> json) {
  return Reposts(
    json['count'] as int,
    json['user_reposted'] as int,
  );
}

Map<String, dynamic> _$RepostsToJson(Reposts instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('user_reposted', instance.userReposted);
  return val;
}

Views _$ViewsFromJson(Map<String, dynamic> json) {
  return Views(
    json['count'] as int,
  );
}

Map<String, dynamic> _$ViewsToJson(Views instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  return val;
}

PostSource _$PostSourceFromJson(Map<String, dynamic> json) {
  return PostSource(
    json['type'] as String,
    json['platform'] as String,
    json['data'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PostSourceToJson(PostSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('platform', instance.platform);
  writeNotNull('data', instance.data);
  writeNotNull('url', instance.url);
  return val;
}

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    json['id'] as int,
    json['owner_id'] as int,
    json['date'] as int,
    json['comments'] as int,
    json['read_comments'] as int,
    json['title'] as String,
    json['text'] as String,
    json['view_url'] as String,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('date', instance.date);
  writeNotNull('comments', instance.comments);
  writeNotNull('read_comments', instance.readComments);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('view_url', instance.viewUrl);
  return val;
}

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    json['id'] as int,
    json['latitude'] as int,
    json['longitude'] as int,
    json['created'] as int,
    json['checkins'] as int,
    json['updated'] as int,
    json['type'] as int,
    json['country'] as int,
    json['city'] as int,
    json['title'] as String,
    json['icon'] as String,
    json['address'] as String,
  );
}

Map<String, dynamic> _$PlaceToJson(Place instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('created', instance.created);
  writeNotNull('checkins', instance.checkins);
  writeNotNull('updated', instance.updated);
  writeNotNull('type', instance.type);
  writeNotNull('country', instance.country);
  writeNotNull('city', instance.city);
  writeNotNull('title', instance.title);
  writeNotNull('icon', instance.icon);
  writeNotNull('address', instance.address);
  return val;
}
