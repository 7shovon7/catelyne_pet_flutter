import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/pages/home_page/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:get/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = context.width;
    double bannerSubsectionWidth = deviceWidth / 2;
    // double screenWidthLarge = 860;
    // double screenWidthMedium = 600;
    const contentSpacingInBanner = SizedBox(
      height: 26,
    );
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                color: UiConstants.primaryColor,
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.1,
                  child: SvgPicture.asset(
                    'assets/images/paw-pattern-2.svg',
                    fit: BoxFit.cover,
                    // height: 500,
                    // width: double.infinity,
                  ),
                ),
              ),
              const CSNavBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: bannerSubsectionWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ibmPlexSerif(
                              fontSize: 54,
                              height: 1.1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          contentSpacingInBanner,
                          const Text(
                            'In consequat, quam id sodales hendrerit, eros mi lacinia risus neque tristique augueproin tempus urna congue. elementum.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
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
                      child: Image.asset('assets/images/cat-in-banner.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
