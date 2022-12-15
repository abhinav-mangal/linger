import 'package:equatable/equatable.dart';
import 'data.dart';

class OrderDetailModel extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final OrderDetailData? data;

  const OrderDetailModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : OrderDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  OrderDetailModel copyWith({
    bool? success,
    int? code,
    String? message,
    OrderDetailData? data,
  }) {
    return OrderDetailModel(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
