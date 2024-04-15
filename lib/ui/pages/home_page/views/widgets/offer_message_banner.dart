import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';

class HomepageOfferMessageBanner extends StatelessWidget {
  const HomepageOfferMessageBanner({
    super.key,
    required this.onChange,
    required this.screenShouldShrink,
  });

  final void Function(Size) onChange;
  final bool screenShouldShrink;

  @override
  Widget build(BuildContext context) {
    List<Widget> offerMessageBannerWidgets = [
      const Flexible(
        flex: 2,
        child: Icon(
          Icons.pets,
          size: 46,
          color: UiConstants.white,
        ),
      ),
      const Flexible(
        flex: 7,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 40.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Get 10% OFF on your first order!',
                maxLines: 5,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: UiConstants.white,
                ),
              ),
              Text(
                'Free delivery all over Dhaka!',
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
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            style: WidgetConstants.defaultReverseButtonStyle,
            onPressed: () {},
            child: const Padding(
              padding: WidgetConstants.defaultButtonPadding,
              child: Text('Meow Meow'),
            ),
          ),
        ),
      ),
    ];
    return MeasuredSize(
      onChange: onChange,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.generalDisplayHorizontalPadding,
          vertical: 20.0,
        ),
        width: double.infinity,
        color: UiConstants.accentColor,
        child: screenShouldShrink
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: offerMessageBannerWidgets,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: offerMessageBannerWidgets,
              ),
      ),
    );
  }
}
