import 'package:flutter/material.dart';
import 'package:x_clone/theme/app_colors.dart';

/// Enum representing the size of the custom text.
enum CustomTextSize { small, medium, large }

/// A custom text widget that allows customization of the text size and color.
class CustomText extends StatelessWidget {
  final String text;
  final CustomTextSize textSize;
  final Color color;

  /// Constructs a [CustomText] widget.
  ///
  /// The [text] parameter is required and specifies the text to be displayed.
  /// The [textSize] parameter is optional and defaults to [CustomTextSize.medium].
  /// The [color] parameter is optional and defaults to [AppColors.whiteColor].
  const CustomText(
    this.text, {
    Key? key,
    this.textSize = CustomTextSize.medium,
    this.color = AppColors.whiteColor,
  }) : super(key: key);

  /// Returns the font weight based on the [textSize].
  FontWeight _getFontWeight() {
    return textSize == CustomTextSize.large ? FontWeight.w800 : FontWeight.w400;
  }

  /// Returns the font size based on the [textSize].
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
