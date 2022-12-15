import 'package:equatable/equatable.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'subcategorie.dart';

class ProductsData extends Equatable {
  final List<Category>? category;
  final List<Subcategorie>? subcategorie;
  final List<ShopProduct>? product;
  final List<Slider>? sliders;

  const ProductsData({this.sliders, this.category, this.subcategorie, this.product});

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        category:
            (json['category'] as List<dynamic>?)?.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList(),
        subcategorie: (json['subcategorie'] as List<dynamic>?)
            ?.map((e) => Subcategorie.fromJson(e as Map<String, dynamic>))
            .toList(),
        product:
            (json['product'] as List<dynamic>?)?.map((e) => ShopProduct.fromJson(e as Map<String, dynamic>)).toList(),
        sliders: (json['slider'] as List<dynamic>?)?.map((e) => Slider.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'category': category?.map((e) => e.toJson()).toList(),
        'subcategorie': subcategorie?.map((e) => e.toJson()).toList(),
        'product': product?.map((e) => e.toJson()).toList(),
        'slider': sliders?.map((e) => e.toJson()).toList(),
      };

  ProductsData copyWith({
    List<Category>? category,
    List<Subcategorie>? subcategorie,
    List<ShopProduct>? product,
    List<Slider>? sliders,
  }) {
    return ProductsData(
      category: category ?? this.category,
      subcategorie: subcategorie ?? this.subcategorie,
      product: product ?? this.product,
      sliders: sliders ?? this.sliders,
    );
  }

  @override
  List<Object?> get props => [category, subcategorie, product, sliders];
}
