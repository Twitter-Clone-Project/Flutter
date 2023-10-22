import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    Color buttonColor = filled ? Colors.black : Colors.transparent;
    Color textColor = filled ? Colors.white : Colors.black;
    Color borderColor = filled ? Colors.transparent : Colors.black26;

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
                  style: GoogleFonts.roboto(
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
