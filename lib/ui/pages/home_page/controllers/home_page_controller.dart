import 'package:catelyne_pet_flutter/features/blogs/models.dart';
import 'package:catelyne_pet_flutter/features/blogs/repository.dart';
import 'package:catelyne_pet_flutter/features/blogs/view_models.dart';
import 'package:catelyne_pet_flutter/features/products/models.dart';
import 'package:catelyne_pet_flutter/features/products/repository.dart';
import 'package:catelyne_pet_flutter/features/products/view_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homePageController = Provider(
  (ref) => HomePageController(
    productsRepo: ref.watch(productsRepoProvider),
    blogRepo: ref.watch(blogRepo),
  ),
);

class HomePageController {
  final ProductsRepo productsRepo;
  final BlogRepo blogRepo;

  HomePageController({
    required this.productsRepo,
    required this.blogRepo,
  });

  Future<List<ProductViewModel>> getProducts() async {
    List<Product> productList = await productsRepo.allProducts;
    return productList.map((e) => ProductViewModel.fromProduct(e)).toList();
  }

  Future<List<BlogViewModel>> getBlogs() async {
    List<BlogModel> blogList = await blogRepo.allBlogs;
    return blogList.map((e) => BlogViewModel.fromBlogModel(e)).toList();
  }
}
