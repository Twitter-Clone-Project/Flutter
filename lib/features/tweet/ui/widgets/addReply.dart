import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class AddReply extends StatefulHookConsumerWidget {
  final Tweet tweet;
  final int index;

  AddReply({Key? key, required this.tweet, required this.index})
      : super(key: key) {}
  @override
  ConsumerState<AddReply> createState() => _AddReplyState();
}

class _AddReplyState extends ConsumerState<AddReply> {
  int varWidget = 0;
  TextEditingController _replyController = TextEditingController();
  bool isButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(authNotifierProvider);
    Widget activeWidget = Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onTap: () {
          setState(() {
            varWidget = 1;
          });
        },
        onSubmitted: (replyText) {
          ref.read(homeNotifierProvider.notifier).addReply(
                tweetId: widget.tweet.id!,
                replyText: replyText,
                replierUser: userProvider.user!,
                index: widget.index,
              );
        },
        decoration: InputDecoration(
          hintText: 'Post your reply',
          hintStyle: AppTextStyle.textThemeDark.bodyLarge,
        ),
      ),
    );

    Widget clickedWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyle.textThemeDark.bodyLarge,
            children: [
              TextSpan(
                text: 'Replying to @',
                style: AppTextStyle.textThemeDark.bodyLarge!
                    .copyWith(color: AppColors.lightThinTextGray),
              ),
              TextSpan(
                text: '${widget.tweet!.user!.screenName}',
                style: AppTextStyle.textThemeDark.bodyLarge!
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
        TextField(
          controller: _replyController,
          onChanged: (text) {
            setState(() {
              isButtonEnabled = text.isNotEmpty;
            });
          },
          decoration: InputDecoration(
            hintText: 'Post your reply',
            hintStyle: AppTextStyle.textThemeDark.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: GestureDetector(
                  // onTap: onPickImages,
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 15),
                child: TextButton(
                  onPressed: isButtonEnabled
                      ? () {
                          ref.read(homeNotifierProvider.notifier).addReply(
                                tweetId: widget.tweet.id!,
                                replyText: _replyController.text,
                                replierUser: userProvider.user!,
                                index: widget.index,
                              );
                          _replyController.text = '';
                          varWidget = 0;
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.whiteColor),
                  ),
                  child: Text(
                    'Reply',
                    style: AppTextStyle.textThemeDark.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return varWidget == 0 ? activeWidget : clickedWidget;
  }
}