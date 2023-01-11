class SearchModel {
  final bool? success;
  final int? code;
  final String? message;
  final List<SeacrhData>? data;

  SearchModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  SearchModel.fromJson(Map<String, dynamic> json)
    : success = json['success'] as bool?,
      code = json['code'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as List?)?.map((dynamic e) => SeacrhData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'success' : success,
    'code' : code,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class SeacrhData {
  final int? id;
  final String? name;
  final String? image;
  final String? saleprice;
  final String? discountprice;
  final int? likeStatus;

  SeacrhData({
    this.id,
    this.name,
    this.image,
    this.saleprice,
    this.discountprice,
    this.likeStatus,
  });

  SeacrhData.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      name = json['name'] as String?,
      image = json['image'] as String?,
      saleprice = json['saleprice'] as String?,
      discountprice = json['discountprice'] as String?,
      likeStatus = json['like_status'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image,
    'saleprice' : saleprice,
    'discountprice' : discountprice,
    'like_status' : likeStatus
  };
}