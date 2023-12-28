import 'package:cached_network_image/cached_network_image.dart';
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

/// A widget that represents a single tweet.
///
/// This widget is responsible for displaying a single tweet along with its
/// associated information such as the index, the user it belongs to, and
/// whether it is being displayed in the user's profile or not.
///
/// Example usage:
/// ```dart
/// TweetComponent(
///   tweet: Tweet(
///     id: 1,
///     content: 'Hello, world!',
///     author: 'John Doe',
///   ),
///   index: 0,
///   whom: 123,
///   inMyProfile: 1,
/// )
/// ```
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

  /// Formats the count value into a human-readable format.
  ///
  /// If the count is less than 1000, it returns the count as a string.
  /// If the count is between 1000 and 999,999, it converts the count into
  /// thousands (k) format with one decimal place if necessary.
  /// If the count is greater than or equal to 1,000,000, it converts the count
  /// into millions (M) format with one decimal place if necessary.
  ///
  /// Example usage:
  /// ```dart
  /// String formattedCount = formatCount(500); // returns "500"
  /// String formattedCount2 = formatCount(1500); // returns "1.5k"
  /// String formattedCount3 = formatCount(1000000); // returns "1.0M"
  /// ```
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

  /// Displays a dialog with a grid of images.
  ///
  /// This function takes in a [BuildContext] and a list of [NetworkImage] objects
  /// and displays a dialog with a grid of images. The number of columns in the grid
  /// can be adjusted by changing the value of `crossAxisCount` in the
  /// [SliverGridDelegateWithFixedCrossAxisCount] widget.
  ///
  /// Example usage:
  /// ```dart
  /// List<NetworkImage> images = [
  ///   NetworkImage('https://example.com/image1.jpg'),
  ///   NetworkImage('https://example.com/image2.jpg'),
  ///   NetworkImage('https://example.com/image3.jpg'),
  /// ];
  ///
  /// _showImageDialog(context, images);
  /// ```
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

  /// Opens a bottom sheet for deleting the tweet.
  ///
  /// This method is called when the user taps on the tweet and the tweet's
  /// author is the same as the currently logged-in user. It shows a modal
  /// bottom sheet with the option to delete the tweet. When the user taps on
  /// the "Delete Post" option, the tweet is deleted from both the home feed and
  /// the user's profile. The bottom sheet is then closed and the user is
  /// navigated back to the previous screen.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// _openBottomSheetForDelete(context);
  /// ```

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
    /// This widget represents a tweet and displays various information about the tweet, such as the number of likes, retweets, and replies.
    /// The information displayed depends on the value of the `whom` parameter.
    ///
    /// Example usage:
    ///
    /// ```dart
    /// Tweet(
    ///   whom: 0,
    /// )
    /// ```

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
    } else if (widget.whom == 1) {
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
    } else if (widget.whom == 2) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.profileScreen,
                      arguments: widget.tweet.user!.username);
                },
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageUrl: widget.tweet.user!.imageUrl ??
                        'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                    placeholder: (context, url) => Container(
                      color: Color(AppColors.blackColor.value),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.whiteLogo, fit: BoxFit.cover),
                  ),
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
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 0.75 * MediaQuery.of(context).size.width,
                      ),
                      child: Text(userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.textThemeDark.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 0.75 * MediaQuery.of(context).size.width,
                    ),
                    child: Text(
                      '@$handle',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                        color: AppColors.lightThinTextGray,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  _openBottomSheetForDelete(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.more_vert,
                    size: 17,
                    color: AppColors.lightThinTextGray,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.005 * MediaQuery.of(context).size.height,
        ),
        const SizedBox(
          height: 8,
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
                  if (word.startsWith('#') && !containsOnlyOneCharacter(word)) {
                    List<String> strings = splitHashWord(word);
                    return TextSpan(children: [
                      TextSpan(
                        text: strings[0],
                        style: AppTextStyle.textThemeDark.bodyLarge,
                      ),
                      TextSpan(
                        text: strings[1],
                        style: AppTextStyle.textThemeDark.bodyLarge!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ]);
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
        const SizedBox(
          height: 12,
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
