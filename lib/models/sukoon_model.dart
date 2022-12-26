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
  final String? image;
  final String? audio;
  final String? title;
  final String? name;
  final int? totalLike;
  final List<Like>? like;

  SukoonData({
    this.id,
    this.image,
    this.audio,
    this.title,
    this.name,
    this.totalLike,
    this.like,
  });

  SukoonData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      image = json['image'] as String?,
      audio = json['audio'] as String?,
      title = json['title'] as String?,
      name = json['name'] as String?,
      totalLike = json['total_like'] as int?,
      like = (json['Like'] as List?)?.map((dynamic e) => Like.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'image' : image,
    'audio' : audio,
    'title' : title,
    'name' : name,
    'total_like' : totalLike,
    'Like' : like?.map((e) => e.toJson()).toList()
  };
}

class Like {
  final int? status;

  Like({
    this.status,
  });

  Like.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?;

  Map<String, dynamic> toJson() => {
    'status' : status
  };
}