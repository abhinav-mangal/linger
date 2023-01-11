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
  final int? id;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  SukoonSubCategoryBanner({
    this.id,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  SukoonSubCategoryBanner.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      image = json['image'] as String?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'image' : image,
    'created_at' : createdAt,
    'updated_at' : updatedAt
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
  final String? subcategoryName;

  SubCategory({
    this.id,
    this.name,
    this.image,
    this.status,
    this.cid,
    this.createdAt,
    this.updatedAt,
    this.subcategoryName,
  });

  SubCategory.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      image = json['image'] as String?,
      status = json['status'] as int?,
      cid = json['cid'] as int?,
      createdAt = json['created_at'] as String?,
      updatedAt = json['updated_at'] as String?,
      subcategoryName = json['subcategory_name'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image,
    'status' : status,
    'cid' : cid,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'subcategory_name' : subcategoryName
  };
}

class SubCategoryMostLink {
  final int? id;
  final String? title;
  final String? name;
  final String? categoryName;
  final String? subCategoryName;
  final String? image;
  final String? audio;
  final int? totalLike;
  final int? like;

  SubCategoryMostLink({
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

  SubCategoryMostLink.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      title = json['title'] as String?,
      name = json['name'] as String?,
      categoryName = json['category_name'] as String?,
      subCategoryName = json['sub_category_name'] as String?,
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