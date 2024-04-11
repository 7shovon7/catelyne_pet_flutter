import 'package:catelyne_pet_flutter/ui/common/widgets/grid_view_builder.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/section_title_with_button.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/view_models/products/product_view_model.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/widgets/products/product_card.dart';
import 'package:flutter/material.dart';

List<ProductViewModel> allProducts = [
  ProductViewModel(
    title: 'Interactive Cat Toy',
    description:
        'Interactive Robotic Cat Toy, Automatic Feather/Ball Teaser Toy with 2 Replacements',
    category: 'Cat Toys',
    price: 18.99,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Dog Chew Toys',
    description:
        'Dog Chew Toys for Aggressive Chewers, Tough Indestructible Dog Toys for Large Dogs',
    category: 'Dog Toys',
    price: 14.99,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Cat Tree Tower',
    description:
        'Multi-Level Cat Tree Tower with Scratching Posts, Perch, Condo, Hammock and Dangling Balls',
    category: 'Cat Furniture',
    price: 49.99,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Dog Chew Toys',
    description:
        'Dog Chew Toys for Aggressive Chewers, Tough Indestructible Dog Toys for Large Dogs',
    category: 'Dog Toys',
    price: 14.99,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Cat Tree Tower',
    description:
        'Multi-Level Cat Tree Tower with Scratching Posts, Perch, Condo, Hammock and Dangling Balls',
    category: 'Cat Furniture',
    price: 49.99,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Interactive Cat Toy',
    description:
        'Interactive Robotic Cat Toy, Automatic Feather/Ball Teaser Toy with 2 Replacements',
    category: 'Cat Toys',
    price: 18.99,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  // ProductViewModel(
  //   title: 'Product 1',
  //   description: 'Description of Product 1',
  //   category: 'Category 1',
  //   price: 50.0,
  //   imgUrl:
  //       'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  // ),
  // ProductViewModel(
  //   title: 'Product 2',
  //   description: 'Description of Product 2',
  //   category: 'Category 2',
  //   price: 60.0,
  //   imgUrl:
  //       'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  // ),
  // ProductViewModel(
  //   title: 'Product 3',
  //   description: 'Description of Product 3',
  //   category: 'Category 1',
  //   price: 70.0,
  //   imgUrl:
  //       'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  // ),
  // ProductViewModel(
  //   title: 'Product 2',
  //   description: 'Description of Product 2',
  //   category: 'Category 2',
  //   price: 60.0,
  //   imgUrl:
  //       'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  // ),
  // ProductViewModel(
  //   title: 'Product 3',
  //   description: 'Description of Product 3',
  //   category: 'Category 1',
  //   price: 70.0,
  //   imgUrl:
  //       'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  // ),
  // Add more products as needed
];

List<Widget> homePageBestSellersSectionWidgets(
        BuildContext context, double contentWidth) =>
    [
      SectionTitleWithButton(
        title: 'Best Sellers',
        buttonText: 'Explore Now',
        onPressed: () {},
        displayWidth: contentWidth,
      ),
      CsGridView(
        maxItemsPerRow: 3,
        rowGap: 20.0,
        children: List.generate(
          allProducts.length,
          (index) => CsProductCard(product: allProducts[index]),
        ),
      ),
    ];
