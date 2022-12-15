import 'package:equatable/equatable.dart';

import 'datum.dart';

class Reviews extends Equatable {
  final bool? success;
  final int? code;
  final String? message;
  final List<Review>? data;

  const Reviews({this.success, this.code, this.message, this.data});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        success: json['success'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  Reviews copyWith({
    bool? success,
    int? code,
    String? message,
    List<Review>? data,
  }) {
    return Reviews(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [success, code, message, data];
}
