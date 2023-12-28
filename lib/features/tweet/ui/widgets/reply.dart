import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';
import 'package:x_clone/utils/utils.dart';

import '../../../../theme/app_assets.dart';

/// A widget that represents a reply to a tweet.
///
/// The [Reply] widget displays information about the replier, such as their profile picture, screen name, and username.
/// It also provides the functionality to delete the reply if the replier is the authenticated user.
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
  /// Opens a bottom sheet to confirm the deletion of the reply.
  ///
  /// This method is called when the replier is the authenticated user and they tap on the delete reply option.
  /// It shows a modal bottom sheet with a delete button, and upon tapping the button, it deletes the reply from the tweet and the user's profile.
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
    String screenName = widget.replier.screenName!;
    String username = widget.replier.username!;

    // String truncatedText = ((screenName.length + username.length) > 20)
    //     ? screenName.length > 20
    //         ? '${screenName.substring(0, 20)}'
    //         : screenName
    //     : screenName;

    // String truncatedText2 = ((screenName.length + username.length) > 20)
    //     ? 20 - truncatedText.length == 0
    //         ? ""
    //         : '@${username.substring(0, 20 - truncatedText.length)}..'
    //     : username;
    // String truncatedText3 = (truncatedText.length < screenName.length)
    //     ? '${truncatedText}...'
    //     : truncatedText;
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
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageUrl: widget.replier.imageUrl ??
                        'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                    placeholder: (context, url) => Container(
                      color: Color(0xFF333639),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.whiteLogo, fit: BoxFit.cover),
                  ),
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
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 0.5 * MediaQuery.of(context).size.width,
                        ),
                        child: Text(
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
                      ),
                      SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 0.3 * MediaQuery.of(context).size.width,
                        ),
                        child: Text(
                          widget.replier.username!,
                          style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                            color: AppColors.lightThinTextGray,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines:
                              1, // Set the maximum number of lines before truncating
                        ),
                      ),
                      SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                      Text(
                        "• ${getFormattedDateDifference(widget.replier.createdAt)}",
                        style: TextStyle(color: AppColors.lightThinTextGray),
                      ),
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
