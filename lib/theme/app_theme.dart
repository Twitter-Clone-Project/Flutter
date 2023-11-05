import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.pureBlack,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.blackColor,
    textTheme: AppTextStyle.textThemeDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackColor,
      titleTextStyle: TextStyle(color: AppColors.whiteColor,fontFamily: AppTextStyle.fontName),
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      actionsIconTheme: IconThemeData(color: AppColors.primaryColor),

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.pureBlack,
      elevation: 4,
      selectedIconTheme: IconThemeData(size: 28),
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed
    )
  );
}
