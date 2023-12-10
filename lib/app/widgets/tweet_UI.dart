import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:x_clone/app/routes.dart';
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

  void _showImageDialog(BuildContext context, List<NetworkImage> images) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // You can adjust the number of columns here
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image(image: images[index]);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final repliesCount = ref
        .watch(homeNotifierProvider)
        .homeResponse
        .data[widget.index]
        .repliesCount;
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
    final List<NetworkImage> images = (widget.tweet.attachmentsUrl ?? [])
        .map((url) => NetworkImage(url))
        .toList();

    return (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.profileScreen, arguments: {
                // "email": _emailController.text,
                // "isSignUp": false
              });
            },
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(widget.tweet.user!.profileImageURL ?? ''),
              backgroundColor: AppColors.whiteColor,
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
                  SizedBox(width: 0.01 * MediaQuery.of(context).size.width),
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
              // if (images.isEmpty == false)
              //   GestureDetector(
              //     onTap: () {
              //       _showImageDialog(context, images);
              //     },
              //     child: Container(
              //       width: double.infinity,
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(12.0),
              //         child: Image(
              //           image: images[0],
              //           fit: BoxFit.fitWidth,
              //         ),
              //       ),
              //     ),
              //   ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TweetIconButton(
                      color: isRetweeted
                          ? Colors.green
                          : AppColors.lightThinTextGray,
                      pathName: isRetweeted
                          ? AppAssets.retweetIcon
                          : AppAssets.retweetIcon,
                      text: retweetCount == 0 ? '' : retweetCount.toString(),
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
                    TweetIconButton(
                      pathName: AppAssets.commentIcon,
                      text: repliesCount == 0 ? '' : repliesCount.toString(),
                      onTap: () {},
                    ),
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
                          likecount == 0 ? '' : text,
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
