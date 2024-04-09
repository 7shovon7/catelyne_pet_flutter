import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';

abstract class WidgetConstants {
  static const EdgeInsets defaultButtonPadding = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 12,
  );

  static final defaultBoxShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  );

  static final ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UiConstants.accentColor,
    foregroundColor: UiConstants.white,
    elevation: 0,
    shape: defaultBoxShape,
  );

  static final ButtonStyle defaultReverseButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: UiConstants.white,
    foregroundColor: UiConstants.accentColor,
    elevation: 0,
    shape: defaultBoxShape,
  );
}
