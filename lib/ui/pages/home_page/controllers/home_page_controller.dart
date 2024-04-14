import 'package:catelyne_pet_flutter/features/products/models.dart';
import 'package:catelyne_pet_flutter/features/products/repository.dart';
import 'package:catelyne_pet_flutter/features/products/view_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageController = Provider(
  (ref) => HomePageController(
    productsRepo: ref.watch(productsRepoProvider),
  ),
);

class HomePageController {
  final ProductsRepo productsRepo;

  HomePageController({
    required this.productsRepo,
  });

  Future<List<ProductViewModel>> getProducts() async {
    List<Product> productList = await productsRepo.allProducts;
    return productList.map((e) => ProductViewModel.fromProduct(e)).toList();
  }
}
