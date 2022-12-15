import 'package:equatable/equatable.dart';

class FlashSaleProduct extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? saleprice;
  final String? discountprice;
  final int? likeStatus;

  const FlashSaleProduct({
    this.id,
    this.name,
    this.image,
    this.saleprice,
    this.discountprice,
    this.likeStatus,
  });

  factory FlashSaleProduct.fromJson(Map<String, dynamic> json) {
    return FlashSaleProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      saleprice: json['saleprice'] as String?,
      discountprice: json['discountprice'] as String?,
      likeStatus: json['like_status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'saleprice': saleprice,
        'discountprice': discountprice,
        'like_status': likeStatus,
      };

  FlashSaleProduct copyWith({
    int? id,
    String? name,
    String? image,
    String? saleprice,
    String? discountprice,
    int? likeStatus,
  }) {
    return FlashSaleProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      saleprice: saleprice ?? this.saleprice,
      discountprice: discountprice ?? this.discountprice,
      likeStatus: likeStatus ?? this.likeStatus,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      saleprice,
      discountprice,
      likeStatus,
    ];
  }
}
