import 'package:equatable/equatable.dart';

import 'data..dart';

class OrderSummaryModel extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final OrderSummaryData? data;

  const OrderSummaryModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory OrderSummaryModel.fromJson(Map<String, dynamic> json) {
    return OrderSummaryModel(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null ? null : OrderSummaryData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  OrderSummaryModel copyWith({
    bool? success,
    int? code,
    String? message,
    OrderSummaryData? data,
  }) {
    return OrderSummaryModel(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
