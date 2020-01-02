import 'package:ads_cloner/models/wall_post.dart';
import 'dart:math';
import 'dart:convert';

class WallPostAdsStealth {
  static final Random _random = Random.secure();
  String message;
  String attachments, guid, linkButton, linkTitle, linkImage, linkVideo;
  int ownerId, signed, placeId;
  double lat, long;

  WallPostAdsStealth(
      {this.ownerId,
      this.message,
      this.attachments,
      this.signed,
      this.lat,
      this.long,
      this.placeId,
      this.guid,
      this.linkButton,
      this.linkTitle,
      this.linkImage,
      this.linkVideo});

  static String createCryptoRandomString([int length = 32]) {
    // Static function to generate random guid
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  WallPostAdsStealth.fromWallPost(WallPost wallPost) {
    if (wallPost.ownerId != null) {
      this.ownerId = wallPost.ownerId;
    }

    if (wallPost.text != null) {
      this.message = wallPost.text;
    }

    if (wallPost.attachments != null) {
      this.attachments = wallPost.attachmentsToString;
    }

    if (wallPost.signerId != null) {
      this.signed = 1;
    } else {
      this.signed = 0;
    }

    if (wallPost.geo != null) {
      this.lat = 0.00; //TODO fix that mock later
      this.long = 0.00; //TODO fix that mock later
    }

    if (wallPost.geo?.place != null) {
      this.placeId = wallPost.geo.place.id;
    }

    this.guid = createCryptoRandomString();

    if (wallPost.attachments != null) {
      for (var attachment in wallPost.attachments) {
        if (attachment.link?.button != null) {
          this.linkButton = attachment.link.button.action.type;
          this.linkTitle = attachment.link?.title;
          //TODO linkVideo to done yet
        }
        if (attachment.link?.photo != null) {
          this.linkImage = attachment.link.photo.sizes.last.url;
        }
      }
    }
  }

  Map<String, String> toMap() {
    var _map = Map<String, String>();
    if (ownerId != null) {
      _map['owner_id'] = ownerId.toString();
    }
    if (message != null) {
      _map['message'] = message;
    }
    if (attachments != null) {
      _map['attachments'] = attachments;
    }
    if (signed != null) {
      _map['signed'] = signed.toString();
    }
    if (lat != null) {
      _map['lat'] = lat.toString();
    }
    if (long != null) {
      _map['long'] = long.toString();
    }
    if (placeId != null) {
      _map['place_id'] = placeId.toString();
    }
    if (guid != null) {
      _map['guid'] = guid;
    }
    if (linkButton != null) {
      _map['link_button'] = linkButton;
    }
    if (linkTitle != null) {
      _map['link_title'] = linkTitle;
    }
    if (linkImage != null) {
      _map['link_image'] = linkImage;
    }
    if (linkVideo != null) {
      _map['link_video'] = linkVideo;
    }
    return _map;
  }
}
