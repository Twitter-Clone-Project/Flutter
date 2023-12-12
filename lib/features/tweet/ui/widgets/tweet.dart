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
  late int repliesCount;
  late int likesCount;
  late int retweetCountBeforeMe;
  late var likeIcon = AppAssets.likeOutlinedIcon;
  late bool isRetweeted;
  @override
  void initState() {
    super.initState();
    likeIcon = AppAssets.likeOutlinedIcon;
    likesCount = widget.tweet.likesCount ?? 0;
    repliesCount = widget.tweet.repliesCount ?? 0;
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
    // bool isRetweeted = widget.tweet.isRetweeted ?? false;
    int? index = widget.index;
    final String tweetId = widget.tweet.id ?? '';
    final String? text = widget.tweet.text;
    final String userName = widget.tweet.user?.screenName ?? '';
    final String handle = widget.tweet.user?.username ?? '';
    final String date = widget.tweet.createdAt ?? '';
    final bool verified = false;
    final Image? image = null;
    final repliesCount =
        ref.watch(homeNotifierProvider).homeResponse.data[index].repliesCount;
    List<NetworkImage> images = (widget.tweet.attachmentsUrl ?? [])
        .map((url) => NetworkImage(url))
        .toList();
    if (images.isNotEmpty) {
      if (widget.tweet.attachmentsUrl![0] == "{}") {
        images = [];
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.005 * MediaQuery.of(context).size.width,
              vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.profileScreen,
                      arguments: widget.tweet.user!.username);
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  backgroundImage:
                      NetworkImage(widget.tweet.user!.profileImageURL ?? ''),
                  radius: 20,
                ),
              ),
              SizedBox(width: 0.02 * MediaQuery.of(context).size.width),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileScreen,
                          arguments: widget.tweet.user!.username);
                    },
                    child: Text(userName,
                        style: AppTextStyle.textThemeDark.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    '@$handle',
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
        if (text != null)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.005 * MediaQuery.of(context).size.width,
                vertical: 0),
            child: RichText(
              text: TextSpan(
                style: AppTextStyle.textThemeDark.bodyLarge!,
                children: text.split(' ').map((word) {
                  if (word.startsWith('#')) {
                    return TextSpan(
                        text: '$word ',
                        style: AppTextStyle.textThemeDark.bodyLarge!
                            .copyWith(color: AppColors.primaryColor));
                  } else {
                    return TextSpan(text: '$word ');
                  }
                }).toList(),
              ),
            ),
          ),
        if (images.isEmpty == false)
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.005 * MediaQuery.of(context).size.width,
                vertical: 5),
            child: GestureDetector(
              onTap: () {
                _showImageDialog(context, images);
              },
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image(
                    image: images[0],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
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
              Text(repliesCount.toString(),
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
              TweetIconButton(
                pathName: AppAssets.commentIcon,
                text: "",
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
