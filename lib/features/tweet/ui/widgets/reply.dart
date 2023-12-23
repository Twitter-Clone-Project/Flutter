import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class Reply extends StatefulHookConsumerWidget {
  Reply({
    super.key,
    required this.replier,
    required this.whom,
  });
  ReplierData replier;
  int whom;
  @override
  ConsumerState<Reply> createState() => _ReplyState();
}

class _ReplyState extends ConsumerState<Reply> {
  void _openBottomSheetForDeleteReply(BuildContext context) {
    if (widget.replier.replyUserId ==
        ref.read(authNotifierProvider).user!.userId) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: AppColors.pureBlack,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.lightThinTextGray,
                  ),
                  title: const Text('Delete Reply'),
                  onTap: () {
                    ref.watch(homeNotifierProvider.notifier).deleteReply(
                        tweetId: widget.replier.replyTweetId!,
                        replyId: widget.replier.replyId!);
                    ref.watch(profileNotifierProvider.notifier).deleteReply(
                        tweetId: widget.replier.replyTweetId!,
                        replyId: widget.replier.replyId!);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String screenName = widget.replier.username!;
    String truncatedText = (screenName.length > 20)
        ? '${screenName.substring(0, 20)}' // Truncate if it exceeds maxLength
        : screenName; // Use full text if it's within the limit
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
                      arguments: widget.replier.username);
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  backgroundImage:
                      NetworkImage(widget.replier.profileImageURL ?? ''),
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
                        widget.replier.screenName!,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines:
                            1, // Set the maximum number of lines before truncating
                      ),
                      SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      Text(
                        '@${truncatedText}',
                        style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                          color: AppColors.lightThinTextGray,
                        ),
                      ),
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
                      widget.replier.replyText!,
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
            InkWell(
              onTap: () {
                _openBottomSheetForDeleteReply(context);
              },
              child: const Icon(
                Icons.more_vert,
                size: 17,
                color: AppColors.lightThinTextGray,
              ),
            ),
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
