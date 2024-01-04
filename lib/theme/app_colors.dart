import 'package:flutter/material.dart';

/// A class that defines the colors used in the application.
class AppColors {
  const AppColors();

  /// The primary color used in the application.
  static const Color primaryColor = Color(0xFF1DA1F2);

  /// The color white.
  static const Color whiteColor = Color(0xFFFFFFFF);

  /// A dark gray color.
  static const Color darkGray = Color(0xFF657786);

  /// A light gray color.
  static const Color lightGray = Color(0xFFAAB8C2);

  /// An extra light gray color.
  static const Color extraLightGray = Color(0xFFE1E8ED);

  /// An extra extra light gray color.
  static const Color extraExtraLightGray = Color(0xFFF5F8FA);

  /// A dark gray color used for borders.
  static const Color borderDarkGray = Color(0xFF2F3336);

  /// A light thin text gray color.
  static const Color lightThinTextGray = Color(0xFF71767B);

  /// The Twitter blue color.
  static const Color TwitterBlue = Color(0xFF1d96ef);

  /// The color black.
  static const Color pureBlack = Color(0xFF000000);

  /// A black color used for text and icons.
  static const Color blackColor = Color(0xFF14171A);

  /// A warning color.
  static const Color warningColor = Color(0xFFF4212E);
}

/// A class that represents a color defined by a hexadecimal value.
class ColorHex extends Color {
  /// Creates a [ColorHex] from a hexadecimal color value.
  ///
  /// The [hexColor] parameter should be a string representing a hexadecimal color value.
  /// It can be in the format "#RRGGBB" or "RRGGBB".
  /// If the [hexColor] parameter is in the format "RRGGBB", the alpha value is assumed to be FF.
  ColorHex(final String hexColor) : super(_getColorFromHex(hexColor));

  /// Converts a hexadecimal color value to an integer color value.
  ///
  /// The [hexColor] parameter should be a string representing a hexadecimal color value.
  /// It can be in the format "#RRGGBB" or "RRGGBB".
  /// If the [hexColor] parameter is in the format "RRGGBB", the alpha value is assumed to be FF.
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
