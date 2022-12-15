import 'package:equatable/equatable.dart';

class ProductMedia extends Equatable {
  final String? media;

  const ProductMedia({this.media});

  factory ProductMedia.fromJson(Map<String, dynamic> json) => ProductMedia(
    media: json['file'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'file': media,
  };

  ProductMedia copyWith({
    String? media,
  }) {
    return ProductMedia(
      media: media ?? this.media,
    );
  }

  @override
  List<Object?> get props => [media];
}
