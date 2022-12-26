class SukoonCategoryModel {
  final bool? success;
  final int? code;
  final String? message;
  final SukoonCategoryData? data;

  SukoonCategoryModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  SukoonCategoryModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? SukoonCategoryData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'code' : code,
    'message' : message,
    'data' : data?.toJson()
  };
}

class SukoonCategoryData {
  final List<SukoonCategorys>? categorys;
  final List<MostLink>? mostLink;

  SukoonCategoryData({
    this.categorys,
    this.mostLink,
  });

  SukoonCategoryData.fromJson(Map<String, dynamic> json)
    : categorys = (json['categorys'] as List?)?.map((dynamic e) => SukoonCategorys.fromJson(e as Map<String,dynamic>)).toList(),
      mostLink = (json['most_link'] as List?)?.map((dynamic e) => MostLink.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'categorys' : categorys?.map((e) => e.toJson()).toList(),
    'most_link' : mostLink?.map((e) => e.toJson()).toList()
  };
}

class SukoonCategorys {
  final int? id;
  final String? name;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  SukoonCategorys({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  SukoonCategorys.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      image = json['image'] as String?,
      status = json['status'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image,
    'status' : status,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class MostLink {
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

  MostLink({
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

  MostLink.fromJson(Map<String, dynamic> json)
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