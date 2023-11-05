import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool filled;
  final String? svgIcon;
  final VoidCallback? onPressed;


  const CustomButton({
    super.key,
    required this.text,
    this.filled = true,
    this.svgIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = filled ? AppColors.whiteColor  : Colors.transparent;
    Color textColor = filled ? AppColors.pureBlack : AppColors.whiteColor;
    Color borderColor = filled ? Colors.transparent : AppColors.borderDarkGray;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: buttonColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
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
            padding: const EdgeInsets.all(8.0),
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
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
