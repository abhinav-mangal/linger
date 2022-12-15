import 'package:equatable/equatable.dart';
import '../my_order/morder.dart';
import '../shop_dashboard_model/shop_product.dart';
import 'order.dart';
import 'order_product.dart';

class OrderDetailData extends Equatable {
  final Morder? order;

  final List<OrderProduct>? shopProduct;

  const OrderDetailData({this.order, this.shopProduct});

  factory OrderDetailData.fromJson(Map<String, dynamic> json) => OrderDetailData(
        order: json['order'] == null
            ? null
            : Morder.fromJson(json['order'] as Map<String, dynamic>),
        shopProduct: (json['order_product'] as List<dynamic>?)
            ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'order': order?.toJson(),
        'order_product': shopProduct?.map((e) => e.toJson()).toList(),
      };

  OrderDetailData copyWith({
    Morder? order,
    List<OrderProduct>? shopProduct,
  }) {
    return OrderDetailData(
      order: order ?? this.order,
      shopProduct: shopProduct ?? this.shopProduct,
    );
  }

  @override
  List<Object?> get props => [order, ShopProduct];
}
