import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class TweetComponent extends StatefulHookConsumerWidget {
  final Tweet tweet;
  final int index;

  TweetComponent({Key? key, required this.tweet, required this.index})
      : super(key: key) {}

  @override
  ConsumerState<TweetComponent> createState() {
    return _TweetComposeState();
  }
}

class _TweetComposeState extends ConsumerState<TweetComponent> {
  late int likeCountBeforeMe;
  late int retweetsCount;
  late int likesCount;
  late int retweetCountBeforeMe;
  late var likeIcon = AppAssets.likeOutlinedIcon;
  late bool isRetweeted;
  @override
  void initState() {
    super.initState();
    likeIcon = AppAssets.likeOutlinedIcon;
    likesCount = widget.tweet.likesCount ?? 0;
    retweetsCount = widget.tweet.retweetsCount ?? 0;
    retweetCountBeforeMe = widget.tweet.retweetsCount ?? 0;
    isRetweeted = widget.tweet.isRetweeted ?? false;
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
    // bool isRetweeted = widget.tweet.isRetweeted ?? false;
    final int? repliescount = widget.tweet.repliesCount;
    int? index = widget.index;
    final String tweetId = widget.tweet.id ?? '';
    final String? text = widget.tweet.text;
    final String userName = widget.tweet.user?.username ?? '';
    final String handle = widget.tweet.user?.screenName ?? '';
    final String date = widget.tweet.createdAt ?? '';
    final bool verified = false;
    final NetworkImage? userImage = NetworkImage(widget
            .tweet.user?.profileImageURL ??
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D');
    final Image? image = null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.03 * MediaQuery.of(context).size.width,
              vertical: 0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // go to user profile
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  //backgroundImage: userImage,
                  radius: 20,
                ),
              ),
              SizedBox(width: 0.02 * MediaQuery.of(context).size.width),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(userName,
                        style: AppTextStyle.textThemeDark.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    '@' + handle,
                    style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                      color: AppColors.lightThinTextGray,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.005 * MediaQuery.of(context).size.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.03 * MediaQuery.of(context).size.width,
              vertical: 0),
          child: Text(text!,
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith()),
        ),
        const Divider(color: AppColors.lightThinTextGray, thickness: 0.3),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.03 * MediaQuery.of(context).size.width,
              vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.retweetersScreen,
                      arguments: tweetId);
                },
                child: Text(retweetsCount.toString(),
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.retweetersScreen,
                      arguments: tweetId);
                },
                child: Text(" Reposts",
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(color: AppColors.lightThinTextGray)),
              ),
              SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
              Text(repliescount.toString(),
                  style: AppTextStyle.textThemeDark.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(" Replies",
                  style: AppTextStyle.textThemeDark.bodyLarge!
                      .copyWith(color: AppColors.lightThinTextGray)),
              SizedBox(width: 0.1 * MediaQuery.of(context).size.width),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.likersScreen,
                      arguments: tweetId!);
                },
                child: Text(likesCount.toString(),
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.likersScreen,
                      arguments: tweetId);
                },
                child: Text(" Likes",
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(color: AppColors.lightThinTextGray)),
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.lightThinTextGray, thickness: 0.3),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.05 * MediaQuery.of(context).size.width,
              vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TweetIconButton(
                pathName: AppAssets.commentIcon,
                text: "",
                onTap: () {},
              ),
              TweetIconButton(
                color: isRetweeted ? Colors.green : AppColors.lightThinTextGray,
                pathName:
                    isRetweeted ? AppAssets.retweetIcon : AppAssets.retweetIcon,
                onTap: () {
                  setState(() {
                    isRetweeted = !isRetweeted;
                    isRetweeted ? retweetsCount++ : retweetsCount--;
                    isRetweeted
                        ? ref
                            .read(homeNotifierProvider.notifier)
                            .addRetweet(tweetId: tweetId!, index: index)
                        : ref
                            .read(homeNotifierProvider.notifier)
                            .deleteRetweet(tweetId: tweetId!, index: index);
                  });
                },
              ),
              LikeButton(
                isLiked: ref
                        .watch(homeNotifierProvider)
                        .homeResponse
                        .data[index]
                        .isLiked ??
                    false,
                size: 23,
                onTap: (isLiked) async {
                  isLiked = !isLiked;
                  isLiked ? likesCount++ : likesCount--;
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
            ],
          ),
        ),
        const Divider(color: AppColors.lightThinTextGray, thickness: 0.3),
      ],
    );
  }
}
