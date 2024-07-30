import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final List<dynamic> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.images,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    double? discountPercentage,
    List<dynamic>? images,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        images: images ?? this.images,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'].toDouble(),
        discountPercentage: json['discountPercentage'].toDouble(),
        images: json['images'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'discountPercentage': discountPercentage,
        'images': images,
      };

  @override
  String toString() => 'Product(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage)';
}
