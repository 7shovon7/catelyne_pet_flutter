import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitleWithButton extends StatelessWidget {
  const SectionTitleWithButton({
    super.key,
    required this.title,
    required this.buttonText,
    this.onPressed,
    required this.displayWidth,
  });

  final String title;
  final String buttonText;
  final double displayWidth;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool screenShouldShrink =
        displayWidth <= UiConstants.smallDisplayMaxWidth;
    List<Widget> children = [
      Text(
        title,
        textAlign: TextAlign.left,
        style: GoogleFonts.ibmPlexSerif(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      if (screenShouldShrink) const SizedBox(height: 10.0),
      OutlinedButton(
        style: WidgetConstants.defaultOutlineButtonStyle,
        onPressed: onPressed,
        child: Padding(
          padding: WidgetConstants.defaultButtonPadding,
          child: Text(buttonText.toUpperCase()),
        ),
      ),
    ];
    return Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: screenShouldShrink
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: children,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: children,
                ),
        ),
      ],
    );
  }
}
