import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class AddReply extends StatefulHookConsumerWidget {
  AddReply({super.key, required this.tweet});
  Tweet? tweet;
  @override
  ConsumerState<AddReply> createState() => _AddReplyState();
}

class _AddReplyState extends ConsumerState<AddReply> {
  File? _tweetImage;
  final ImagePicker _imagePicker = ImagePicker();
  int varWidget = 0;
  Future<void> _uploadTweetImage() async {
    try {
      final pickedImage =
          await _imagePicker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        setState(
          () {
            _tweetImage = File(pickedImage.path);
          },
        );
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final tweetProvider = ref.watch(tweetNotifierProvider);
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
          ref.read(tweetNotifierProvider.notifier).addReply(
                tweetId: widget.tweet!.id!,
                replyText: replyText,
                replierUser: userProvider.user!,
              );
        },
        decoration: InputDecoration(
          hintText: 'Post your reply',
          hintStyle: AppTextStyle.textThemeDark.bodyLarge,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.blue,
            ),
            onPressed: _uploadTweetImage,
          ),
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
          onSubmitted: (replyText) {
            ref.read(tweetNotifierProvider.notifier).addReply(
                  tweetId: widget.tweet!.id!,
                  replyText: replyText,
                  replierUser: userProvider.user!,
                );
          },
          decoration: InputDecoration(
            hintText: 'Post your reply',
            hintStyle: AppTextStyle.textThemeDark.bodyLarge,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.blue,
              ),
              onPressed: _uploadTweetImage,
            ),
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
            ],
          ),
        ),
      ],
    );
    return varWidget == 0 ? activeWidget : clickedWidget;
  }
}
