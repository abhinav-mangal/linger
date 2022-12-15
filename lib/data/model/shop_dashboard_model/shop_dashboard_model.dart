import 'package:equatable/equatable.dart';

import 'data.dart';

class ShopDashboardModel extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final ShopData? data;

  const ShopDashboardModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory ShopDashboardModel.fromJson(Map<String, dynamic> json) {
    return ShopDashboardModel(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ShopData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  ShopDashboardModel copyWith({
    bool? success,
    int? code,
    String? message,
    ShopData? data,
  }) {
    return ShopDashboardModel(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
