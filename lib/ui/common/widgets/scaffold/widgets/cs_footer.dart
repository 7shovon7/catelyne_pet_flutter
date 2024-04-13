import 'package:catelyne_pet_flutter/core/constants.dart';
import 'package:catelyne_pet_flutter/core/utils.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/widgets/banner_background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:measured_size/measured_size.dart';

class CsFooter extends StatefulWidget {
  const CsFooter({
    super.key,
    required this.contentWidth,
  });

  final double contentWidth;

  @override
  State<CsFooter> createState() => _CsFooterState();
}

class _CsFooterState extends State<CsFooter> {
  double sectionHeight = 0;

  // Future<void> _launchUrl
  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.ibmPlexSerif(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: UiConstants.white,
    );
    const bodyStyle = TextStyle(
      fontSize: 16.0,
      color: UiConstants.white,
    );

    Widget categoriesWidget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: titleStyle,
        ),
        const SizedBox(height: 10),
        const Text(
          'Beds (5)',
          style: bodyStyle,
        ),
        const Text(
          'Carriers (1)',
          style: bodyStyle,
        ),
        const Text(
          'Costumes (5)',
          style: bodyStyle,
        ),
        const Text(
          'Food (3)',
          style: bodyStyle,
        ),
        const Text(
          'Toys (3)',
          style: bodyStyle,
        ),
      ],
    );

    Widget contactsWidget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contacts',
          style: titleStyle,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => CoreUtils.makePhoneCall(CoreConstants.companyPhone),
          child: const Text(
            'Phone: ${CoreConstants.companyPhone}',
            style: bodyStyle,
          ),
        ),
        InkWell(
          onTap: () => CoreUtils.mail(CoreConstants.companyMail),
          child: const Text(
            'Email: ${CoreConstants.companyMail}',
            style: bodyStyle,
          ),
        ),
      ],
    );

    Widget openningHoursWidget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Opening Hours',
          style: titleStyle,
        ),
        const SizedBox(height: 10),
        const Text(
          'Mon-Fri: 10am - 8pm',
          style: bodyStyle,
        ),
        const Text(
          'Sat: 10am - 4pm',
          style: bodyStyle,
        ),
        const Text(
          'Sun: 10am - 6pm',
          style: bodyStyle,
        ),
      ],
    );

    const divider = Divider(
      height: 2,
      thickness: 0.2,
      color: UiConstants.offWhite,
    );

    Widget smIcon({required IconData iconData, required String url}) {
      return InkWell(
        onTap: () async => await CoreUtils.openUrl(url),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: UiConstants.offWhite,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Icon(
            iconData,
            color: UiConstants.white,
            size: 26.0,
          ),
        ),
      );
    }

    final socialMediaIcons = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          smIcon(
            iconData: FontAwesomeIcons.facebook,
            url: 'https://flutter.dev',
          ),
          smIcon(
            iconData: FontAwesomeIcons.instagram,
            url: 'https://flutter.dev',
          ),
          smIcon(
            iconData: FontAwesomeIcons.linkedin,
            url: 'https://flutter.dev',
          ),
        ],
      ),
    );

    final copyRightDisclaimer = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Text(
          'Copyright © ${DateTime.now().year} ${CoreConstants.companyName}',
          style: const TextStyle(
            color: UiConstants.white,
          ),
        ),
      ),
    );

    return Stack(
      children: [
        BannerBackground(height: sectionHeight),
        MeasuredSize(
          onChange: (size) {
            setState(() {
              sectionHeight = size.height;
            });
          },
          child: Center(
            child: SizedBox(
              width: widget.contentWidth -
                  UiConstants.generalDisplayHorizontalPadding * 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 70.0,
                  ),
                  widget.contentWidth > UiConstants.smallDisplayMaxWidth
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            categoriesWidget,
                            contactsWidget,
                            openningHoursWidget,
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            categoriesWidget,
                            const SizedBox(height: 40.0),
                            contactsWidget,
                            const SizedBox(height: 40.0),
                            openningHoursWidget,
                          ],
                        ),
                  const SizedBox(height: 40.0),
                  divider,
                  socialMediaIcons,
                  divider,
                  copyRightDisclaimer,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
