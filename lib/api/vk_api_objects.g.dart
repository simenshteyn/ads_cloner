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

PostAttachment _$PostAttachmentFromJson(Map<String, dynamic> json) {
  return PostAttachment(
    json['type'] as String,
    json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    json['video'] == null
        ? null
        : Video.fromJson(json['video'] as Map<String, dynamic>),
    json['audio'] == null
        ? null
        : Audio.fromJson(json['audio'] as Map<String, dynamic>),
    json['doc'] == null
        ? null
        : Doc.fromJson(json['doc'] as Map<String, dynamic>),
    json['graffiti'] == null
        ? null
        : Graffiti.fromJson(json['graffiti'] as Map<String, dynamic>),
    json['link'] == null
        ? null
        : Link.fromJson(json['link'] as Map<String, dynamic>),
    json['note'] == null
        ? null
        : Note.fromJson(json['note'] as Map<String, dynamic>),
    json['poll'] == null
        ? null
        : Poll.fromJson(json['poll'] as Map<String, dynamic>),
    json['page'] == null
        ? null
        : Page.fromJson(json['page'] as Map<String, dynamic>),
    json['album'] == null
        ? null
        : Album.fromJson(json['album'] as Map<String, dynamic>),
    (json['photos_list'] as List)?.map((e) => e as String)?.toList(),
    json['market'] == null
        ? null
        : MarketItem.fromJson(json['market'] as Map<String, dynamic>),
    json['market_album'] == null
        ? null
        : MarketAlbum.fromJson(json['market_album'] as Map<String, dynamic>),
    json['sticker'] == null
        ? null
        : Sticker.fromJson(json['sticker'] as Map<String, dynamic>),
    json['pretty_cards'] == null
        ? null
        : PrettyCards.fromJson(json['pretty_cards'] as Map<String, dynamic>),
    json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostAttachmentToJson(PostAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('photo', instance.photo);
  writeNotNull('video', instance.video);
  writeNotNull('audio', instance.audio);
  writeNotNull('doc', instance.doc);
  writeNotNull('graffiti', instance.graffiti);
  writeNotNull('link', instance.link);
  writeNotNull('note', instance.note);
  writeNotNull('poll', instance.poll);
  writeNotNull('page', instance.page);
  writeNotNull('album', instance.album);
  writeNotNull('photos_list', instance.photosList);
  writeNotNull('market', instance.market);
  writeNotNull('market_album', instance.marketAlbum);
  writeNotNull('sticker', instance.sticker);
  writeNotNull('pretty_cards', instance.prettyCards);
  writeNotNull('event', instance.event);
  return val;
}

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    json['id'] as int,
    json['album_id'] as int,
    json['owner_id'] as int,
    json['user_id'] as int,
    json['date'] as int,
    json['width'] as int,
    json['height'] as int,
    json['text'] as String,
    (json['sizes'] as List)
        ?.map((e) => e == null
            ? null
            : PhotoSizesObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('album_id', instance.albumId);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('user_id', instance.userId);
  writeNotNull('date', instance.date);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('text', instance.text);
  writeNotNull('sizes', instance.sizes);
  return val;
}

PhotoSizesObject _$PhotoSizesObjectFromJson(Map<String, dynamic> json) {
  return PhotoSizesObject(
    json['type'] as String,
    json['url'] as String,
    json['width'] as int,
    json['height'] as int,
  );
}

Map<String, dynamic> _$PhotoSizesObjectToJson(PhotoSizesObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('url', instance.url);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  return val;
}

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    json['id'] as int,
    json['owner_id'] as int,
    json['duration'] as int,
    json['date'] as int,
    json['adding_date'] as int,
    json['views'] as int,
    json['comments'] as int,
    json['can_edit'] as int,
    json['can_add'] as int,
    json['is_private'] as int,
    json['title'] as String,
    json['description'] as String,
    json['photo_130'] as String,
    json['photo_320'] as String,
    json['photo_640'] as String,
    json['photo_800'] as String,
    json['photo_1280'] as String,
    json['first_frame_130'] as String,
    json['first_frame_320'] as String,
    json['first_frame_640'] as String,
    json['first_frame_800'] as String,
    json['first_frame_1280'] as String,
    json['player'] as String,
    json['platform'] as String,
    json['access_key'] as String,
    json['processing'] as int,
    json['live'] as int,
    json['upcoming'] as int,
    json['is_favorite'] as bool,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('duration', instance.duration);
  writeNotNull('date', instance.date);
  writeNotNull('adding_date', instance.addingDate);
  writeNotNull('views', instance.views);
  writeNotNull('comments', instance.comments);
  writeNotNull('can_edit', instance.canEdit);
  writeNotNull('can_add', instance.canAdd);
  writeNotNull('is_private', instance.isPrivate);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('photo_130', instance.photo130);
  writeNotNull('photo_320', instance.photo320);
  writeNotNull('photo_640', instance.photo640);
  writeNotNull('photo_800', instance.photo800);
  writeNotNull('photo_1280', instance.photo1280);
  writeNotNull('first_frame_130', instance.firstFrame130);
  writeNotNull('first_frame_320', instance.firstFrame320);
  writeNotNull('first_frame_640', instance.firstFrame640);
  writeNotNull('first_frame_800', instance.firstFrame800);
  writeNotNull('first_frame_1280', instance.firstFrame1280);
  writeNotNull('player', instance.player);
  writeNotNull('platform', instance.platform);
  writeNotNull('access_key', instance.accessKey);
  writeNotNull('processing', instance.processing);
  writeNotNull('live', instance.live);
  writeNotNull('upcoming', instance.upcoming);
  writeNotNull('is_favorite', instance.isFavorite);
  return val;
}

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return Audio(
    json['id'] as int,
    json['owner_id'] as int,
    json['duration'] as int,
    json['lyrics_id'] as int,
    json['album_id'] as int,
    json['genre_id'] as int,
    json['date'] as int,
    json['no_search'] as int,
    json['is_hq'] as int,
    json['artist'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$AudioToJson(Audio instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('duration', instance.duration);
  writeNotNull('lyrics_id', instance.lyricsId);
  writeNotNull('album_id', instance.albumId);
  writeNotNull('genre_id', instance.genreId);
  writeNotNull('date', instance.date);
  writeNotNull('no_search', instance.noSearch);
  writeNotNull('is_hq', instance.isHq);
  writeNotNull('artist', instance.artist);
  writeNotNull('title', instance.title);
  writeNotNull('url', instance.url);
  return val;
}

Doc _$DocFromJson(Map<String, dynamic> json) {
  return Doc(
    json['id'] as int,
    json['owner_id'] as int,
    json['title'] as String,
    json['size'] as int,
    json['ext'] as String,
    json['url'] as String,
    json['date'] as int,
    json['type'] as int,
    json['preview'] == null
        ? null
        : DocPreview.fromJson(json['preview'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocToJson(Doc instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('size', instance.size);
  writeNotNull('date', instance.date);
  writeNotNull('type', instance.type);
  writeNotNull('title', instance.title);
  writeNotNull('ext', instance.ext);
  writeNotNull('url', instance.url);
  writeNotNull('preview', instance.preview);
  return val;
}

DocPreview _$DocPreviewFromJson(Map<String, dynamic> json) {
  return DocPreview(
    json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    json['graffiti'] == null
        ? null
        : Graffiti.fromJson(json['graffiti'] as Map<String, dynamic>),
    json['audio_message'] == null
        ? null
        : AudioMessage.fromJson(json['audio_message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocPreviewToJson(DocPreview instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo', instance.photo);
  writeNotNull('graffiti', instance.graffiti);
  writeNotNull('audio_message', instance.audioMessage);
  return val;
}

AudioMessage _$AudioMessageFromJson(Map<String, dynamic> json) {
  return AudioMessage(
    json['duration'] as int,
    (json['waveform'] as List)?.map((e) => e as int)?.toList(),
    json['link_ogg'] as String,
    json['link_mp3'] as String,
  );
}

Map<String, dynamic> _$AudioMessageToJson(AudioMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('duration', instance.duration);
  writeNotNull('waveform', instance.waveform);
  writeNotNull('link_ogg', instance.linkOgg);
  writeNotNull('link_mp3', instance.linkMp3);
  return val;
}

Graffiti _$GraffitiFromJson(Map<String, dynamic> json) {
  return Graffiti(
    json['id'] as int,
    json['owner_id'] as int,
    json['photo_130'] as String,
    json['photo_604'] as String,
  );
}

Map<String, dynamic> _$GraffitiToJson(Graffiti instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('photo_130', instance.photo130);
  writeNotNull('photo_604', instance.photo604);
  return val;
}

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    json['url'] as String,
    json['title'] as String,
    json['caption'] as String,
    json['description'] as String,
    json['preview_page'] as String,
    json['preview_url'] as String,
    json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    json['video'] == null
        ? null
        : Video.fromJson(json['video'] as Map<String, dynamic>),
    json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    json['button'] == null
        ? null
        : Button.fromJson(json['button'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('title', instance.title);
  writeNotNull('caption', instance.caption);
  writeNotNull('description', instance.description);
  writeNotNull('preview_page', instance.previewPage);
  writeNotNull('preview_url', instance.previewUrl);
  writeNotNull('photo', instance.photo);
  writeNotNull('video', instance.video);
  writeNotNull('product', instance.product);
  writeNotNull('button', instance.button);
  return val;
}

Button _$ButtonFromJson(Map<String, dynamic> json) {
  return Button(
    json['title'] as String,
    json['action'] == null
        ? null
        : Action.fromJson(json['action'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ButtonToJson(Button instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('action', instance.action);
  return val;
}

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    json['type'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('url', instance.url);
  return val;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('price', instance.price);
  return val;
}

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
    json['amount'] as int,
    json['currency'] == null
        ? null
        : Currency.fromJson(json['currency'] as Map<String, dynamic>),
    json['text'] as String,
  );
}

Map<String, dynamic> _$PriceToJson(Price instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('text', instance.text);
  return val;
}

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
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

Poll _$PollFromJson(Map<String, dynamic> json) {
  return Poll(
    json['id'] as int,
    json['owner_id'] as int,
    json['created'] as int,
    json['votes'] as int,
    json['end_date'] as int,
    json['author_id'] as int,
    json['question'] as String,
    (json['answers'] as List)
        ?.map((e) =>
            e == null ? null : PollAnswer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['anonymous'] as bool,
    json['multiple'] as bool,
    json['closed'] as bool,
    json['is_board'] as bool,
    json['can_edit'] as bool,
    json['can_vote'] as bool,
    json['can_report'] as bool,
    json['can_share'] as bool,
    json['answer_ids'] as List,
    json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
    json['background'] == null
        ? null
        : PollBackground.fromJson(json['background'] as Map<String, dynamic>),
    json['friends'] as List,
  );
}

Map<String, dynamic> _$PollToJson(Poll instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('created', instance.created);
  writeNotNull('votes', instance.votes);
  writeNotNull('end_date', instance.endDate);
  writeNotNull('author_id', instance.authorId);
  writeNotNull('question', instance.question);
  writeNotNull('answers', instance.answers);
  writeNotNull('anonymous', instance.anonymous);
  writeNotNull('multiple', instance.multiple);
  writeNotNull('closed', instance.closed);
  writeNotNull('is_board', instance.isBoard);
  writeNotNull('can_edit', instance.canEdit);
  writeNotNull('can_vote', instance.canVote);
  writeNotNull('can_report', instance.canReport);
  writeNotNull('can_share', instance.canShare);
  writeNotNull('answer_ids', instance.answerIds);
  writeNotNull('photo', instance.photo);
  writeNotNull('background', instance.background);
  writeNotNull('friends', instance.friends);
  return val;
}

PollAnswer _$PollAnswerFromJson(Map<String, dynamic> json) {
  return PollAnswer(
    json['id'] as int,
    json['votes'] as int,
    json['text'] as String,
    (json['rate'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PollAnswerToJson(PollAnswer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('votes', instance.votes);
  writeNotNull('text', instance.text);
  writeNotNull('rate', instance.rate);
  return val;
}

PollBackground _$PollBackgroundFromJson(Map<String, dynamic> json) {
  return PollBackground(
    json['id'] as int,
    json['type'] as String,
    json['angle'] as int,
    json['color'] as String,
    json['width'] as int,
    json['height'] as int,
    (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : PhotoSizesObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['points'] as List)
        ?.map((e) => e == null
            ? null
            : PollBackgroundPoints.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PollBackgroundToJson(PollBackground instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('angle', instance.angle);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('type', instance.type);
  writeNotNull('color', instance.color);
  writeNotNull('images', instance.images);
  writeNotNull('points', instance.points);
  return val;
}

PollBackgroundPoints _$PollBackgroundPointsFromJson(Map<String, dynamic> json) {
  return PollBackgroundPoints(
    (json['position'] as num)?.toDouble(),
    json['color'] as String,
  );
}

Map<String, dynamic> _$PollBackgroundPointsToJson(
    PollBackgroundPoints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  writeNotNull('color', instance.color);
  return val;
}

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    json['id'] as int,
    json['group_id'] as int,
    json['creator_id'] as int,
    json['current_user_can_edit'] as int,
    json['current_user_can_edit_access'] as int,
    json['who_can_view'] as int,
    json['who_can_edit'] as int,
    json['edited'] as int,
    json['created'] as int,
    json['editor_id'] as int,
    json['views'] as int,
    json['title'] as String,
    json['parent'] as String,
    json['parent2'] as String,
    json['source'] as String,
    json['html'] as String,
    json['view_url'] as String,
  );
}

Map<String, dynamic> _$PageToJson(Page instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('group_id', instance.groupId);
  writeNotNull('creator_id', instance.creatorId);
  writeNotNull('current_user_can_edit', instance.currentUserCanEdit);
  writeNotNull(
      'current_user_can_edit_access', instance.currentUserCanEditAccess);
  writeNotNull('who_can_view', instance.whoCanView);
  writeNotNull('who_can_edit', instance.whoCanEdit);
  writeNotNull('edited', instance.edited);
  writeNotNull('created', instance.created);
  writeNotNull('editor_id', instance.editorId);
  writeNotNull('views', instance.views);
  writeNotNull('title', instance.title);
  writeNotNull('parent', instance.parent);
  writeNotNull('parent2', instance.parent2);
  writeNotNull('source', instance.source);
  writeNotNull('html', instance.html);
  writeNotNull('view_url', instance.viewUrl);
  return val;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
    json['id'] as int,
    json['owner_id'] as int,
    json['created'] as int,
    json['updated'] as int,
    json['size'] as int,
    json['title'] as String,
    json['description'] as String,
    json['thumb'] == null
        ? null
        : Photo.fromJson(json['thumb'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlbumToJson(Album instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('created', instance.created);
  writeNotNull('updated', instance.updated);
  writeNotNull('size', instance.size);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('thumb', instance.thumb);
  return val;
}

MarketItem _$MarketItemFromJson(Map<String, dynamic> json) {
  return MarketItem(
    json['id'] as int,
    json['owner_id'] as int,
    json['date'] as int,
    json['availability'] as int,
    json['title'] as String,
    json['description'] as String,
    json['thumb_photo'] as String,
    json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>),
    json['category'] == null
        ? null
        : MarketItemCategory.fromJson(json['category'] as Map<String, dynamic>),
    json['is_favorite'] as bool,
  );
}

Map<String, dynamic> _$MarketItemToJson(MarketItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('date', instance.date);
  writeNotNull('availability', instance.availability);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('thumb_photo', instance.thumbPhoto);
  writeNotNull('price', instance.price);
  writeNotNull('category', instance.category);
  writeNotNull('is_favorite', instance.isFavorite);
  return val;
}

MarketItemCategory _$MarketItemCategoryFromJson(Map<String, dynamic> json) {
  return MarketItemCategory(
    json['id'] as int,
    json['name'] as String,
    json['section'] == null
        ? null
        : Section.fromJson(json['section'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MarketItemCategoryToJson(MarketItemCategory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('section', instance.section);
  return val;
}

Section _$SectionFromJson(Map<String, dynamic> json) {
  return Section(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$SectionToJson(Section instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

MarketAlbum _$MarketAlbumFromJson(Map<String, dynamic> json) {
  return MarketAlbum(
    json['id'] as int,
    json['owner_id'] as int,
    json['title'] as int,
    json['count'] as int,
    json['updated_time'] as int,
    json['photo'] == null
        ? null
        : Photo.fromJson(json['photo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MarketAlbumToJson(MarketAlbum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('title', instance.title);
  writeNotNull('count', instance.count);
  writeNotNull('updated_time', instance.updatedTime);
  writeNotNull('photo', instance.photo);
  return val;
}

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
    json['product_id'] as int,
    json['sticker_id'] as int,
    (json['images'] as List)
        ?.map((e) =>
            e == null ? null : StickerImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['images_with_background'] as List)
        ?.map((e) =>
            e == null ? null : StickerImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StickerToJson(Sticker instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_id', instance.productId);
  writeNotNull('sticker_id', instance.stickerId);
  writeNotNull('images', instance.images);
  writeNotNull('images_with_background', instance.imagesWithBackground);
  return val;
}

StickerImage _$StickerImageFromJson(Map<String, dynamic> json) {
  return StickerImage(
    json['url'] as String,
    json['width'] as int,
    json['height'] as int,
  );
}

Map<String, dynamic> _$StickerImageToJson(StickerImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  return val;
}

PrettyCards _$PrettyCardsFromJson(Map<String, dynamic> json) {
  return PrettyCards(
    (json['cards'] as List)
        ?.map(
            (e) => e == null ? null : Card.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PrettyCardsToJson(PrettyCards instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cards', instance.cards);
  return val;
}

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    json['card_id'] as String,
    json['link_url'] as String,
    json['title'] as String,
    json['price'] as String,
    json['price_old'] as String,
    (json['images'] as List)
        ?.map((e) =>
            e == null ? null : CardImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['button'] == null
        ? null
        : Button.fromJson(json['button'] as Map<String, dynamic>),
    json['button_text'] as String,
    json['photo'] as String,
  );
}

Map<String, dynamic> _$CardToJson(Card instance) {
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

CardImage _$CardImageFromJson(Map<String, dynamic> json) {
  return CardImage(
    json['url'] as String,
    json['width'] as int,
    json['height'] as int,
  );
}

Map<String, dynamic> _$CardImageToJson(CardImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  return val;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['id'] as int,
    json['time'] as int,
    json['member_status'] as int,
    json['is_favorite'] as bool,
    json['address'] as String,
    json['text'] as String,
    json['button_text'] as String,
    (json['friends'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('time', instance.time);
  writeNotNull('member_status', instance.memberStatus);
  writeNotNull('is_favorite', instance.isFavorite);
  writeNotNull('address', instance.address);
  writeNotNull('text', instance.text);
  writeNotNull('button_text', instance.buttonText);
  writeNotNull('friends', instance.friends);
  return val;
}

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    json['type'] as String,
    json['coordinates'] as String,
    json['place'] == null
        ? null
        : Place.fromJson(json['place'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('coordinates', instance.coordinates);
  writeNotNull('place', instance.place);
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

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return ErrorResponse(
    json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.errorResponse);
  return val;
}

ErrorObject _$ErrorObjectFromJson(Map<String, dynamic> json) {
  return ErrorObject(
    json['error_code'] as int,
    json['error_msg'] as String,
  );
}

Map<String, dynamic> _$ErrorObjectToJson(ErrorObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error_code', instance.errorCode);
  writeNotNull('error_msg', instance.errorMsg);
  return val;
}

CityList _$CityListFromJson(Map<String, dynamic> json) {
  return CityList(
    (json['response'] as List)
        ?.map(
            (e) => e == null ? null : City.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CityListToJson(CityList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('response', instance.cities);
  return val;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    json['id'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  return val;
}
