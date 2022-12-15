class LikeAudioResponse {
  bool? success;
  int? code;
  String? message;
  likeAudioResponseBody? data;

  LikeAudioResponse({this.success, this.code, this.message, this.data});

  LikeAudioResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new likeAudioResponseBody.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class likeAudioResponseBody {
  int? thisUser;
  String? isAudio;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  likeAudioResponseBody(
      {this.thisUser,
      this.isAudio,
      this.status,
      this.updatedAt,
      this.createdAt,
      this.id});

  likeAudioResponseBody.fromJson(Map<String, dynamic> json) {
    thisUser = json['this_user'];
    isAudio = json['is_audio'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['this_user'] = this.thisUser;
    data['is_audio'] = this.isAudio;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
