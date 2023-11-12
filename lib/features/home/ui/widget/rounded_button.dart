import 'package:flutter/material.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;

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
