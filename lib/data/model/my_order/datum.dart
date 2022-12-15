import 'package:equatable/equatable.dart';

import 'morder.dart';

//  orderStatus: json['order_status'] as int?,
//         paymentStatus: json['payment_status'] as String?,
//
//
//         paymentMethod: json['payment_method'] as String?,

class OrderList extends Equatable {
  final String? orderid;
  final String? total;
  final List<Morder>? order;
  final int? orderStatus;
  final String? paymentMethod;
  final String? paymentStatus;
  final int? productId;

  const OrderList(
      {this.paymentMethod,
      this.paymentStatus,
      this.orderid,
      this.order,
      this.total,
      this.orderStatus,
      this.productId});

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
      productId: (json['order'] as List<dynamic>?)!.isNotEmpty
          ? json['order'][0]['product_id'] != null
              ? json['order'][0]['product_id'] as int?
              : 0
          : 0,
      orderid: json['orderid'] as String?,
      total: json['total'] as String?,
      order: (json['order'] as List<dynamic>?)
          ?.map((e) => Morder.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderStatus: (json['order'] as List<dynamic>?)!.isNotEmpty
          ? json['order'][0]['order_status'] as int?
          : 0,
      paymentStatus: (json['order'] as List<dynamic>?)!.isNotEmpty
          ? json['order'][0]['payment_status'] as String?
          : "",
      paymentMethod: (json['order'] as List<dynamic>?)!.isNotEmpty
          ? json['order'][0]['payment_method'] as String?
          : "");

  Map<String, dynamic> toJson() => {
        'orderid': orderid,
        'total': total,
        'order': order?.map((e) => e.toJson()).toList(),
      };

  OrderList copyWith(
      {String? orderid,
      String? total,
      List<Morder>? order,
      int? orderStatus,
      String? paymentMethod,
      String? paymentStatus,
      int? productId}) {
    return OrderList(
      orderid: orderid ?? this.orderid,
      total: total ?? this.total,
      order: order ?? this.order,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      productId: productId ?? this.productId,
    );
  }

  @override
  List<Object?> get props => [
        orderid,
        order,
        total,
        orderStatus,
        paymentMethod,
        paymentStatus,
        productId
      ];
}
