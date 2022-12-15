import 'package:equatable/equatable.dart';

class Morder extends Equatable {
  final int? id;
  final int? uid;
  final String? oid;
  final int? orderStatus;
  final String? paymentStatus;
  final String? shippingAmount;
  final String? subtotal;
  final String? total;
  final String? address;
  final String? paymentMethod;
  final String? orderDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? productName;
  final String? productImage;
  final int? quantity;
  final int? price;
  final dynamic attribute;

  const Morder({
    this.id,
    this.uid,
    this.oid,
    this.orderStatus,
    this.paymentStatus,
    this.shippingAmount,
    this.subtotal,
    this.total,
    this.address,
    this.paymentMethod,
    this.orderDate,
    this.createdAt,
    this.updatedAt,
    this.productName,
    this.productImage,
    this.quantity,
    this.price,
    this.attribute,
  });

  factory Morder.fromJson(Map<String, dynamic> json) => Morder(
        id: json['id'] as int?,
        uid: json['uid'] as int?,
        oid: json['oid'] as String?,
        orderStatus: json['order_status'] as int?,
        paymentStatus: json['payment_status'] as String?,
        shippingAmount: "${json['shipping_amount']}",
        subtotal: "${json['subtotal']}",
        total: "${json['total']}",
        address: json['address'] as String?,
        paymentMethod: json['payment_method'] as String?,
        orderDate: json['order_date'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        productName: json['product_name'] as String?,
        productImage: json['product_image'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        attribute: json['attribute'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'oid': oid,
        'order_status': orderStatus,
        'payment_status': paymentStatus,
        'shipping_amount': shippingAmount,
        'subtotal': subtotal,
        'total': total,
        'address': address,
        'payment_method': paymentMethod,
        'order_date': orderDate,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'product_name': productName,
        'product_image': productImage,
        'quantity': quantity,
        'price': price,
        'attribute': attribute,
      };

  Morder copyWith({
    int? id,
    int? uid,
    String? oid,
    int? orderStatus,
    String? paymentStatus,
    String? shippingAmount,
    String? subtotal,
    String? total,
    String? address,
    String? paymentMethod,
    String? orderDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? productName,
    String? productImage,
    int? quantity,
    int? price,
    dynamic attribute,
  }) {
    return Morder(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      oid: oid ?? this.oid,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      shippingAmount: shippingAmount ?? this.shippingAmount,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      address: address ?? this.address,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      orderDate: orderDate ?? this.orderDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      attribute: attribute ?? this.attribute,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      uid,
      oid,
      orderStatus,
      paymentStatus,
      shippingAmount,
      subtotal,
      total,
      address,
      paymentMethod,
      orderDate,
      createdAt,
      updatedAt,
      productName,
      productImage,
      quantity,
      price,
      attribute,
    ];
  }
}
