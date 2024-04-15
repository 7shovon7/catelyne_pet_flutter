import 'package:catelyne_pet_flutter/data/constants.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CSDrawer extends StatelessWidget {
  const CSDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget drawerButton({
      required VoidCallback onPressed,
      required String title,
      bool isActive = false,
    }) {
      return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              isActive ? UiConstants.accentColor.withOpacity(0.1) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      );
    }

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                FontAwesomeIcons.xmark,
                color: UiConstants.accentColor,
              ),
            ),
          ),
          ...DataConstants.menuItems.map(
            (e) => drawerButton(
              onPressed: () {},
              title: e,
              isActive: e == 'Home',
            ),
          ),
        ],
      ),
    );
  }
}
