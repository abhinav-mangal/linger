class SukoonSubCategoryModel {
  final bool? success;
  final int? code;
  final String? message;
  final SukoonSubCategoryData? data;

  SukoonSubCategoryModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  SukoonSubCategoryModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? SukoonSubCategoryData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'code' : code,
    'message' : message,
    'data' : data?.toJson()
  };
}

class SukoonSubCategoryData {
  final List<SukoonSubCategoryBanner>? banner;
  final List<SubCategory>? subCategory;
  final List<SubCategoryMostLink>? mostLink;

  SukoonSubCategoryData({
    this.banner,
    this.subCategory,
    this.mostLink,
  });

  SukoonSubCategoryData.fromJson(Map<String, dynamic> json)
    : banner = (json['banner'] as List?)?.map((dynamic e) => SukoonSubCategoryBanner.fromJson(e as Map<String,dynamic>)).toList(),
      subCategory = (json['sub_category'] as List?)?.map((dynamic e) => SubCategory.fromJson(e as Map<String,dynamic>)).toList(),
      mostLink = (json['most_link'] as List?)?.map((dynamic e) => SubCategoryMostLink.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'banner' : banner?.map((e) => e.toJson()).toList(),
    'sub_category' : subCategory?.map((e) => e.toJson()).toList(),
    'most_link' : mostLink?.map((e) => e.toJson()).toList()
  };
}

class SukoonSubCategoryBanner {
  final String? image;

  SukoonSubCategoryBanner({
    this.image,
  });

  SukoonSubCategoryBanner.fromJson(Map<String, dynamic> json)
    : image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'image' : image
  };
}

class SubCategory {
  final int? id;
  final String? name;
  final String? image;
  final int? status;
  final int? cid;
  final String? createdAt;
  final String? updatedAt;

  SubCategory({
    this.id,
    this.name,
    this.image,
    this.status,
    this.cid,
    this.createdAt,
    this.updatedAt,
  });

  SubCategory.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      image = json['image'] as String?,
      status = json['status'] as int?,
      cid = json['cid'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image,
    'status' : status,
    'cid' : cid,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class SubCategoryMostLink {
  final int? id;
  final int? userId;
  final String? image;
  final String? audio;
  final String? title;
  final String? createdAt;
  final String? updatedAt;
  final int? cid;
  final int? sid;
  final int? lid;

  SubCategoryMostLink({
    this.id,
    this.userId,
    this.image,
    this.audio,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.cid,
    this.sid,
    this.lid,
  });

  SubCategoryMostLink.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      userId = json['user_id'] as int?,
      image = json['image'] as String?,
      audio = json['audio'] as String?,
      title = json['title'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      cid = json['cid'] as int?,
      sid = json['sid'] as int?,
      lid = json['lid'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'image' : image,
    'audio' : audio,
    'title' : title,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'cid' : cid,
    'sid' : sid,
    'lid' : lid
  };
}