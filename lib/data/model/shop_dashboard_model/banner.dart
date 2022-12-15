import 'package:equatable/equatable.dart';

class ShopBannerModel extends Equatable {
  final int? id;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ShopBannerModel({this.id, this.image, this.createdAt, this.updatedAt});

  factory ShopBannerModel.fromJson(Map<String, dynamic> json) =>
      ShopBannerModel(
        id: json['id'] as int?,
        image: json['image'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  ShopBannerModel copyWith({
    int? id,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShopBannerModel(
      id: id ?? this.id,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, image, createdAt, updatedAt];
}
