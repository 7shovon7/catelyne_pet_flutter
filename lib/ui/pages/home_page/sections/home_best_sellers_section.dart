import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
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
        maxItemsPerRow: 3,
        children: List.generate(
          allProducts.length,
          (index) => CsProductCard(product: allProducts[index]),
        ),
      ),
    ];

class ProductViewModel {
  final String title;
  final String description;
  final String category;
  final double price;
  final String imgUrl;

  ProductViewModel({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.imgUrl,
  });
}

class CsProductCard extends StatelessWidget {
  const CsProductCard({
    super.key,
    required this.product,
  });

  final ProductViewModel product;

  @override
  Widget build(BuildContext context) {
    final Widget cardBody = Column(
      children: [
        Image.network(
          product.imgUrl,
          fit: BoxFit.contain,
        ),
        Text(product.title),
        Text('${UiConstants.bdtSymbol}${product.price.toStringAsFixed(2)}'),
        Text(product.category.toUpperCase()),
        ElevatedButton(
          style: WidgetConstants.defaultButtonStyle,
          onPressed: () {},
          child: const Padding(
            padding: WidgetConstants.defaultButtonPadding,
            child: Text('Add to cart'),
          ),
        ),
      ],
    );
    return cardBody;
  }
}

class CsGridView extends StatelessWidget {
  const CsGridView({
    super.key,
    this.maxItemsPerRow = 3,
    required this.children,
    this.divider,
    this.childFlex = 10,
    this.dividerFlex = 1,
    this.rowGap = 10.0,
  });

  final int maxItemsPerRow;
  final List<Widget> children;
  final Widget? divider;
  final int childFlex;
  final int dividerFlex;
  final double rowGap;

  @override
  Widget build(BuildContext context) {
    Widget finalDivider = divider ?? Container();

    List<Widget> columnChildren = [];
    List<Widget> rowChildren = [Expanded(flex: childFlex, child: children[0])];

    for (int i = 1; i < children.length; i++) {
      if (rowChildren.length < maxItemsPerRow * 2 - 2) {
        rowChildren.addAll([
          Expanded(flex: dividerFlex, child: finalDivider),
          Expanded(flex: childFlex, child: children[i]),
        ]);
      } else {
        columnChildren.addAll([
          Row(
            mainAxisSize: MainAxisSize.min,
            children: rowChildren,
          ),
          SizedBox(height: rowGap),
        ]);
        rowChildren = [Expanded(flex: 10, child: children[i])];
      }
    }
    if (children.length % maxItemsPerRow > 0) {
      final int noOfBlankContainers =
          maxItemsPerRow - (children.length % maxItemsPerRow);
      if (noOfBlankContainers > 0) {
        for (int i = 0; i < noOfBlankContainers; i++) {
          rowChildren.addAll([
            Expanded(flex: 1, child: finalDivider),
            Expanded(flex: 10, child: finalDivider),
          ]);
        }
      }
    }
    columnChildren.addAll([
      Row(
        mainAxisSize: MainAxisSize.min,
        children: rowChildren,
      ),
      SizedBox(height: rowGap),
    ]);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: columnChildren,
    );
  }
}
