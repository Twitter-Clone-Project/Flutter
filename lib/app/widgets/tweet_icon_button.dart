import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone/theme/app_colors.dart';

class TweetIconButton extends StatelessWidget {
  final String pathName;
  final String text;
  final VoidCallback onTap;
  const TweetIconButton({
    Key? key,
    required this.pathName,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            pathName,
            color: AppColors.lightThinTextGray,
          ),
          Container(
            margin: const EdgeInsets.all(1),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.lightThinTextGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}