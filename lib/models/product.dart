import 'dart:convert';

import 'package:v1douvery/models/ratings.dart';
import 'package:v1douvery/models/viewed.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final String marca;
  final double price;
  final String? id;
  final List<Rating>? rating;
  final List<Viewed>? viewed;

  Product({
    required this.name,
    required this.marca,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
    this.viewed,
  });

  get length => null;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'marca': marca,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating,
      'viewed': viewed,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      marca: map['marca'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
      viewed: map['viewed'] != null
          ? List<Viewed>.from(
              map['viewed']?.map(
                (x) => Viewed.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  static find(Map<dynamic, Map<dynamic, String>> map) {}

  fetchNewProducts() {}
}
