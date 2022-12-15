import 'package:equatable/equatable.dart';

import '../shop_dashboard_model/flash_sale_product.dart';
import '../shop_dashboard_model/shop_product.dart';

class PaymentMethod extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final List<SavedPaymentMethods>? data;

  const PaymentMethod({this.success, this.code, this.message, this.data});

  // PaymentMethod.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   code = json['code'];
  //   message = json['message'];
  //   if (json['data'] != null) {
  //     data = <Data>[];
  //     json['data'].forEach((v) {
  //       data!.add(new Data.fromJson(v));
  //     });
  //   }
  // }
  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        data: List<SavedPaymentMethods>.from(
            json["data"].map((x) => SavedPaymentMethods.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [success, code, message, data];
}

class SavedPaymentMethods {
  int? id;
  String? name;
  String? cardNumber;
  int? expirationMonth;
  int? expirationYear;
  int? cvc;
  String? upi;
  String? createdAt;
  String? updatedAt;
  int? uid;

  SavedPaymentMethods(
      {this.id,
      this.name,
      this.cardNumber,
      this.expirationMonth,
      this.expirationYear,
      this.cvc,
      this.upi,
      this.createdAt,
      this.updatedAt,
      this.uid});

  SavedPaymentMethods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cardNumber = json['card_number'];
    expirationMonth = json['expirationMonth'];
    expirationYear = json['expirationYear'];
    cvc = json['cvc'];
    upi = json['upi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['card_number'] = cardNumber;
    data['expirationMonth'] = expirationMonth;
    data['expirationYear'] = expirationYear;
    data['cvc'] = cvc;
    data['upi'] = upi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['uid'] = uid;
    return data;
  }
}
