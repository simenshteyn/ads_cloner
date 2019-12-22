class CreateAdResult {
  int id, errorCode;
  String errorDesc;
  CreateAdResult.fromJSON(Map<String, dynamic> json) {
    this.id = json['id'];
    this.errorCode = json['error_code'];
    this.errorDesc = json['error_desc'];
  }
}
