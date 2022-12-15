import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/data/data_repository/app_repository.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';

class Cart extends Equatable {
  final int? productId;
  final int? quantity;
  final String? userName;
  final String? productName;
  final String? productImage;
  final int? saleprice;
  final int? discountprice;

  const Cart({
    this.productId,
    this.quantity,
    this.userName,
    this.productName,
    this.productImage,
    this.saleprice,
    this.discountprice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productId: json['product_id'] as int?,
        quantity: json['quantity'] as int?,
        userName: json['user_name'] as String?,
        productName: json['product_name'] as String?,
        productImage: json['product_image'] as String?,
        saleprice: json['saleprice'] as int?,
        discountprice: json['discountprice'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'quantity': quantity,
        'user_name': userName,
        'product_name': productName,
        'product_image': productImage,
        'saleprice': saleprice,
        'discountprice': discountprice,
      };

  Cart copyWith({
    int? productId,
    int? quantity,
    String? userName,
    String? productName,
    String? productImage,
    int? saleprice,
    int? discountprice,
  }) {
    return Cart(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      userName: userName ?? this.userName,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      saleprice: saleprice ?? this.saleprice,
      discountprice: discountprice ?? this.discountprice,
    );
  }

  @override
  List<Object?> get props {
    return [
      productId,
      quantity,
      userName,
      productName,
      productImage,
      saleprice,
      discountprice,
    ];
  }
}
