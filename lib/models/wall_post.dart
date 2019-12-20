class WallPost {
  int id, ownerId, fromId, createdBy, date, replyOwnerId, replyPostId;
  int friendsOnly, signerId, canPin, canDelete, canEdit, isPinned;
  int markedAsAds, postponedId;
  String text, postType;
  bool isFavorite, isPromotedPostStealth;
  //comments, likes, reposts, views, post_source, attachments, geo
  //copy_history, 

  WallPost.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['owner_id'];
    this.fromId = json['from_id'];
    this.createdBy = json['created_by'];
    this.date = json['date'];
    this.text = json['text'];
    this.replyOwnerId = json['reply_owner_id'];
    this.replyPostId = json['reply_post_id'];
    this.friendsOnly = json['friends_only'];
    //comments
    //likes
    //reposts
    //views
    this.postType = json['post_type'];
    //post_source
    //attachments
    //geo
    this.signerId = json['signer_id'];
    //copy_history
    this.canPin = json['can_pin'];
    this.canDelete = json['can_delete'];
    this.canEdit = json['can_edit'];
    this.isPinned = json['is_pinned'];
    this.markedAsAds = json['marked_as_ads'];
    this.isFavorite = json['is_favorite'];
    this.postponedId = json['postponed_id'];
    this.isPromotedPostStealth = json['is_promoted_post_stealth'];
  }
}
