import 'package:flutter/material.dart';

class ColorsTheme {
  static const Color deepBlue = Color(0xFF0A1D8D);
  static const Color black = Color(0xFF030303);
  static const Color white = Color(0xFFFFFFFF);

  static Color getBackgroundColor(bool isLightTheme) {
    return isLightTheme ? white : black;
  }

  static Color getTextColor(bool isLightTheme) {
    return isLightTheme ? black : white;
  }
}