import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_clone/theme/palette.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool filled;
  final String? imageAsset;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.filled = true,
    this.imageAsset,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = filled ? Palette.backgroundColor : Colors.transparent;
    Color textColor = filled ? Palette.whiteColor : Palette.backgroundColor;
    Color borderColor = filled ? Colors.transparent : Palette.greyColor;
    final assetPath = imageAsset ?? "assets/default_image.png";

    return Container(
      //width: width,
      //height: height,
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
                if (imageAsset != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      assetPath,
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
