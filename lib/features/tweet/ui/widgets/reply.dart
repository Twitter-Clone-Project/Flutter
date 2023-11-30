import 'package:flutter/material.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';

class Reply extends StatelessWidget {
  Reply({
    super.key,
    this.text,
    this.userName,
    this.likesCount,
  });
  final String? text;
  final String? userName;
  //final String createdAt;
  int? likesCount;

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
                  // go to user profile
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  //backgroundImage: userImage?.image,
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
                      InkWell(
                        onTap: () {},
                        child: Text(
                          userName!,
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // if (verified)
                      //   SizedBox(
                      //     width: 0.02 * MediaQuery.of(context).size.height,
                      //     child: SvgPicture.asset(AppAssets.verifiedIcon),
                      //   ),
                      SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      //Handle
                      // Text(
                      //   'handle',
                      //   style: const TextStyle(color: AppColors.lightGray),
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
                      text!,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      children: [
                        TweetIconButton(
                          pathName: AppAssets.commentIcon,
                          text: '10',
                          onTap: () {},
                        ),
                        SizedBox(
                            width: 0.1 * MediaQuery.of(context).size.width),
                        TweetIconButton(
                          pathName: AppAssets.retweetIcon,
                          text: '10',
                          onTap: () {},
                        ),
                        SizedBox(
                            width: 0.1 * MediaQuery.of(context).size.width),
                        TweetIconButton(
                          pathName: AppAssets.likeOutlinedIcon,
                          text: likesCount.toString(),
                          onTap: () {},
                        ),
                        SizedBox(
                            width: 0.1 * MediaQuery.of(context).size.width),
                        TweetIconButton(
                            pathName: AppAssets.viewsIcon,
                            text: '1800',
                            onTap: () {})
                      ],
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
        Divider(
          color: AppColors.whiteColor,
          thickness: 0.1,
        )
      ],
    );
  }
}
