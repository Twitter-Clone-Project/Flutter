import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/theme/app_colors.dart';

/// A custom button widget that can be used to create buttons with different styles and functionalities.
class CustomButton extends StatelessWidget {
  final String text;
  final bool filled;
  final String? svgIcon;
  final VoidCallback? onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool red;
  final bool disabled;

  /// Creates a custom button.
  ///
  /// The [text] parameter is required and specifies the text to be displayed on the button.
  ///
  /// The [filled] parameter determines whether the button should be filled with a background color or transparent.
  ///
  /// The [svgIcon] parameter is an optional SVG icon path that can be displayed alongside the text on the button.
  ///
  /// The [horizontalPadding] and [verticalPadding] parameters can be used to adjust the padding around the button's content.
  ///
  /// The [red] parameter determines whether the button should have a red color scheme.
  ///
  /// The [disabled] parameter determines whether the button should be disabled.
  ///
  /// The [onPressed] parameter is a callback function that will be called when the button is pressed.
  const CustomButton({
    super.key,
    required this.text,
    this.filled = true,
    this.svgIcon,
    this.horizontalPadding,
    this.verticalPadding,
    this.red = false,
    this.disabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = filled ? AppColors.whiteColor : Colors.transparent;
    Color textColor = filled ? AppColors.pureBlack : AppColors.whiteColor;
    Color borderColor = filled ? Colors.transparent : AppColors.borderDarkGray;

    textColor = red ? AppColors.warningColor : textColor;
    borderColor = red ? AppColors.warningColor : borderColor;

    textColor = disabled ? AppColors.lightThinTextGray : textColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: buttonColor,
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 6.0,
                horizontal: horizontalPadding ?? 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (svgIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      svgIcon!, // Use the SVG icon path
                      width: 24,
                      height: 24,
                    ),
                  ),
                Text(
                  text,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor,
                    fontFamily:
                        'Chirp', // Use the font family name specified in pubspec.yaml
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
