import 'package:equatable/equatable.dart';

class ReviewDetail extends Equatable {
  final String? rating;
  final String? message;
  final String? createdAt;
  final String? userName;
  final String? userImage;
  final String? productName;

  const ReviewDetail({
    this.rating,
    this.message,
    this.createdAt,
    this.userName,
    this.userImage,
    this.productName,
  });

  factory ReviewDetail.fromJson(Map<String, dynamic> json) {
    return ReviewDetail(
      rating: json['rating'] as String?,
      message: json['message'] as String?,
      createdAt: json['created_at'] as String?,
      userName: json['user_name'] as String?,
      userImage: json['user_image'] as String?,
      productName: json['product_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'rating': rating,
    'message': message,
    'created_at': createdAt,
    'user_name': userName,
    'user_image': userImage,
    'product_name': productName,
  };

  ReviewDetail copyWith({
    String? rating,
    String? message,
    String? createdAt,
    String? userName,
    String? userImage,
    String? productName,
  }) {
    return ReviewDetail(
      rating: rating ?? this.rating,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      productName: productName ?? this.productName,
    );
  }

  @override
  List<Object?> get props {
    return [
      rating,
      createdAt,
      createdAt,
      userName,
      userImage,
      productName,
    ];
  }
}
