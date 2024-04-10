import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:catelyne_pet_flutter/ui/pages/shared/view_models/products/product_view_model.dart';
import 'package:flutter/material.dart';

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
