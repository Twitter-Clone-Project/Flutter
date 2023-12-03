import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool filled;
  final String? svgIcon;
  final VoidCallback? onPressed;
  final double? verticalPadding; 
  final double? horizontalPadding; 


  const CustomButton({
    super.key,
    required this.text,
    this.filled = true,
    this.svgIcon,
    this.horizontalPadding,
    this.verticalPadding, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = filled ? AppColors.whiteColor : Colors.transparent;
    Color textColor = filled ? AppColors.pureBlack : AppColors.whiteColor;
    Color borderColor = filled ? Colors.transparent : AppColors.borderDarkGray;

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
            padding:  EdgeInsets.symmetric(vertical: verticalPadding?? 8.0, horizontal:  horizontalPadding?? 8.0),
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
                    
                    fontWeight: FontWeight.w700,
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
