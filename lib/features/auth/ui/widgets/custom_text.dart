import 'package:flutter/material.dart';
import 'package:x_clone/theme/app_colors.dart';

enum CustomTextSize { small, medium, large }

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextSize textSize;
  final Color color;

  const CustomText(
    this.text, {
    Key? key,
    this.textSize = CustomTextSize.medium,
    this.color = AppColors.whiteColor,
  }) : super(key: key);

  FontWeight _getFontWeight() {
    return textSize == CustomTextSize.large ? FontWeight.w800 : FontWeight.w400;
  }

  double _getFontSize() {
    switch (textSize) {
      case CustomTextSize.small:
        return 12.0;
      case CustomTextSize.medium:
        return 14.0;
      case CustomTextSize.large:
        return 32.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: _getFontSize(),
        fontWeight: _getFontWeight(),
        color: color,
      ),
    );
  }
}
