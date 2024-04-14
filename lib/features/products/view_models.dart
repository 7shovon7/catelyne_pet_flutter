import 'package:catelyne_pet_flutter/features/products/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductViewModel extends Product {
  ProductViewModel({
    required super.name,
    required super.price,
    required super.stock,
    required super.sold,
    required super.updatedAt,
    required super.category,
    required super.imageUrl,
    required super.description,
  }) : super(
          createdAt: Timestamp.now(),
        );

  // Factory method to create ProductViewModel object from a Product object
  factory ProductViewModel.fromProduct(Product product) {
    return ProductViewModel(
      name: product.name,
      price: product.price,
      stock: product.stock,
      sold: product.sold,
      updatedAt: product.updatedAt,
      category: product.category,
      imageUrl: product.imageUrl,
      description: product.description,
    );
  }
}
