class LikePostResponse {
  bool? success;
  int? code;
  String? message;
  int? data;

  LikePostResponse({this.success, this.code, this.message, this.data});

  LikePostResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
