import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/features/home/ui/widget/rounded_button.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class AddTweetScreen extends StatefulWidget {
  const AddTweetScreen({super.key});

  @override
  State<AddTweetScreen> createState() => _AddTweetScreenState();
}

class _AddTweetScreenState extends State<AddTweetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pureBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 30,
            color: AppColors.whiteColor,
          ),
        ),
        actions: [RoundedButton(onTap: () {}, label: 'Post')],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    //backgroundImage: Todo: UserImage,
                    radius: 20,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                Expanded(
                  child: TextField(
                    style: AppTextStyle.textThemeDark.bodyText1!
                        .copyWith(fontSize: 22),
                    decoration: InputDecoration(
                      hintText: "What's happening?",
                      hintStyle: AppTextStyle.textThemeDark.headline6!
                          .copyWith(color: AppColors.lightThinTextGray),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              InkWell(
                onTap: () {
                  //Todo: Open List
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.lightThinTextGray,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: GestureDetector(
                          //onTap: onPickImages,
                          child: SvgPicture.asset(
                            AppAssets.earthIcon,
                            height: 15,
                            width: 15,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'Everyone can reply',
                          style: AppTextStyle.textThemeDark.subtitle1!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.lightThinTextGray,
                      width: 0.3,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: GestureDetector(
                        //onTap: onPickImages,
                        child: SvgPicture.asset(
                          AppAssets.galleryIcon,
                          height: 25,
                          width: 25,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppAssets.gifIcon,
                          height: 30,
                          width: 30,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppAssets.listIcon,
                          height: 23,
                          width: 23,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          AppAssets.locationIcon,
                          height: 27,
                          width: 27,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
