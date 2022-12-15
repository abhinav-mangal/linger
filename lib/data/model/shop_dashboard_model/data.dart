import 'package:equatable/equatable.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_product_category.dart';

class ShopData extends Equatable {
  final List<Slider>? slider;
  final List<Category>? category;
  final List<ShopProduct>? flashSaleProduct;
  final ShopBannerModel? banner;
  final List<ShopProduct>? popularProduct;
  final List<ShopProduct>? mostLikeProduct;
  final List<Article>? article;
  final List<ShopProductCategoryModel>? categoryProduct;

  const ShopData({
    this.categoryProduct,
    this.slider,
    this.category,
    this.flashSaleProduct,
    this.banner,
    this.popularProduct,
    this.mostLikeProduct,
    this.article,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        slider: (json['slider'] as List<dynamic>?)?.map((e) => Slider.fromJson(e as Map<String, dynamic>)).toList(),
        category:
            (json['category'] as List<dynamic>?)?.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList(),
        flashSaleProduct: (json['flash_sale_product'] as List<dynamic>?)
            ?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        banner: json['banner'] == null ? null : ShopBannerModel.fromJson(json['banner'] as Map<String, dynamic>),
        popularProduct: (json['popular_product'] as List<dynamic>?)
            ?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        mostLikeProduct: (json['most_like_product'] as List<dynamic>?)
            ?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        article: (json['article'] as List<dynamic>?)?.map((e) => Article.fromJson(e as Map<String, dynamic>)).toList(),
        categoryProduct: (json['category_product'] as List<dynamic>?)
            ?.map((e) => ShopProductCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'slider': slider?.map((e) => e.toJson()).toList(),
        'category': category?.map((e) => e.toJson()).toList(),
        'flash_sale_product': flashSaleProduct?.map((e) => e.toJson()).toList(),
        'banner': banner?.toJson(),
        'popular_product': popularProduct?.map((e) => e.toJson()).toList(),
        'most_like_product': mostLikeProduct?.map((e) => e.toJson()).toList(),
        'article': article?.map((e) => e.toJson()).toList(),
        'category_product': categoryProduct?.map((e) => e.toJson()).toList(),
      };

  ShopData copyWith({
    List<Slider>? slider,
    List<Category>? category,
    List<ShopProduct>? flashSaleProduct,
    ShopBannerModel? banner,
    List<ShopProduct>? popularProduct,
    List<ShopProduct>? mostLikeProduct,
    List<Article>? article,
    List<ShopProductCategoryModel>? categoryProduct,
  }) {
    return ShopData(
      slider: slider ?? this.slider,
      category: category ?? this.category,
      flashSaleProduct: flashSaleProduct ?? this.flashSaleProduct,
      banner: banner ?? this.banner,
      popularProduct: popularProduct ?? this.popularProduct,
      mostLikeProduct: mostLikeProduct ?? this.mostLikeProduct,
      article: article ?? this.article,
      categoryProduct: categoryProduct ?? this.categoryProduct,
    );
  }

  @override
  List<Object?> get props {
    return [
      slider,
      category,
      flashSaleProduct,
      banner,
      popularProduct,
      mostLikeProduct,
      article,
      categoryProduct,
    ];
  }
}
