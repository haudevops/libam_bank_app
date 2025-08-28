import 'package:flutter/material.dart';

class ResponsiveCore {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleWidth;
  static late double scaleHeight;
  static late double textScale;

  /// Base UI (ví dụ: thiết kế gốc 375x812 của iPhone X)
  static const double baseWidth = 375;
  static const double baseHeight = 812;

  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    scaleWidth = screenWidth / baseWidth;
    scaleHeight = screenHeight / baseHeight;

    textScale = scaleWidth; // scale theo width
  }

  static double w(double width) => width * scaleWidth;
  static double h(double height) => height * scaleHeight;
  static double sp(double fontSize) => fontSize * textScale;
}
