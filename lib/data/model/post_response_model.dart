class PostResponseModel {
  bool? success;
  int? code;
  String? message;
  dynamic data;

  PostResponseModel({this.success, this.code, this.message, this.data});

  PostResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] is int) {
      data = json['data'];
    } else {
      data = json['data'] != null ? ResponseData.fromJson(json['data']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? fecebookAccountLink;
  String? instagramAccountLink;
  String? twitterAccountLink;

  ResponseData({this.fecebookAccountLink, this.instagramAccountLink, this.twitterAccountLink});

  ResponseData.fromJson(Map<String, dynamic> json) {
    fecebookAccountLink = json['fecebook_account_link'];
    instagramAccountLink = json['instagram_account_link'];
    twitterAccountLink = json['twitter_account_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fecebook_account_link'] = fecebookAccountLink;
    data['instagram_account_link'] = instagramAccountLink;
    data['twitter_account_link'] = twitterAccountLink;
    return data;
  }
}
