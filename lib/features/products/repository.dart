import 'package:catelyne_pet_flutter/data/firebase/constants.dart';
import 'package:catelyne_pet_flutter/data/firebase/firestore_db.dart';
import 'package:catelyne_pet_flutter/features/products/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsRepoProvider = Provider(
  (ref) => ProductsRepo(
    firestoreDB: ref.watch(firestoreProvider),
  ),
);

class ProductsRepo {
  final FirestoreDB firestoreDB;

  ProductsRepo({required this.firestoreDB});

  final List<Product> _allProducts = [];
  bool _isProductsLoaded = false;
  bool _isProductsLoading = false;

  Future<List<Product>> get allProducts async {
    while (!_isProductsLoaded) {
      if (_isProductsLoading) {
        // wait
        await Future.delayed(const Duration(milliseconds: 500));
      } else {
        await _updateAllProducts();
      }
    }
    return _allProducts;
  }

  Future<void> _updateAllProducts() async {
    _isProductsLoading = true;
    List<Product> products = [];

    try {
      final QuerySnapshot allProducts = await firestoreDB.firestore
          .collection(FirebaseConstants.productsCollection)
          .get();
      if (allProducts.docs.isNotEmpty) {
        List<DocumentSnapshot> docs = allProducts.docs;
        for (DocumentSnapshot doc in docs) {
          Product product = Product.fromMap(doc.data() as Map<String, dynamic>);
          products.add(product);
        }
      } else {
        print(
            'No products found in the collection ${FirebaseConstants.productsCollection}');
      }
    } catch (e) {
      print('Error getting products: $e');
    }
    if (products.isNotEmpty) _allProducts.addAll(products);
    print('products are refreshed!');
    _isProductsLoading = false;
    _isProductsLoaded = true;
  }
}
