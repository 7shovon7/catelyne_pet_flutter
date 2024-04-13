import 'package:catelyne_pet_flutter/core/assets.dart';
import 'package:catelyne_pet_flutter/data/constants.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';

class CSNavBar extends StatelessWidget {
  const CSNavBar({
    super.key,
    this.activeItem,
  });

  final String? activeItem;

  @override
  Widget build(BuildContext context) {
    final String activeMenuItem = activeItem ?? DataConstants.menuItems[0];
    final deviceWidth = context.width;
    final isFullSizedNav = deviceWidth >= UiConstants.largeDisplayMinWidth;
    final Color activeTextColor = Theme.of(context).colorScheme.onPrimary;
    final Color inActiveTextColor =
        Theme.of(context).colorScheme.outlineVariant;

    Widget menuItem(
      String title, {
      bool isActive = false,
      void Function()? onPressed,
    }) {
      return TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              isActive ? UiConstants.accentColor.withOpacity(0.1) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? activeTextColor : inActiveTextColor,
            ),
          ),
        ),
      );
    }

    List<Widget> menuBarWithCart({String? activeItemName}) {
      activeItemName ??= activeMenuItem;
      List<Widget> menuBarItems = DataConstants.menuItems
          .map(
            (e) => menuItem(e, isActive: e == activeItemName),
          )
          .toList();
      if (isFullSizedNav) {
        return [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menuBarItems,
          ),
          Icon(
            FontAwesomeIcons.basketShopping,
            color: activeTextColor,
          ),
        ];
      } else {
        return [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.basketShopping,
                  color: activeTextColor,
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: Icon(
                  FontAwesomeIcons.bars,
                  color: activeTextColor,
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
            child: SizedBox(
              height: 25.0,
              child: Image.asset(
                AssetItems.titleOnlyLogo,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          ...menuBarWithCart(),
        ],
      ),
    );
  }
}
