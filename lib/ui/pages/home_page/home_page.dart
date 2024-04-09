import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/cs_scaffold.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:measured_size/measured_size.dart';

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
  Widget offerBannerMainContent = Container();
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Get device width
    double deviceWidth = context.width;
    double bannerSubsectionWidth =
        deviceWidth >= UiConstants.largeDisplayMinWidth
            ? deviceWidth / 2 - UiConstants.generalDisplayHorizontalPadding * 2
            : deviceWidth - UiConstants.generalDisplayHorizontalPadding * 2;
    bool rowShouldBreak = deviceWidth < UiConstants.largeDisplayMinWidth;

    if (deviceWidth >= UiConstants.largeDisplayMinWidth) {
      bannerMainContent = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bannerSubsections(
          contentSpacingInBanner,
          bannerSubsectionWidth,
          rowShouldBreak,
        ),
      );
      offerBannerMainContent = Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        width: deviceWidth - UiConstants.generalDisplayHorizontalPadding * 2,
        color: UiConstants.accentColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: offerMessageBannerWidgets,
        ),
      );
    } else {
      bannerMainContent = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bannerSubsections(
          contentSpacingInBanner,
          bannerSubsectionWidth,
          rowShouldBreak,
        ),
      );
      offerBannerMainContent = Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: UiConstants.generalDisplayHorizontalPadding,
        ),
        width: double.infinity,
        color: UiConstants.accentColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: offerMessageBannerWidgets,
        ),
      );
    }
    return CsScaffold(
      additionalBgHeight: offerBannerHeight / 2.0,
      foregroundWidgets: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60,
          ),
          child: bannerMainContent,
        ),
      ],
      mainWidgets: [
        MeasuredSize(
          onChange: (p0) {
            setState(() {
              offerBannerHeight = p0.height;
            });
          },
          child: offerBannerMainContent,
        ),
      ],
    );
  }

  final SizedBox contentSpacingInBanner = const SizedBox(
    height: 26,
  );

  List<Widget> offerMessageBannerWidgets = [
    const Flexible(
      flex: 1,
      child: Icon(
        Icons.pets,
        size: 46,
        color: UiConstants.white,
      ),
    ),
    const Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 40.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Receive 20% OFF your first order of our self-made pet food!',
              maxLines: 5,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: UiConstants.white,
              ),
            ),
            Text(
              'In consequat, quam id sodales hendrerit, eros mi lacinia risus neque.',
              maxLines: 5,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: UiConstants.white,
              ),
            ),
          ],
        ),
      ),
    ),
    Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton(
          style: WidgetConstants.defaultReverseButtonStyle,
          onPressed: () {},
          child: const Padding(
            padding: WidgetConstants.defaultButtonPadding,
            child: Text('WOOF WOOF'),
          ),
        ),
      ),
    ),
  ];

  List<Widget> bannerSubsections(SizedBox contentSpacingInBanner,
          double bannerSubsectionWidth, bool rowShouldBreak) =>
      [
        SizedBox(
          width: bannerSubsectionWidth,
          child: Column(
            crossAxisAlignment: rowShouldBreak
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
                textAlign: rowShouldBreak ? TextAlign.center : TextAlign.left,
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
                textAlign: rowShouldBreak ? TextAlign.center : TextAlign.left,
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
}
