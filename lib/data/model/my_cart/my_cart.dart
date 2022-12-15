import 'package:equatable/equatable.dart';

import 'data.dart';

class MyCart extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final MyCartData? data;

  const MyCart({this.success, this.code, this.message, this.data});

  factory MyCart.fromJson(Map<String, dynamic> json) => MyCart(
        success: json['success'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : MyCartData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  MyCart copyWith({
    bool? success,
    int? code,
    String? message,
    MyCartData? data,
  }) {
    return MyCart(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
