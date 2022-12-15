import 'package:equatable/equatable.dart';
import 'package:linger/data/model/my_cart/cart.dart';
import 'address..dart';

class OrderSummaryData extends Equatable {
  final Address? address;
  final List<Cart>? cart;
  final int? subTotal;
  final int? shippingAmount;
  final int? total;

  const OrderSummaryData({
    this.address,
    this.cart,
    this.subTotal,
    this.shippingAmount,
    this.total,
  });

  factory OrderSummaryData.fromJson(Map<String, dynamic> json) => OrderSummaryData(
        address: json['address'] == null ? null : Address.fromJson(json['address'] as Map<String, dynamic>),
        cart: (json['cart'] as List<dynamic>?)?.map((e) => Cart.fromJson(e as Map<String, dynamic>)).toList(),
        subTotal: json['sub_total'] as int?,
        shippingAmount: json['shipping_amount'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'address': address?.toJson(),
        'cart': cart?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'shipping_amount': shippingAmount,
        'total': total,
      };

  OrderSummaryData copyWith({
    Address? address,
    List<Cart>? cart,
    int? subTotal,
    int? shippingAmount,
    int? total,
  }) {
    return OrderSummaryData(
      address: address ?? this.address,
      cart: cart ?? this.cart,
      subTotal: subTotal ?? this.subTotal,
      shippingAmount: shippingAmount ?? this.shippingAmount,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props {
    return [
      address,
      cart,
      subTotal,
      shippingAmount,
      total,
    ];
  }
}
