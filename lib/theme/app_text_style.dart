import 'package:flutter/material.dart';
import 'package:x_clone/theme/app_colors.dart';


/// A class that defines the text styles used in the application.
class AppTextStyle {
  static const String fontName = 'Roboto';

  /// The text theme for dark mode.
  static TextTheme textThemeDark = const TextTheme(
  /// The style for the largest headlines.
  headline1: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 105,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5),

  /// The style for the second largest headlines.
  headline2: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 66,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5),

  /// The style for the third largest headlines.
  headline3: TextStyle(
    color: AppColors.whiteColor,
    fontFamily: fontName,
    fontSize: 52,
    fontWeight: FontWeight.w400),

  /// The style for the fourth largest headlines.
  headline4: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 37,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25),

  /// The style for the fifth largest headlines.
  headline5: TextStyle(
    color: AppColors.whiteColor,
    fontFamily: fontName,
    fontSize: 25,
    fontWeight: FontWeight.w400),

  /// The style for the sixth largest headlines.
  headline6: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 21,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15),

  /// The style for the first-level subtitles.
  subtitle1: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15),

  /// The style for the second-level subtitles.
  subtitle2: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1),

  /// The style for the body text.
  bodyText1: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5),

  /// The style for the second-level body text.
  bodyText2: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25),

  /// The style for buttons.
  button: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25),

  /// The style for captions.
  caption: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4),

  /// The style for overlines.
  overline: TextStyle(
    fontFamily: fontName,
    color: AppColors.whiteColor,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5),
  );
}
