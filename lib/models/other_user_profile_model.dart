class OtherUserProfileModel {
  final bool? success;
  final int? code;
  final String? message;
  final OtherUserProfileData? data;

  OtherUserProfileModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  OtherUserProfileModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? OtherUserProfileData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'code' : code,
    'message' : message,
    'data' : data?.toJson()
  };
}

class OtherUserProfileData {
  final UserDetail? userDetail;
  final dynamic coverImage;
  final bool? isLike;
  final bool? isFollow;

  OtherUserProfileData({
    this.userDetail,
    this.coverImage,
    this.isLike,
    this.isFollow,
  });

  OtherUserProfileData.fromJson(Map<String, dynamic> json)
    : userDetail = (json['user_detail'] as Map<String,dynamic>?) != null ? UserDetail.fromJson(json['user_detail'] as Map<String,dynamic>) : null,
      coverImage = json['cover_image'],
      isLike = json['is_like'] as bool?,
      isFollow = json['is_follow'] as bool?;

  Map<String, dynamic> toJson() => {
    'user_detail' : userDetail?.toJson(),
    'cover_image' : coverImage,
    'is_like' : isLike,
    'is_follow' : isFollow
  };
}

class UserDetail {
  final int? id;
  final String? name;
  final String? email;
  final dynamic image;
  final String? mobileNo;
  final dynamic address;
  final String? loginStatus;
  final dynamic deviceId;
  final String? role;
  final dynamic otp;
  final dynamic emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final int? termsCondition;
  final int? totalLike;
  final int? totalFollowers;
  final int? totalFollowing;
  final String? fecebookAccountLink;
  final String? instagramAccountLink;
  final String? twitterAccountLink;
  final int? primeStatus;

  UserDetail({
    this.id,
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
    this.totalFollowers,
    this.totalFollowing,
    this.fecebookAccountLink,
    this.instagramAccountLink,
    this.twitterAccountLink,
    this.primeStatus,
  });

  UserDetail.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      email = json['email'] as String?,
      image = json['image'],
      mobileNo = json['mobile_no'] as String?,
      address = json['address'],
      loginStatus = json['login_status'] as String?,
      deviceId = json['device_id'],
      role = json['role'] as String?,
      otp = json['otp'],
      emailVerifiedAt = json['email_verified_at'],
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      termsCondition = json['terms_condition'] as int?,
      totalLike = json['total_like'] as int?,
      totalFollowers = json['total_followers'] as int?,
      totalFollowing = json['total_following'] as int?,
      fecebookAccountLink = json['fecebook_account_link'] as String?,
      instagramAccountLink = json['instagram_account_link'] as String?,
      twitterAccountLink = json['twitter_account_link'] as String?,
      primeStatus = json['prime_status'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'image' : image,
    'mobile_no' : mobileNo,
    'address' : address,
    'login_status' : loginStatus,
    'device_id' : deviceId,
    'role' : role,
    'otp' : otp,
    'email_verified_at' : emailVerifiedAt,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'terms_condition' : termsCondition,
    'total_like' : totalLike,
    'total_followers' : totalFollowers,
    'total_following' : totalFollowing,
    'fecebook_account_link' : fecebookAccountLink,
    'instagram_account_link' : instagramAccountLink,
    'twitter_account_link' : twitterAccountLink,
    'prime_status' : primeStatus
  };
}