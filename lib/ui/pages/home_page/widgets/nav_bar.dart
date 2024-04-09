import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CSNavBar extends StatelessWidget {
  const CSNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = context.width;
    final isFullSizedNav = deviceWidth >= UiConstants.largeDisplayMinWidth;
    const textColor = Colors.white;
    Widget menuItem(String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          title,
          style: const TextStyle(
            color: textColor,
          ),
        ),
      );
    }

    List<Widget> menuBarWithCart() {
      if (isFullSizedNav) {
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              menuItem('Home'),
              menuItem('Products'),
              menuItem('About Us'),
              menuItem('Blog'),
              menuItem('Contact'),
            ],
          ),
          const Icon(
            FontAwesomeIcons.basketShopping,
            color: textColor,
          ),
        ];
      } else {
        return [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                FontAwesomeIcons.basketShopping,
                color: textColor,
              ),
              const SizedBox(
                width: 30.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.bars,
                  color: textColor,
                ),
              ),
            ],
          ),
        ];
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Catelyn Store',
            style: GoogleFonts.ibmPlexSerif(
              color: textColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          ...menuBarWithCart(),
        ],
      ),
    );
  }
}
