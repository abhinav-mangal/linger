import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String? rating;
  final String? message;
  final DateTime? createdAt;
  final String? userName;
  final dynamic userImage;
  final String? productName;

  const Review({
    this.rating,
    this.message,
    this.createdAt,
    this.userName,
    this.userImage,
    this.productName,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json['rating'] as String?,
        message: json['message'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        userName: json['user_name'] as String?,
        userImage: json['user_image'] as dynamic,
        productName: json['product_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'message': message,
        'created_at': createdAt?.toIso8601String(),
        'user_name': userName,
        'user_image': userImage,
        'product_name': productName,
      };

  Review copyWith({
    String? rating,
    String? message,
    DateTime? createdAt,
    String? userName,
    dynamic userImage,
    String? productName,
  }) {
    return Review(
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
      message,
      createdAt,
      userName,
      userImage,
      productName,
    ];
  }
}
