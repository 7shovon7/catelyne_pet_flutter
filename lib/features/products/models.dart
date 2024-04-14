import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final double price;
  final int stock;
  final int sold;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final String category;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.stock,
    required this.sold,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.imageUrl,
    required this.description,
  });

  // Factory method to create Product object from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      stock: map['stock'],
      sold: map['sold'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      description: map['description'],
    );
  }

  // Method to convert Product object to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'stock': stock,
      'sold': sold,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'category': category,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
