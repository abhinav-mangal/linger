class UserLoginResponseModel {
  bool? success;
  int? code;
  String? message;
  UserData? user;
  String? token;

  UserLoginResponseModel(
      {this.success, this.code, this.message, this.user, this.token});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['_access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['_access_token'] = token;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  dynamic image;
  String? mobileNo;
  dynamic address;
  String? loginStatus;
  dynamic deviceId;
  String? role;
  dynamic otp;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? termsCondition;
  int? totalLike = 0;
  int? totalFollowers = 0;
  int? totalFollowing = 0;
  String? fecebookAccountLink;
  String? instagramAccountLink;
  String? twitterAccountLink;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.mobileNo,
      this.address,
      this.loginStatus,
      this.deviceId,
      this.role,
      this.otp,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.termsCondition,
      this.totalLike = 0,
      this.totalFollowers = 0,
      this.totalFollowing = 0,
      this.fecebookAccountLink,
      this.instagramAccountLink,
      this.twitterAccountLink});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    loginStatus = json['login_status'];
    deviceId = json['device_id'];
    role = json['role'];
    otp = json['otp'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    termsCondition = json['terms_condition'];
    totalLike = json['total_like'];
    totalFollowers = json['total_followers'];
    totalFollowing = json['total_following'];
    fecebookAccountLink = json['fecebook_account_link'];
    instagramAccountLink = json['instagram_account_link'];
    twitterAccountLink = json['twitter_account_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['mobile_no'] = mobileNo;
    data['address'] = address;
    data['login_status'] = loginStatus;
    data['device_id'] = deviceId;
    data['role'] = role;
    data['otp'] = otp;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['terms_condition'] = termsCondition;
    data['total_like'] = totalLike;
    data['total_followers'] = totalFollowers;
    data['total_following'] = totalFollowing;
    data['fecebook_account_link'] = fecebookAccountLink;
    data['instagram_account_link'] = instagramAccountLink;
    data['twitter_account_link'] = twitterAccountLink;
    return data;
  }
}
