import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final Color? backgroundColor;
  final Color? color;

  const ProgressBar({super.key, this.backgroundColor, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: backgroundColor ?? Colors.white,
      strokeWidth: 1,
      valueColor:
          AlwaysStoppedAnimation<Color>(color ?? AppColors.primaryColor),
    );
  }
}
