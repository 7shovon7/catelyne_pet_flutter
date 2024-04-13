import 'package:catelyne_pet_flutter/core/assets.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsLetterSectionInHomePage extends StatelessWidget {
  const NewsLetterSectionInHomePage({
    super.key,
    required this.screenShouldShrink,
  });

  final bool screenShouldShrink;

  @override
  Widget build(BuildContext context) {
    final Widget rowForLargerScreen = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
          flex: 10,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: UiConstants.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 5,
          child: ElevatedButton(
            style: WidgetConstants.defaultButtonStyle,
            onPressed: () {},
            child: const Padding(
              padding: WidgetConstants.defaultButtonPadding,
              child: Text('Subscribe'),
            ),
          ),
        ),
        Expanded(
          flex: 16,
          child: Container(),
        ),
      ],
    );

    final Widget columnForSmallerScreen = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: UiConstants.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          style: WidgetConstants.defaultButtonStyle,
          onPressed: () {},
          child: const Padding(
            padding: WidgetConstants.defaultButtonPadding,
            child: Text('Subscribe'),
          ),
        ),
      ],
    );
    final Widget onlyNewsLetter = Column(
      children: [
        if (!screenShouldShrink)
          const SizedBox(
            height: 130,
          ), // for creating an extra space for the image
        Container(
          padding: EdgeInsets.only(
            left: screenShouldShrink ? 20.0 : 60.0,
            right: screenShouldShrink ? 20.0 : 60.0,
            top: 60.0,
            bottom: 60.0,
          ),
          // width: screenShouldShrink ? double.infinity : null,
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Column(
            crossAxisAlignment: screenShouldShrink
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                'Newsletter Updates',
                style: GoogleFonts.ibmPlexSerif(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Enter your email address below to subscribe to our newsletter.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              screenShouldShrink ? columnForSmallerScreen : rowForLargerScreen,
              const SizedBox(
                height: 20.0,
              ),
              const Text('Your privacy is our policy.'),
            ],
          ),
        ),
      ],
    );
    return screenShouldShrink
        ? Column(
            children: [
              const SizedBox(height: 50.0),
              onlyNewsLetter,
            ],
          )
        : Stack(
            children: [
              onlyNewsLetter,
              Positioned(
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    height: 370,
                    child: Image.asset(
                      AssetItems.newsLetterDogImg,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
