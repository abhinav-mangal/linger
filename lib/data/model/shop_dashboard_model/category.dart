import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? name;
  final String? icon;

  const Category({this.id, this.name, this.icon});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };

  Category copyWith({
    int? id,
    String? name,
    String? icon,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [id, name, icon];
}
