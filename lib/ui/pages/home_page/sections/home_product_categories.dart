import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> homePageProductCategoriesSectionWidgets(BuildContext context) {
  Widget categoryCard({
    required IconData iconData,
    required String title,
  }) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60.0,
          horizontal: 10.0,
        ),
        child: Material(
          color: UiConstants.white,
          elevation: UiConstants.generalCardElevation,
          child: InkWell(
            hoverColor: UiConstants.accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 66.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    iconData,
                    size: 82.0,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  return [
    const SizedBox(
      height: 30.0,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        'Categories',
        textAlign: TextAlign.center,
        style: GoogleFonts.ibmPlexSerif(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor, incididunt ut labore et dolore magna.',
      textAlign: TextAlign.center,
    ),
    Row(
      children: [
        categoryCard(
          iconData: FontAwesomeIcons.bone,
          title: 'Food',
        ),
        categoryCard(
          iconData: FontAwesomeIcons.couch,
          title: 'Beds',
        ),
        categoryCard(
          iconData: FontAwesomeIcons.babyCarriage,
          title: 'Carriers',
        ),
        categoryCard(
          iconData: FontAwesomeIcons.volleyball,
          title: 'Toys',
        ),
      ],
    ),
  ];
}
