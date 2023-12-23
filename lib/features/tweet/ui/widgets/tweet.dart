import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';
import 'package:x_clone/utils/utils.dart';

class TweetComponent extends StatefulHookConsumerWidget {
  final Tweet tweet;
  final int index;
  final int whom;
  final int inMyProfile;

  TweetComponent(
      {Key? key,
      required this.tweet,
      required this.index,
      required this.whom,
      required this.inMyProfile})
      : super(key: key) {}

  @override
  ConsumerState<TweetComponent> createState() {
    return _TweetComposeState();
  }
}

class _TweetComposeState extends ConsumerState<TweetComponent> {
  @override
  void initState() {
    super.initState();
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

  void _openBottomSheetForDelete(BuildContext context) {
    if (widget.tweet.user!.username ==
        ref.read(authNotifierProvider).user!.username) {
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
                  title: const Text('Delete Post'),
                  onTap: () {
                    ref
                        .watch(homeNotifierProvider.notifier)
                        .deleteTweet(tweetId: widget.tweet.id!);
                    ref
                        .watch(profileNotifierProvider.notifier)
                        .deleteTweet(tweetId: widget.tweet.id!);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
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
                  title: const Text('Follow'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.lightThinTextGray,
                  ),
                  title: const Text('Mute'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline_outlined,
                    color: AppColors.lightThinTextGray,
                  ),
                  title: const Text('Block'),
                  onTap: () {
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
    bool isliked = widget.tweet.isRetweeted ?? false;

    final int index = widget.index;
    final String tweetId = widget.tweet.id ?? '';
    final String date = widget.tweet.createdAt ?? '';
    bool isRetweeted = widget.tweet.isRetweeted ?? false;
    int? retweetCount = widget.tweet.retweetsCount;
    int? likesCount = widget.tweet.likesCount;
    String? text = widget.tweet.text;
    String userName = widget.tweet.user?.screenName ?? '';
    String handle = widget.tweet.user?.username ?? '';
    int? repliesCount = widget.tweet.repliesCount;

    //Handle if Click From Home Or Profile
    if (widget.whom == 0) {
      isliked =
          ref.watch(homeNotifierProvider).homeResponse.data[index].isLiked ??
              false;
      isRetweeted = ref
              .watch(homeNotifierProvider)
              .homeResponse
              .data[index]
              .isRetweeted ??
          false;
      retweetCount = ref
              .watch(homeNotifierProvider)
              .homeResponse
              .data[index]
              .retweetsCount ??
          0;
      likesCount =
          ref.watch(homeNotifierProvider).homeResponse.data[index].likesCount ??
              0;
      repliesCount = ref
              .watch(homeNotifierProvider)
              .homeResponse
              .data[index]
              .repliesCount ??
          0;
      text =
          ref.watch(homeNotifierProvider).homeResponse.data[index].text ?? '';
      userName = ref
              .watch(homeNotifierProvider)
              .homeResponse
              .data[index]
              .user!
              .screenName ??
          '';
      handle = ref
              .watch(homeNotifierProvider)
              .homeResponse
              .data[index]
              .user!
              .username ??
          '';
    }
    else if (widget.whom == 1)
    {
      isliked = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .isLiked ??
          false;

      isRetweeted = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .isRetweeted ??
          false;
      retweetCount = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .retweetsCount ??
          0;
      likesCount = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .likesCount ??
          0;
      repliesCount = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .repliesCount ??
          0;
      text = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .text ??
          '';
      userName = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .user!
              .screenName ??
          '';
      handle = ref
              .watch(profileNotifierProvider)
              .profileTweetsResponse
              .data[index]
              .user!
              .username ??
          '';
    }
    else if (widget.whom == 2) {
      isliked = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .isLiked ??
          false;
      isRetweeted = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .isRetweeted ??
          false;
      retweetCount = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .retweetsCount ??
          0;
      likesCount = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .likesCount ??
          0;
      repliesCount = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .repliesCount ??
          0;
      text = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .text ??
          '';
      userName = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .user!
              .screenName ??
          '';
      handle = ref
              .watch(profileNotifierProvider)
              .profileLikedTweetsResponse
              .data[index]
              .user!
              .username ??
          '';
    }
    // else if (widget.whom == 3) {
    //   isliked = ref
    //       .watch(searchNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .isLiked ??
    //       false;
    //   isRetweeted = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .isRetweeted ??
    //       false;
    //   retweetCount = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .retweetsCount ??
    //       0;
    //   likesCount = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .likesCount ??
    //       0;
    //   repliesCount = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .repliesCount ??
    //       0;
    //   text = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .text ??
    //       '';
    //   userName = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .user!
    //       .screenName ??
    //       '';
    //   handle = ref
    //       .watch(profileNotifierProvider)
    //       .profileLikedTweetsResponse
    //       .data[index]
    //       .user!
    //       .username ??
    //       '';
    // }

    // Handle Images Of Tweet
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
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  _openBottomSheetForDelete(context);
                },
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
          if (images.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CarouselSlider(
                items: widget.tweet.attachmentsUrl!.map(
                  (file) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: Image.network(file));
                  },
                ).toList(),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                ),
              ),
            ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.005 * MediaQuery.of(context).size.width,
              vertical: 0),
          child: Text(
            "${getFullDateTime(widget.tweet.createdAt)}",
            style: TextStyle(color: AppColors.lightThinTextGray),
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
                child: Text(retweetCount.toString(),
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
                  isRetweeted = !isRetweeted;
                  isRetweeted
                      ? {
                          ref
                              .read(homeNotifierProvider.notifier)
                              .addRetweet(tweetId: tweetId!),
                          ref.read(profileNotifierProvider.notifier).addRetweet(
                              tweetId: tweetId!,
                              whom: widget.whom,
                              inMyProfile: widget.inMyProfile),
                        }
                      : {
                          ref
                              .read(homeNotifierProvider.notifier)
                              .deleteRetweet(tweetId: tweetId!),
                          ref
                              .read(profileNotifierProvider.notifier)
                              .deleteRetweet(
                                  tweetId: tweetId!,
                                  whom: widget.whom,
                                  inMyProfile: widget.inMyProfile),
                        };
                },
              ),
              TweetIconButton(
                pathName: AppAssets.commentIcon,
                text: "",
                onTap: () {},
              ),
              LikeButton(
                isLiked: isliked,
                size: 23,
                onTap: (isLiked) async {
                  isLiked = !isLiked;
                  isLiked
                      ? {
                          ref
                              .read(homeNotifierProvider.notifier)
                              .addLike(tweetId: tweetId!),
                          ref.read(profileNotifierProvider.notifier).addLike(
                                tweetId: tweetId!,
                                whom: widget.whom,
                                inMyProfile: widget.inMyProfile,
                              ),
                        }
                      : {
                          ref
                              .read(homeNotifierProvider.notifier)
                              .deleteLike(tweetId: tweetId!),
                          ref.read(profileNotifierProvider.notifier).deleteLike(
                                tweetId: tweetId!,
                                whom: widget.whom,
                                inMyProfile: widget.inMyProfile,
                              ),
                        };
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
