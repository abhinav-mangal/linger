import 'package:equatable/equatable.dart';
import 'package:linger/data/model/product_detail_model/review_detail_model.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_product.dart';

class ProductDetailData extends Equatable {
  final List<ShopProduct>? product;
  final List<ReviewDetail>? review;
  final int? totalReview;
  final String? totalRating;
  final List<ShopProduct>? relatedProduct;

  const ProductDetailData({
    this.product,
    this.review,
    this.totalReview,
    this.totalRating,
    this.relatedProduct,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) {
    List<ReviewDetail>? reviewList = <ReviewDetail>[];
    List<dynamic>? reviewData = json['review'] !=null ? json['review'] as List : null;
    if(reviewData!=null){
      reviewList = reviewData.map((e) => ReviewDetail.fromJson(e)).toList();
    }
      return ProductDetailData(
        product: (json['product'] as List<dynamic>?)
            ?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        review: reviewList,
        totalReview: json['total_review'] as int?,
        totalRating: json['total_rating'] as String?,
        relatedProduct: (json['related_product'] as List<dynamic>?)
            ?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );}

  Map<String, dynamic> toJson() => {
        'product': product?.map((e) => e.toJson()).toList(),
        'review': review,
        'total_review': totalReview,
        'total_rating': totalRating,
        'related_product': relatedProduct?.map((e) => e.toJson()).toList(),
      };

  ProductDetailData copyWith({
    List<ShopProduct>? product,
    List<ReviewDetail>? review,
    int? totalReview,
    String? totalRating,
    List<ShopProduct>? relatedProduct,
  }) {
    return ProductDetailData(
      product: product ?? this.product,
      review: review ?? this.review,
      totalReview: totalReview ?? this.totalReview,
      totalRating: totalRating ?? this.totalRating,
      relatedProduct: relatedProduct ?? this.relatedProduct,
    );
  }

  @override
  List<Object?> get props {
    return [
      product,
      review,
      totalReview,
      totalRating,
      relatedProduct,
    ];
  }
}
