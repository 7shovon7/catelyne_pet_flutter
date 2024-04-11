import 'package:catelyne_pet_flutter/ui/common/widgets/widget_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitleWithButton extends StatelessWidget {
  const SectionTitleWithButton({
    super.key,
    required this.title,
    required this.buttonText,
    this.onPressed,
  });

  final String title;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: GoogleFonts.ibmPlexSerif(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton(
                style: WidgetConstants.defaultOutlineButtonStyle,
                onPressed: onPressed,
                child: Padding(
                  padding: WidgetConstants.defaultButtonPadding,
                  child: Text(buttonText.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
