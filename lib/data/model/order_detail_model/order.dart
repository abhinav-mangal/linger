import 'package:equatable/equatable.dart';

import 'order.dart';

class Order extends Equatable {
  final String? orderid;
  final String? total;
  final List<Order>? order;

  const Order({this.orderid, this.order,this.total});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderid: json['orderid'] as String?,
    total: json['total'] as String?,
        order: (json['order'] as List<dynamic>?)
            ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'orderid': orderid,
         'total':total,
        'order': order?.map((e) => e.toJson()).toList(),
      };

  Order copyWith({
    String? orderid,
    String? total,
    List<Order>? order,
  }) {
    return Order(
      orderid: orderid ?? this.orderid,
      total: total ?? this.total,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [orderid, order,total];
}
