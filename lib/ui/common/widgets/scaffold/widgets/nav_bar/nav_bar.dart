import 'package:catelyne_pet_flutter/core/assets.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';

class CSNavBar extends StatelessWidget {
  const CSNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = context.width;
    final isFullSizedNav = deviceWidth >= UiConstants.largeDisplayMinWidth;
    const textColor = Colors.white;
    Widget menuItem(
      String title, {
      bool isActive = false,
      void Function()? onPressed,
    }) {
      return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(WidgetConstants.defaultBoxShape),
        ),
        onPressed: onPressed ?? () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? textColor : UiConstants.offWhite,
            ),
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
              menuItem(
                'Home',
                isActive: true,
              ),
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
                onPressed: () => Scaffold.of(context).openEndDrawer(),
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
      padding: const EdgeInsets.only(top: 34.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 30.0,
              child: Image.asset(
                AssetItems.logo,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          ...menuBarWithCart(),
        ],
      ),
    );
  }
}
