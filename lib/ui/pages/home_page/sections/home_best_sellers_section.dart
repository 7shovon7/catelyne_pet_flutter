import 'package:catelyne_pet_flutter/ui/common/widgets/grid_view_builder.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/view_models/products/product_view_model.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/widgets/products/product_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<ProductViewModel> allProducts = [
  ProductViewModel(
    title: 'Product 1',
    description: 'Description of Product 1',
    category: 'Category 1',
    price: 50.0,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Product 2',
    description: 'Description of Product 2',
    category: 'Category 2',
    price: 60.0,
    imgUrl:
        'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
  ),
  ProductViewModel(
    title: 'Product 3',
    description: 'Description of Product 3',
    category: 'Category 1',
    price: 70.0,
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

List<Widget> homePageBestSellersSectionWidgets(BuildContext context) => [
      const SizedBox(
        height: 30.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Best Sellers',
              textAlign: TextAlign.left,
              style: GoogleFonts.ibmPlexSerif(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            OutlinedButton(
              style: WidgetConstants.defaultOutlineButtonStyle,
              onPressed: () {},
              child: Padding(
                padding: WidgetConstants.defaultButtonPadding,
                child: Text('Explore Now'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
      CsGridView(
        maxItemsPerRow: 4,
        children: List.generate(
          allProducts.length,
          (index) => CsProductCard(product: allProducts[index]),
        ),
      ),
    ];
