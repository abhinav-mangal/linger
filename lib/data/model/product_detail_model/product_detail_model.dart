import 'package:equatable/equatable.dart';

import 'data.dart';

class ProductDetailModel extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final ProductDetailData? data;

  const ProductDetailModel({
    this.success,
    this.code,
    this.message,
    this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProductDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  ProductDetailModel copyWith({
    bool? success,
    int? code,
    String? message,
    ProductDetailData? data,
  }) {
    return ProductDetailModel(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
