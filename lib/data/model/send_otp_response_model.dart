class SendOTPResponse {
  bool? success;
  int? code;
  String? message;
  User? user;
  String? token;

  SendOTPResponse(
      {this.success, this.code, this.message, this.user, required this.token});

  SendOTPResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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

class User {
  int? id;
  String? mobileNo;
  String? loginStatus;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? primeStatus;
  String? fecebookAccountLink;
  String? instagramAccountLink;
  String? twitterAccountLink;
  String? otp;

  User({
    this.id,
    this.mobileNo,
    this.loginStatus,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.primeStatus,
    this.fecebookAccountLink,
    this.instagramAccountLink,
    this.twitterAccountLink,
    this.otp,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNo = json['mobile_no'];
    loginStatus = json['login_status'].toString();
    role = json['role'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    primeStatus = json['prime_status'];
    fecebookAccountLink = json['fecebook_account_link'];
    instagramAccountLink = json['instagram_account_link'];
    twitterAccountLink = json['twitter_account_link'];
    otp = json['otp'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobile_no'] = mobileNo;
    data['login_status'] = loginStatus;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['prime_status'] = primeStatus;
    data['fecebook_account_link'] = fecebookAccountLink;
    data['instagram_account_link'] = instagramAccountLink;
    data['twitter_account_link'] = twitterAccountLink;
    data['otp'] = otp;
    return data;
  }
}
