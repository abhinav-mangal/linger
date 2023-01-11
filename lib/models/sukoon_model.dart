class SukoonModel {
  final bool? success;
  final int? code;
  final String? message;
  final List<SukoonData>? data;

  SukoonModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  SukoonModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as List?)?.map((dynamic e) => SukoonData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'success' : success,
    'code' : code,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class SukoonData {
  final int? id;
  final String? title;
  final String? name;
  final String? categoryName;
  final String? subCategoryName;
  final String? image;
  final String? audio;
  final int? totalLike;
  final int? like;

  SukoonData({
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

  SukoonData.fromJson(Map<String, dynamic> json)
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