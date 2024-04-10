import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      Row(
        children: List.generate(
          4,
          (index) => CsProductCard(
            flex: 1,
            itemIndex: index,
            itemCount: 4,
            title: 'Pellentesque Mauris',
            price: 40.0,
            imgUrl:
                'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
          ),
        ),
      ),
      // SizedBox(
      //   width: double.infinity,
      //   child: ListView.separated(
      //     shrinkWrap: true,
      //     scrollDirection: Axis.horizontal,
      //     physics: const NeverScrollableScrollPhysics(),
      //     itemCount: 4,
      //     separatorBuilder: (context, index) => const SizedBox(
      //       width: 10.0,
      //     ),
      //     itemBuilder: (context, index) => const CsProductCard(
      //       flex: 1,
      //       title: 'Pellentesque Mauris',
      //       price: 40.0,
      //       imgUrl:
      //           'https://th.bing.com/th/id/R.2d4c2935a93b8728effdaaf81bb510e4?rik=YDsazFbHww508g&pid=ImgRaw&r=0',
      //     ),
      //   ),
      // ),
    ];

class CsProductCard extends StatelessWidget {
  const CsProductCard({
    super.key,
    this.flex = 1,
    this.itemCount = 1,
    this.itemIndex = 0,
    this.isHorizontal = true,
    required this.imgUrl,
    required this.title,
    required this.price,
  });

  final int flex;
  final String imgUrl;
  final String title;
  final double price;
  // only to detect the necessity of separator
  final int itemCount;
  final int itemIndex;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    final Widget cardBody = Column(
      children: [
        Image.network(imgUrl),
        Text(title),
        Text('${UiConstants.bdtSymbol}${price.toStringAsFixed(2)}'),
        Text('Beds'.toUpperCase()),
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
    if (itemCount > 1) {
      if (itemIndex == 0) {
        return Flexible(
          flex: flex,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: cardBody,
          ),
        );
      } else if (itemIndex < itemCount - 1) {
        return Flexible(
          flex: flex,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: cardBody,
          ),
        );
      } else {
        return Flexible(
          flex: flex,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: cardBody,
          ),
        );
      }
    } else {
      return Flexible(
        flex: flex,
        child: cardBody,
      );
    }
  }
}
