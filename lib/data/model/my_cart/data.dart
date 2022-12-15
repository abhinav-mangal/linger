import 'package:equatable/equatable.dart';

import 'cart.dart';

class MyCartData extends Equatable {
  final List<Cart>? cart;
  final int? total;

  const MyCartData({this.cart, this.total});

  factory MyCartData.fromJson(Map<String, dynamic> json) => MyCartData(
        cart: (json['cart'] as List<dynamic>?)
            ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'cart': cart?.map((e) => e.toJson()).toList(),
        'total': total,
      };

  MyCartData copyWith({
    List<Cart>? cart,
    int? total,
  }) {
    return MyCartData(
      cart: cart ?? this.cart,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [cart, total];
}
