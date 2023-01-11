class SukoonHomeModel {
  final bool? success;
  final int? code;
  final String? message;
  final SukoonHomeData? data;

  SukoonHomeModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  SukoonHomeModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? SukoonHomeData.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'code' : code,
    'message' : message,
    'data' : data?.toJson()
  };
}

class SukoonHomeData {
  final List<SukoonHomeTrending>? trending;
  final List<SukoonHomeCategorys>? categorys;

  SukoonHomeData({
    this.trending,
    this.categorys,
  });

  SukoonHomeData.fromJson(Map<String, dynamic> json)
    : trending = (json['trending'] as List?)?.map((dynamic e) => SukoonHomeTrending.fromJson(e as Map<String,dynamic>)).toList(),
      categorys = (json['categorys'] as List?)?.map((dynamic e) => SukoonHomeCategorys.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'trending' : trending?.map((e) => e.toJson()).toList(),
    'categorys' : categorys?.map((e) => e.toJson()).toList()
  };
}

class SukoonHomeTrending {
  final int? id;
  final String? title;
  final dynamic name;
  final dynamic categoryName;
  final dynamic subCategoryName;
  final String? image;
  final String? audio;
  final int? totalLike;
  final int? like;

  SukoonHomeTrending({
    this.id,
    this.title,
    this.name,
    this.categoryName,
    this.subCategoryName,
    this.image,
    this.audio,
    this.totalLike,
    this.like,
  });

  SukoonHomeTrending.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      name = json['name'],
      categoryName = json['category_name'],
      subCategoryName = json['sub_category_name'],
      image = json['image'] as String?,
      audio = json['audio'] as String?,
      totalLike = json['total_like'] as int?,
      like = json['like'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'name' : name,
    'category_name' : categoryName,
    'sub_category_name' : subCategoryName,
    'image' : image,
    'audio' : audio,
    'total_like' : totalLike,
    'like' : like
  };
}

class SukoonHomeCategorys {
  final int? id;
  final String? name;
  final String? image;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  SukoonHomeCategorys({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  SukoonHomeCategorys.fromJson(Map<String, dynamic> json)
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