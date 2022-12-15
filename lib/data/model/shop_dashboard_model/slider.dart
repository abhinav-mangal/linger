import 'package:equatable/equatable.dart';

class Slider extends Equatable {
  final String? image;

  const Slider({this.image});

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'image': image,
      };

  Slider copyWith({
    String? image,
  }) {
    return Slider(
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [image];
}
