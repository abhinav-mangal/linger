import 'package:equatable/equatable.dart';

import '../shop_dashboard_model/flash_sale_product.dart';
import '../shop_dashboard_model/shop_product.dart';
import 'data.dart';

class SeeAllModel extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final ListFlProduct? data;

  const SeeAllModel({this.success, this.code, this.message, this.data});

  factory SeeAllModel.fromJson(Map<String, dynamic> json) => SeeAllModel(
    success: json['success'] as bool?,
    code: json['code'] as int?,
    message: json['message'] as String?,
    data: json['data'] != null ? ListFlProduct.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'code': code,
    'message': message,
    'data': data?.toJson(),
  };

  SeeAllModel copyWith({
    bool? success,
    int? code,
    String? message,
    ListFlProduct? data,
  }) {
    return SeeAllModel(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
class ListFlProduct {
  List<ShopProduct>? product;

  ListFlProduct({this.product});

  ListFlProduct.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ShopProduct>[];
      json['product'].forEach((v) {
        product?.add(ShopProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (product != null) {
      data['product'] = product?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}