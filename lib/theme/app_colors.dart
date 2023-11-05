import 'package:flutter/material.dart';

class AppColors {
  //TODO Define your colors here
  const AppColors();

  //you can used also color without define ColorHex
  //may add 0xFF + hexa code of color like
  static const Color primaryColor = Color(0xFF1DA1F2);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color darkGray = Color(0xFF657786);
  static const Color lightGray = Color(0xFFAAB8C2);
  static const Color extraLightGray = Color(0xFFE1E8ED);
  static const Color extraExtraLightGray = Color(0xFFF5F8FA);
  static const Color borderDarkGray = Color(0xFF2F3336);
  static const Color lightThinTextGray = Color(0xFF71767B);
  static const Color pureBlack = Color(0xFF000000);
  static const Color blackColor = Color(0xFF14171A);
  static const Color warningColor = Color(0xFFF4212E);

}

class ColorHex extends Color {
  ColorHex(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
