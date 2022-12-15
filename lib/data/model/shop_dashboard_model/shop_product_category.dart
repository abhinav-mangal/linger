import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';

class ShopProductCategoryModel {
  String? categoryName;
  int? id;
  List<ShopProduct>? product;

  ShopProductCategoryModel({this.categoryName, this.id, this.product});

  ShopProductCategoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    id = json['id'];
    if (json['product'] != null) {
      product = <ShopProduct>[];
      json['product'].forEach((v) {
        product!.add(new ShopProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
