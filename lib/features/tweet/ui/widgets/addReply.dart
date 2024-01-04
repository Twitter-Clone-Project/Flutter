import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

/// A widget that allows users to add a reply to a tweet.
///
/// This widget displays a text field where users can enter their reply to a tweet.
/// It also provides options for adding images, GIFs, lists, and locations to the reply.
/// The widget updates the UI based on user interactions and notifies the parent widget
/// when the reply is submitted.
class AddReply extends StatefulHookConsumerWidget {
  final Tweet tweet;
  final int index;
  final int whom;

  AddReply(
      {Key? key, required this.tweet, required this.index, required this.whom})
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
                text: '${widget.tweet.user?.username}',
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
              isButtonEnabled = text.trim().isNotEmpty;
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
              280 - _replyController.text.length > -10
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 15, right: 10),
                      child: CircularPercentIndicator(
                        radius: 15,
                        lineWidth: 3,
                        backgroundColor: const Color.fromARGB(255, 52, 58, 62),
                        progressColor: _replyController.text.length > 280
                            ? Colors.red
                            : 280 - _replyController.text.length <= 20
                                ? Colors.orange
                                : AppColors.primaryColor,
                        percent: _replyController.text.length < 281
                            ? _replyController.text.length / 280
                            : 1,
                        center: 280 - _replyController.text.length < 0
                            ? Text(
                                "${280 - _replyController.text.length}",
                                style: AppTextStyle.textThemeDark.bodyMedium!
                                    .copyWith(color: Colors.red),
                              )
                            : 280 - _replyController.text.length <= 20
                                ? Text(
                                    "${280 - _replyController.text.length}",
                                    style: AppTextStyle
                                        .textThemeDark.bodyMedium!
                                        .copyWith(
                                            color: AppColors.lightThinTextGray),
                                  )
                                : null,
                      ),
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 15, right: 12),
                      child: Text(
                        "${280 - _replyController.text.length}",
                        style: AppTextStyle.textThemeDark.bodyMedium!
                            .copyWith(color: Colors.red),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 15),
                child: TextButton(
                  onPressed: isButtonEnabled
                      ? () async {
                          String trimmedText = _replyController.text.trim();
                          if (trimmedText.isNotEmpty &&
                              _replyController.text.length < 280) {
                            final ReplierData? result = await ref
                                .read(homeNotifierProvider.notifier)
                                .addReply(
                                  tweetId: widget.tweet.id!,
                                  replyText: trimmedText,
                                  replierUser: userProvider.user!,
                                );
                            ref.read(profileNotifierProvider.notifier).addReply(
                                  tweetId: widget.tweet.id!,
                                  replyText: trimmedText,
                                  replierUser: userProvider.user!,
                                  replier: result!,
                                );
                            _replyController.text = '';
                            varWidget = 0;
                          }
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
