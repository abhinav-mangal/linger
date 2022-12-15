import 'package:equatable/equatable.dart';

import 'datum.dart';

class MyOrderAddress extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final List<Address>? data;

  const MyOrderAddress({this.success, this.code, this.message, this.data});

  factory MyOrderAddress.fromJson(Map<String, dynamic> json) {
    return MyOrderAddress(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  MyOrderAddress copyWith({
    bool? success,
    int? code,
    String? message,
    List<Address>? data,
  }) {
    return MyOrderAddress(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
