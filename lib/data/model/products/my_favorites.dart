import '../shop_dashboard_model/shop_product.dart';

class MyFavoriteProduct {
  bool? success;
  int? code;
  String? message;
  MyFavoriteProductData? data;

  MyFavoriteProduct({this.success, this.code, this.message, this.data});

  MyFavoriteProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? MyFavoriteProductData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MyFavoriteProductData {
  List<ShopProduct>? products;

  MyFavoriteProductData({this.products});

  MyFavoriteProductData.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      products = <ShopProduct>[];
      json['product'].forEach((v) {
        products!.add(ShopProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['product'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
