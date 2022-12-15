import 'package:equatable/equatable.dart';

import 'data.dart';

class Products extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final ProductsData? data;

  const Products({this.success, this.code, this.message, this.data});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        success: json['success'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : ProductsData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  Products copyWith({
    bool? success,
    int? code,
    String? message,
    ProductsData? data,
  }) {
    return Products(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
