import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone/theme/app_colors.dart';

class TweetIconButton extends StatelessWidget {
  final String pathName;
  final String text;
  final VoidCallback onTap;
  final Color color;
  const TweetIconButton({
    Key? key,
    required this.pathName,
    this.text = '',
    required this.onTap,
    this.color = AppColors.lightThinTextGray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
      AnimatedSwitcher(
      duration: Duration(milliseconds: 500), // Set your desired animation duration
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: SvgPicture.asset(
        height: 20,
        width: 20,
        pathName,
              color: color,
            ),
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
