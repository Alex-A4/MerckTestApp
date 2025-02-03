import 'package:flutter/widgets.dart';

class Sizes {
  Sizes._();

  static const double bottomSpace = 8.0;
  static const double sideSpace = 16.0;
  static const double verticalSpace = 8.0;

  static const EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: sideSpace);
  static const EdgeInsets topPadding = EdgeInsets.only(top: verticalSpace);
  static const EdgeInsets bottomPaddingWithKeyboard = EdgeInsets.only(bottom: bottomSpace);

  static EdgeInsets paddingScreen = topPadding + sidePadding;
  static EdgeInsets paddingForScreenWithKeyboard = topPadding + sidePadding + bottomPaddingWithKeyboard;

  static const double defaultBorderRadiusValue = 8.0;
  static BorderRadius defaultBorderRadius = BorderRadius.circular(defaultBorderRadiusValue);
}
