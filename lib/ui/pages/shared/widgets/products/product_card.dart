import 'package:catelyne_pet_flutter/features/products/view_models.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CsProductCard extends StatelessWidget {
  const CsProductCard({
    super.key,
    required this.product,
  });

  final ProductViewModel product;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 10.0);
    final Widget cardBody = Column(
      children: [
        Image.network(
          product.imageUrl,
          fit: BoxFit.contain,
        ),
        spacer,
        Text(
          product.name,
          style: GoogleFonts.ibmPlexSerif(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        spacer,
        Text(
          '${UiConstants.bdtSymbol}${product.price.toStringAsFixed(2)}',
          style: GoogleFonts.ibmPlexSerif(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        spacer,
        Text(
          product.category.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        spacer,
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
