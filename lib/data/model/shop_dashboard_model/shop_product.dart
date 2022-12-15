import 'package:equatable/equatable.dart';

class ShopProduct extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? saleprice;
  final int? quantity;
  final String? discountprice;
  final int? likeStatus;
  final List<String>? galleryFile;
  final String? video;
  final String? rating;
  final String? shortDetails;
  final String? description;
  final bool isCart;
  final bool isLiked;

  const ShopProduct({
    this.galleryFile,
    this.video,
    this.rating,
    this.id,
    this.name,
    this.quantity,
    this.image,
    this.saleprice,
    this.discountprice,
    this.likeStatus,
    this.description,
    this.shortDetails,
    required this.isCart,
    required this.isLiked,
  });

  factory ShopProduct.fromJson(Map<String, dynamic> json) {
    List<String> mediaList = <String>[];
    List<dynamic>? mediaData =
        json['gallery_image'] != null ? json['gallery_image'] as List : null;
    if (mediaData != null) {
      mediaList = List<String>.from(mediaData.map((e) => e));
    }
    return ShopProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      saleprice: json['saleprice'] as String?,
      discountprice: json['discountprice'] as String?,
      isLiked: json['like_status'] != null
          ? json['like_status'].toString() == "1"
              ? true
              : false
          : false,
      likeStatus: json['like_status'] as int?,
      quantity: json["quantity"] as int?,
      galleryFile: mediaList,
      rating: json['rating'] as String?,
      shortDetails: json['short_details'] as String?,
      description: json['discription'] as String?,
      isCart: json['is_cart'] != null
          ? json['is_cart'].toString() == "1"
              ? true
              : false
          : false,
      video: json['video'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'quantity': quantity,
        'saleprice': saleprice,
        'discountprice': discountprice,
        'like_status': likeStatus,
        'gallery_image': galleryFile,
        'rating': rating,
        'short_details': shortDetails,
        'discription': description,
        'is_cart': isCart,
        'video': video,
      };

  ShopProduct copyWith({
    int? id,
    String? name,
    String? image,
    String? saleprice,
    int? quantity,
    String? discountprice,
    int? likeStatus,
    List<String>? galleryFile,
    String? rating,
    String? shortDetails,
    String? description,
    bool? isCart,
    String? video,
    bool? isLiked,
  }) {
    return ShopProduct(
      id: id ?? this.id,
      isLiked: isLiked ?? this.isLiked,
      name: name ?? this.name,
      image: image ?? this.image,
      saleprice: saleprice ?? this.saleprice,
      quantity: quantity ?? this.quantity,
      discountprice: discountprice ?? this.discountprice,
      likeStatus: likeStatus ?? this.likeStatus,
      galleryFile: galleryFile ?? this.galleryFile,
      rating: rating ?? this.rating,
      shortDetails: shortDetails ?? this.shortDetails,
      description: description ?? this.description,
      isCart: isCart ?? this.isCart,
      video: video ?? this.video,
    );
  }

  @override
  List<Object?> get props {
    return [
      isLiked,
      id,
      name,
      image,
      saleprice,
      quantity,
      discountprice,
      likeStatus,
      galleryFile,
      rating,
      shortDetails,
      description,
      isCart,
      video
    ];
  }
}
