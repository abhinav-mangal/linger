class PersonalProfileModel {
  bool? success;
  int? code;
  String? message;
  PersonalData? data;

  PersonalProfileModel({this.success, this.code, this.message, this.data});

  PersonalProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? PersonalData.fromJson(json['data']) : null;
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

class PersonalData {
  List<Cover>? cover;
  MyInfo? user;
  dynamic coverImage;

  PersonalData({this.cover, this.user, this.coverImage});

  PersonalData.fromJson(Map<String, dynamic> json) {
    if (json['cover'] != null) {
      cover = <Cover>[];
      json['cover'].forEach((v) {
        cover!.add(Cover.fromJson(v));
      });
    }
    user = json['user'] != null ? MyInfo.fromJson(json['user']) : null;
    coverImage = json['cover_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cover != null) {
      data['cover'] = cover!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['cover_image'] = coverImage;
    return data;
  }
}

class Cover {
  int? id;
  int? type;
  String? image;
  dynamic title;
  int? status;
  String? createdAt;
  String? updatedAt;

  Cover(
      {this.id,
      this.type,
      this.image,
      this.title,
      this.status,
      this.createdAt,
      this.updatedAt});

  Cover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['image'] = image;
    data['title'] = title;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class MyInfo {
  int? id;
  String? name;
  String? email;
  String? image;
  dynamic mobileNo;
  dynamic address;
  String? loginStatus;
  dynamic deviceId;
  String? role;
  dynamic otp;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? termsCondition;
  int? totalLike;
  int? primeStatus;
  int? totalFollowers;
  int? totalFollowing;
  String? fecebookAccountLink;
  String? instagramAccountLink;
  String? twitterAccountLink;

  MyInfo(
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
      this.totalLike,
      this.primeStatus,
      this.totalFollowers,
      this.totalFollowing,
      this.fecebookAccountLink,
      this.instagramAccountLink,
      this.twitterAccountLink});

  MyInfo.fromJson(Map<String, dynamic> json) {
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
    primeStatus = json['prime_status'];
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
    data['prime_status'] = primeStatus;
    data['total_followers'] = totalFollowers;
    data['total_following'] = totalFollowing;
    data['fecebook_account_link'] = fecebookAccountLink;
    data['instagram_account_link'] = instagramAccountLink;
    data['twitter_account_link'] = twitterAccountLink;
    return data;
  }
}
