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
  final int? userId;
  final String? image;
  final String? audio;
  final String? title;
  final String? createdAt;
  final String? updatedAt;
  final int? cid;
  final int? sid;
  final int? lid;

  SukoonHomeTrending({
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

  SukoonHomeTrending.fromJson(Map<String, dynamic> json)
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