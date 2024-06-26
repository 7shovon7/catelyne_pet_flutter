import 'package:catelyne_pet_flutter/core/assets.dart';
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
    final activeTextColor = Theme.of(context).colorScheme.onPrimary;
    double bannerSubsectionWidth = screenShouldShrink
        ? deviceWidth - UiConstants.generalDisplayHorizontalPadding * 2
        : deviceWidth / 2 - UiConstants.generalDisplayHorizontalPadding * 2;

    const SizedBox contentSpacingInBanner = SizedBox(
      height: 26,
    );
    const SizedBox contentSpacingInBannerSm = SizedBox(
      height: 14,
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
            Text(
              'Our shop is what your pet wants!',
              textAlign: screenShouldShrink ? TextAlign.center : TextAlign.left,
              style: GoogleFonts.ibmPlexSerif(
                fontSize: 54,
                height: 1.1,
                color: activeTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentSpacingInBanner,
            Text(
              '5% of your purchase goes to feeding stray animals',
              textAlign: screenShouldShrink ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: activeTextColor,
              ),
            ),
            contentSpacingInBannerSm,
            Text(
              'so what are you waiting for!!? Get quality product for your furry friend along with helping the poor souls.',
              textAlign: screenShouldShrink ? TextAlign.center : TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 14,
                color: activeTextColor,
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
      if (screenShouldShrink) const SizedBox(height: 30),
      SizedBox(
        width: bannerSubsectionWidth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: bannerSubsectionWidth / 1.3,
                height: bannerSubsectionWidth / 1.3,
                // height: bannerSubsectionWidth,
                decoration: BoxDecoration(
                  color: UiConstants.white.withOpacity(0.3),
                  borderRadius:
                      BorderRadius.circular(bannerSubsectionWidth / 2.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: bannerSubsectionWidth / 1.3,
                height: bannerSubsectionWidth / 1.3,
                child: Align(
                  child: Container(
                    width: bannerSubsectionWidth / 1.47,
                    height: bannerSubsectionWidth / 1.47,
                    // height: bannerSubsectionWidth,
                    decoration: BoxDecoration(
                      color: UiConstants.white.withOpacity(0.4),
                      borderRadius:
                          BorderRadius.circular(bannerSubsectionWidth / 2.0),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: bannerSubsectionWidth / 1.3,
                height: bannerSubsectionWidth / 1.3,
                child: Align(
                  child: Container(
                    width: bannerSubsectionWidth / 1.7,
                    height: bannerSubsectionWidth / 1.7,
                    // height: bannerSubsectionWidth,
                    decoration: BoxDecoration(
                      color: UiConstants.white,
                      borderRadius:
                          BorderRadius.circular(bannerSubsectionWidth / 2.0),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetItems.catInBannerImg,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
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
