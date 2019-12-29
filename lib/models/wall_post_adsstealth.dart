class WallPostAdsStealth {
  String ownerId, message;
  String attachments, guid, linkButton, linkTitle, linkImage, linkVideo;
  int signed, placeId;
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

  Map<String, String> toMap() {
    var _map = Map<String, String>();
    if (ownerId != null) {
      _map['owner_id'] = ownerId;
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
