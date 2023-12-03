import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';

import '../../features/home/data/models/home_response.dart';
import '../../theme/app_assets.dart';
import '../../theme/app_colors.dart';

class TweetCompose extends StatefulHookConsumerWidget {
  final Tweet tweet;
  final int index;

  TweetCompose({
    Key? key,
    required this.tweet,
    required this.index,
  }) : super(key: key) {}

  @override
  ConsumerState<TweetCompose> createState() {
    return _TweetComposeState();
  }
}

class _TweetComposeState extends ConsumerState<TweetCompose> {
  late int likeCountBeforeMe;
  late int commentCountBeforeMe;
  late int retweetCountBeforeMe;
  late var likeIcon = AppAssets.likeOutlinedIcon;
  @override
  void initState() {
    super.initState();
    likeIcon = AppAssets.likeOutlinedIcon;
    likeCountBeforeMe = widget.tweet.likesCount ?? 0;
    commentCountBeforeMe = widget.tweet.repliesCount ?? 0;
    retweetCountBeforeMe = widget.tweet.retweetsCount ?? 0;
  }

  String formatCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 1000000) {
      double kValue = count / 1000.0;
      return kValue
              .toStringAsFixed(kValue.truncateToDouble() == kValue ? 0 : 1) +
          'k';
    } else {
      double millionValue = count / 1000000.0;
      return millionValue.toStringAsFixed(
              millionValue.truncateToDouble() == millionValue ? 0 : 1) +
          'M';
    }
  }

  void _showImageDialog(BuildContext context, Image image) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: image.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int? index = widget.index;
    bool isRetweeted = widget.tweet.isRetweeted ?? false;
    final int? likesCount = widget.tweet.likesCount;
    final int? retweetCount = widget.tweet.retweetsCount;
    final String? tweetId = widget.tweet.id;
    final String? text = widget.tweet.text;
    final String userName = widget.tweet.user?.username ?? '';
    final String handle = widget.tweet.user?.screenName ?? '';
    final String date = widget.tweet.createdAt ?? '';
    final bool verified = false;

    // final NetworkImage? userImage =
    //     NetworkImage(widget.tweet.user!.profileImageURL!);

    final Image? image = null;

    return (Row(
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
              //backgroundImage: userImage,
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
                      userName,
                      style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (verified)
                    SizedBox(
                      width: 0.02 * MediaQuery.of(context).size.height,
                      child: SvgPicture.asset(AppAssets.verifiedIcon),
                    ),
                  SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                  //Handle
                  Text(
                    handle,
                    style: const TextStyle(color: AppColors.lightGray),
                  ),
                  SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
                  //Date
                  Text(
                    "",
                    style: const TextStyle(color: AppColors.lightGray),
                  )
                ],
              ),
              if (text != null)
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              if (image != null)
                GestureDetector(
                  onTap: () {
                    _showImageDialog(context, image);
                  },
                  child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image(
                        image: image.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    TweetIconButton(
                      pathName: AppAssets.commentIcon,
                      text: commentCountBeforeMe.toString(),
                      onTap: () {},
                    ),
                    SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                    TweetIconButton(
                      color: isRetweeted
                          ? Colors.green
                          : AppColors.lightThinTextGray,
                      pathName: isRetweeted
                          ? AppAssets.retweetIcon
                          : AppAssets.retweetIcon,
                      text: retweetCount.toString(),
                      onTap: () {
                        isRetweeted = !isRetweeted;
                        isRetweeted
                            ? ref
                                .read(homeNotifierProvider.notifier)
                                .addRetweet(tweetId: tweetId!, index: index)
                            : ref
                                .read(homeNotifierProvider.notifier)
                                .deleteRetweet(tweetId: tweetId!, index: index);
                      },
                    ),
                    SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                    LikeButton(
                      isLiked: ref
                              .watch(homeNotifierProvider)
                              .homeResponse
                              .data[index]
                              .isLiked ??
                          false,
                      size: 23,
                      likeCount: likesCount,
                      countBuilder: (likecount, isLiked, text) {
                        return Text(
                          text,
                          style: TextStyle(
                            fontSize: 12,
                            color: isLiked
                                ? Colors.red
                                : AppColors.lightThinTextGray,
                          ),
                        );
                      },
                      onTap: (isLiked) async {
                        isLiked = !isLiked;
                        isLiked
                            ? ref
                                .read(homeNotifierProvider.notifier)
                                .addLike(tweetId: tweetId!, index: index)
                            : ref
                                .read(homeNotifierProvider.notifier)
                                .deleteLike(tweetId: tweetId!, index: index);
                      },
                      likeBuilder: (isLiked) {
                        return isLiked
                            ? SvgPicture.asset(
                                AppAssets.likeFilledIcon,
                                color: Colors.red,
                              )
                            : SvgPicture.asset(
                                AppAssets.likeOutlinedIcon,
                                color: AppColors.lightThinTextGray,
                              );
                      },
                    ),
                    SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
                    TweetIconButton(
                      pathName: AppAssets.viewsIcon,
                      text: '1800',
                      onTap: () {},
                    )
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
    ));
  }
}
