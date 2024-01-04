import 'package:flutter/material.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

/// A custom button widget with rounded corners.
///
/// This widget is used to create a rounded button with a specified label,
/// background color, and text color. It can be used in various UI scenarios
/// where a button with rounded corners is required.
class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

  /// Creates a rounded button.
  ///
  /// The [onTap] parameter is a callback function that will be called when
  /// the button is tapped.
  ///
  /// The [label] parameter is the text that will be displayed on the button.
  ///
  /// The [backgroundColor] parameter is the background color of the button.
  /// By default, it is set to [AppColors.primaryColor].
  ///
  /// The [textColor] parameter is the color of the text on the button.
  /// By default, it is set to [AppColors.whiteColor].
  const RoundedButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(label,
            style: AppTextStyle.textThemeDark.subtitle1!
                .copyWith(fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 1,
        ),
      ),
    );
  }
}
