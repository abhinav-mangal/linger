import '../order_detail_model/order.dart';
import 'morder.dart';

class OrderResponseModel {
  bool? success;
  int? code;
  String? message;
  Morder ?data;

  OrderResponseModel({this.success, this.code, this.message, this.data});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] is int) {
      data = json['data'];
    } else {
      data = json['data'] != null ? Morder.fromJson(json['data']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

