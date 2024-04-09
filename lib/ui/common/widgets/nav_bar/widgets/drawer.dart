import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CSDrawer extends StatelessWidget {
  const CSDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget drawerButton({
      required VoidCallback onPressed,
      required String title,
    }) {
      return TextButton(
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: UiConstants.white,
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
          drawerButton(
            onPressed: () {},
            title: 'Home',
          ),
          drawerButton(
            onPressed: () {},
            title: 'Products',
          ),
          drawerButton(
            onPressed: () {},
            title: 'About Us',
          ),
          drawerButton(
            onPressed: () {},
            title: 'Blog',
          ),
          drawerButton(
            onPressed: () {},
            title: 'Contact',
          ),
        ],
      ),
    );
  }
}
