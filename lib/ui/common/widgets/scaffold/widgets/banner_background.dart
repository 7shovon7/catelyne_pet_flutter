import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerBackground extends StatelessWidget {
  const BannerBackground({
    super.key,
    required this.height,
    // required this.offerBannerHeight,
  });

  final double height;
  // final double offerBannerHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height,
          color: UiConstants.primaryColor,
        ),
        SizedBox(
          height: height,
          width: double.infinity,
          child: Opacity(
            opacity: 0.1,
            child: SvgPicture.asset(
              'assets/images/paw-pattern-2.svg',
              fit: BoxFit.cover,
              // height: height,
              // width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
