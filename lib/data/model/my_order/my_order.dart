import 'package:equatable/equatable.dart';

import 'datum.dart';

class MyOrder extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final List<OrderList>? data;

  const MyOrder({this.success, this.code, this.message, this.data});

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        success: json['success'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => OrderList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  MyOrder copyWith({
    bool? success,
    int? code,
    String? message,
    List<OrderList>? data,
  }) {
    return MyOrder(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
