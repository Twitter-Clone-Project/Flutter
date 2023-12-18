import 'package:flutter/material.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class Reply extends StatelessWidget {
  Reply({
    super.key,
    required this.replier,
    required this.whom,
  });
  final ReplierData replier;
  final int whom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.profileScreen,
                      arguments: replier.username);
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  backgroundImage: NetworkImage(replier.profileImageURL ?? ''),
                  radius: 20,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      Text(
                        replier.username!,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      // Text(
                      //   '@${replier.handle}',
                      //   style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                      //     color: AppColors.lightThinTextGray,
                      //   ),
                      // ),
                      // SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      //Date
                      // Text(
                      //   'date',
                      //   style: const TextStyle(color: AppColors.lightGray),
                      // )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02),
                    child: Text(
                      replier.replyText!,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 0.018 * MediaQuery.of(context).size.width),
            const Divider(
              height: 1.0,
              color: AppColors.blackColor,
            )
          ],
        ),
        const Divider(
          color: AppColors.lightThinTextGray,
          thickness: 0.3,
        )
      ],
    );
  }
}
