import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/child_size_provider.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/nav_bar/widgets/drawer.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/banner_background.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/nav_bar/nav_bar.dart';
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
  Widget bannerMainContent = Container();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Get device width
    double deviceWidth = context.width;
    double bannerSubsectionWidth =
        deviceWidth >= UiConstants.largeDisplayMinWidth
            ? deviceWidth / 2 - UiConstants.generalDisplayHorizontalPadding * 2
            : deviceWidth - UiConstants.generalDisplayHorizontalPadding * 2;
    bool rowShouldBreak = deviceWidth < UiConstants.largeDisplayMinWidth;
    const contentSpacingInBanner = SizedBox(
      height: 26,
    );
    List<Widget> bannerSubsections = [
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
              style: ElevatedButton.styleFrom(
                backgroundColor: UiConstants.accentColor,
                foregroundColor: UiConstants.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
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

    if (deviceWidth >= UiConstants.largeDisplayMinWidth) {
      bannerMainContent = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bannerSubsections,
      );
    } else {
      bannerMainContent = Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bannerSubsections,
      );
    }
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CSDrawer(),
      body: ListView(
        children: [
          // Banner section
          Stack(
            children: [
              BannerBackground(
                height: childSize.height,
                // height: 1000,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConstants.generalDisplayHorizontalPadding,
                ),
                child: SizeProviderWidget(
                  onChildSize: (p0) {
                    setState(() {
                      childSize = p0;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CSNavBar(),
                      // Banner main content
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 60,
                        ),
                        child: bannerMainContent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Column(
            children: [
              // Rest of the page
              Text('Rest of the page'),
              // Rest of the page
              Text('Rest of the page'),
            ],
          )
        ],
      ),
    );
  }
}
