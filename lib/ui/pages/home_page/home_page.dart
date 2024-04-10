import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/cs_scaffold.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/banner_fg_content.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/home_product_categories.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/offer_message_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size childSize = Size.zero;
  double offerBannerHeight = 0;
  double totalStackHeight = 0;
  Widget bannerMainContent = Container();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = context.width;
    bool screenShouldShrink = deviceWidth < UiConstants.largeDisplayMinWidth;

    return CsScaffold(
      additionalBgHeight: offerBannerHeight / 2.0,
      foregroundWidgets: [
        HomeBannerForegroundContent(
          screenShouldShrink: screenShouldShrink,
          deviceWidth: deviceWidth,
        ),
      ],
      mainWidgets: [
        HomepageOfferMessageBanner(
          screenShouldShrink: screenShouldShrink,
          onChange: (p0) {
            setState(() {
              offerBannerHeight = p0.height;
            });
          },
        ),
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
        const HomeProductCategories(),
      ],
    );
  }
}
