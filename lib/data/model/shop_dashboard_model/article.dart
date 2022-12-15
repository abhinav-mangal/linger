import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int? id;
  final String? articleimage;
  final String? title;
  final String? subtitle;
  final String? price;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Article({
    this.id,
    this.articleimage,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json['id'] as int?,
        articleimage: json['articleimage'] as String?,
        title: json['title'] as String?,
        subtitle: json['subtitle'] as String?,
        price: json['price'] as String?,
        description: json['description'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'articleimage': articleimage,
        'title': title,
        'subtitle': subtitle,
        'price': price,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  Article copyWith({
    int? id,
    String? articleimage,
    String? title,
    String? subtitle,
    String? price,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Article(
      id: id ?? this.id,
      articleimage: articleimage ?? this.articleimage,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      articleimage,
      title,
      subtitle,
      price,
      description,
      createdAt,
      updatedAt,
    ];
  }
}
