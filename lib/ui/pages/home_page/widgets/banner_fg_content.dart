import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBannerForegroundContent extends StatelessWidget {
  const HomeBannerForegroundContent({
    super.key,
    required this.screenShouldShrink,
    required this.deviceWidth,
  });

  final bool screenShouldShrink;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    double bannerSubsectionWidth = screenShouldShrink
        ? deviceWidth - UiConstants.generalDisplayHorizontalPadding * 2
        : deviceWidth / 2 - UiConstants.generalDisplayHorizontalPadding * 2;

    const SizedBox contentSpacingInBanner = SizedBox(
      height: 26,
    );

    List<Widget> bannerSubsections = [
      SizedBox(
        width: bannerSubsectionWidth,
        child: Column(
          crossAxisAlignment: screenShouldShrink
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'WE HAVE THE BEST PRODUCTS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            contentSpacingInBanner,
            Text(
              'Your Pet\'s\nFavourite Place',
              textAlign: screenShouldShrink ? TextAlign.center : TextAlign.left,
              style: GoogleFonts.ibmPlexSerif(
                fontSize: 54,
                height: 1.1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentSpacingInBanner,
            Text(
              'In consequat, quam id sodales hendrerit, eros mi lacinia risus neque tristique augueproin tempus urna congue. elementum.',
              textAlign: screenShouldShrink ? TextAlign.center : TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            contentSpacingInBanner,
            ElevatedButton(
              onPressed: () {},
              style: WidgetConstants.defaultButtonStyle,
              child: const Padding(
                padding: WidgetConstants.defaultButtonPadding,
                child: Text("Explore Now"),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: bannerSubsectionWidth,
        child: Image.asset(
          'assets/images/cat-in-banner.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
      ),
      child: screenShouldShrink
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: bannerSubsections,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: bannerSubsections,
            ),
    );
  }
}
