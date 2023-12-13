import 'package:flutter/material.dart';
import 'package:x_clone/theme/app_colors.dart';


class AppTextStyle {
  static const String fontName = 'Roboto';

  static TextTheme textThemeDark = const TextTheme(
    headline1: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 105,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 66,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: TextStyle(
        color: AppColors.whiteColor,fontFamily: fontName,
        fontSize: 52, fontWeight: FontWeight.w400),
    headline4: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 37,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: TextStyle(
        color: AppColors.whiteColor,fontFamily: fontName,
        fontSize: 25, fontWeight: FontWeight.w400),
    headline6: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: TextStyle(
        fontFamily: fontName,
        color: AppColors.whiteColor,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );
}
