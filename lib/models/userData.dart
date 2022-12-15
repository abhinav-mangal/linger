// To parse this JSON data, do
//
//     final onboarddatamodel = onboarddatamodelFromJson(jsonString);

import 'dart:convert';

Userdatamodel userdatamodelFromJson(String str) =>
    Userdatamodel.fromJson(json.decode(str));

String userdatamodelToJson(Userdatamodel data) => json.encode(data.toJson());

class Userdatamodel {
  bool? success;
  int? code;
  String? message;
  User? user;
  String? token;

  Userdatamodel({this.success, this.code, this.message, this.user, this.token});

  Userdatamodel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    code = json['code'] ?? 0;
    message = json['message'] ?? "";
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  String? mobileNo;
  String? address;
  String? loginStatus;
  String? deviceId;
  String? role;
  String? otp;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? primeStatus;
  int? totalLike;
  int? totalFollowers;
  int? totalFollowing;
  String? fecebookAccountLink;
  String? instagramAccountLink;
  String? twitterAccountLink;

  User(
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
      this.primeStatus,
      this.totalLike,
      this.totalFollowers,
      this.totalFollowing,
      this.fecebookAccountLink,
      this.instagramAccountLink,
      this.twitterAccountLink});

  User.fromJson(Map<String, dynamic> json) {
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
    primeStatus = json['prime_status'];
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
    data['prime_status'] = primeStatus;
    data['total_like'] = totalLike;
    data['total_followers'] = totalFollowers;
    data['total_following'] = totalFollowing;
    data['fecebook_account_link'] = fecebookAccountLink;
    data['instagram_account_link'] = instagramAccountLink;
    data['twitter_account_link'] = twitterAccountLink;
    return data;
  }
}
