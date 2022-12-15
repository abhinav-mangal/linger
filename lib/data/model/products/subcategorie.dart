import 'package:equatable/equatable.dart';

class Subcategorie extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const Subcategorie({this.id, this.name, this.image});

  factory Subcategorie.fromJson(Map<String, dynamic> json) => Subcategorie(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };

  Subcategorie copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Subcategorie(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [id, name, image];
}
