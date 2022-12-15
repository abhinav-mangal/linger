import 'package:equatable/equatable.dart';

class OrderProduct extends Equatable {
  final int? id;
  final String? oid;
  final String? productName;
  final String? productImage;
  final int? quantity;
  final int? price;
  final dynamic attribute;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const OrderProduct({
    this.id,
    this.oid,
    this.productName,
    this.productImage,
    this.quantity,
    this.price,
    this.attribute,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json['id'] as int?,
        oid: json['oid'] as String?,
        productName: json['product_name'] as String?,
        productImage: json['product_image'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        attribute: json['attribute'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'oid': oid,
        'product_name': productName,
        'product_image': productImage,
        'quantity': quantity,
        'price': price,
        'attribute': attribute,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  OrderProduct copyWith({
    int? id,
    String? oid,
    String? productName,
    String? productImage,
    int? quantity,
    int? price,
    dynamic attribute,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderProduct(
      id: id ?? this.id,
      oid: oid ?? this.oid,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      attribute: attribute ?? this.attribute,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      oid,
      productName,
      productImage,
      quantity,
      price,
      attribute,
      createdAt,
      updatedAt,
    ];
  }
}
