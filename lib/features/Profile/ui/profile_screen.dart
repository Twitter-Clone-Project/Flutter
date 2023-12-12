import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import '../../../app/routes.dart';
import '../../../app/widgets/tweet_UI.dart';
import '../../home/data/models/home_response.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key, required this.username});

  final String? username;

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  final RefreshController _controller = RefreshController();
  int pageIndex = 1;
  late TabController _tabcontroller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      loadData();
    });
    _tabcontroller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final userProfile = ref.watch(profileNotifierProvider).userProfile;
    var myUser = ref.watch(authNotifierProvider).user;

    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;

    return Scaffold(
      body: ref.watch(profileNotifierProvider).loading
          ? const Center(
              child: SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                color: AppColors.whiteColor,
                strokeWidth: 1,
              ),
            ))
          : Container(
            child: SmartRefresher(
              header: const ClassicHeader(
                releaseText: 'Release to refresh',
                refreshingText: 'Refreshing...',
                completeText: 'Refresh completed',
                failedText: 'Refresh failed',
                idleText: 'Pull down to refresh',
              ),
              enablePullDown: true,
              onRefresh: _onRefresh,
              controller: _controller,
              child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      iconTheme: const IconThemeData(
                        color: Colors.white,
                      ),
                      expandedHeight:
                          backgroundImageHeight + profileImageDiameter / 2,
                      floating: true,
                      pinned: false,
                      stretch: true,
                      backgroundColor: Colors.black87,
                      flexibleSpace: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: profileImageDiameter / 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.fullScreenImage,
                                  arguments: {"imageUrl": userProfile.bannerUrl},
                                );
                              },
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(userProfile.bannerUrl),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    // Adjust the padding to control the border width
                                    decoration: const BoxDecoration(
                                      color: Colors
                                          .black, // Set the color of the border
                                      shape: BoxShape.circle,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.fullScreenImage,
                                          arguments: {
                                            "imageUrl": userProfile.imageUrl
                                          },
                                        );
                                      },
                                      child: CircleAvatar(
                                        radius: profileImageDiameter / 2.5,
                                        backgroundImage: NetworkImage(
                                          userProfile.imageUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Add your button here
                                  Container(
                                    constraints: const BoxConstraints(),
                                    child: (userProfile.username ==
                                            myUser!.username)
                                        ? CustomButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  Routes.editProfileScreen);
                                            },
                                            text: 'Edit Profile',
                                            filled: false,
                                            horizontalPadding: 20,
                                          )
                                        : userProfile.isBlocked == true
                                            ? CustomButton(
                                                onPressed: () async {
                                                  // Show confirmation dialog
                                                  bool confirmUnblock =
                                                      await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            AppColors.blackColor,
                                                        // Set the background color to dark grey
                                                        title: Text(
                                                          'Unblock ${userProfile.name}?',
                                                          style: const TextStyle(
                                                            fontSize: 18.0,
                                                            fontFamily: 'Chirp',
                                                            // Use the font family name specified in pubspec.yaml
                                                            color: Colors
                                                                .white, // Set the text color to white
                                                          ),
                                                        ),
                                                        content: const CustomText(
                                                          'They will be able to follow you and view your posts.',
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop(
                                                                  false); // User canceled unblock
                                                            },
                                                            child: const Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colors.white,
                                                                fontFamily:
                                                                    'Chirp', // Use the font family name specified in pubspec.yaml
                                                              ),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop(
                                                                  true); // User confirmed unblock
                                                            },
                                                            child: const Text(
                                                              'Unblock',
                                                              style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colors.white,
                                                                fontFamily:
                                                                    'Chirp', // Use the font family name specified in pubspec.yaml
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  // If the user confirmed unblock, then proceed
                                                  if (confirmUnblock == true) {
                                                    ref
                                                        .read(
                                                            profileNotifierProvider
                                                                .notifier)
                                                        .toggleBlockStatus(
                                                            userProfile.username!);
                                                  }
                                                },
                                                text: 'Blocked',
                                                filled: false,
                                                red: true,
                                                horizontalPadding: 20,
                                              )
                                            : userProfile.isFollowed == false
                                                ? CustomButton(
                                                    onPressed: () async {
                                                      ref
                                                          .read(
                                                              profileNotifierProvider
                                                                  .notifier)
                                                          .toggleFollowStatus(
                                                              userProfile
                                                                  .username!);
                                                    },
                                                    text: 'Follow',
                                                    filled: true,
                                                    horizontalPadding: 20,
                                                  )
                                                : CustomButton(
                                                    onPressed: () async {
                                                      // Show confirmation dialog
                                                      bool confirmUnfollow =
                                                          await showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                AppColors
                                                                    .blackColor,
                                                            // Set the background color to dark grey
                                                            title: Text(
                                                              'Unfollow ${userProfile.name}?',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 18.0,
                                                                fontFamily: 'Chirp',
                                                                // Use the font family name specified in pubspec.yaml
                                                                color: Colors
                                                                    .white, // Set the text color to white
                                                              ),
                                                            ),
                                                            content:
                                                                const CustomText(
                                                              'Their posts will no longer show up in your home timeline. You can still view their profile, unless their posts are protected.',
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          false); // User canceled unfollow
                                                                },
                                                                child: const Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                    fontSize: 14.0,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Chirp', // Use the font family name specified in pubspec.yaml
                                                                  ),
                                                                ),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          true); // User confirmed unfollow
                                                                },
                                                                child: const Text(
                                                                  'Unfollow',
                                                                  style: TextStyle(
                                                                    fontSize: 14.0,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Chirp', // Use the font family name specified in pubspec.yaml
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );

                                                      // If the user confirmed unfollow, then proceed
                                                      if (confirmUnfollow == true) {
                                                        ref
                                                            .read(
                                                                profileNotifierProvider
                                                                    .notifier)
                                                            .toggleFollowStatus(
                                                                userProfile
                                                                    .username!);
                                                      }
                                                    },
                                                    text: 'Following',
                                                    filled: false,
                                                    horizontalPadding: 20,
                                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        // IconButton(
                        //   icon: const Icon(Icons.search,
                        //       size: 25, color: Colors.white),
                        //   onPressed: () {
                        //   },
                        // ),
                        Visibility(
                          visible: !(userProfile.username ==
                              ref.read(authNotifierProvider).user?.username),
                          child: PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert,
                                size: 25, color: Colors.white),
                            onSelected: (value) {
                              switch (value) {
                                case "unblock":
                                case "block":
                                  ref
                                      .read(profileNotifierProvider.notifier)
                                      .toggleBlockStatus(userProfile.username!);
                                  break;
                                case "unmute":
                                case "mute":
                                  ref
                                      .read(profileNotifierProvider.notifier)
                                      .toggleMuteStatus(userProfile.username!);
                                  break;
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              List<PopupMenuEntry<String>> items = [];

                              if (userProfile.isBlocked!) {
                                items.add(const PopupMenuItem<String>(
                                  value: 'unblock',
                                  child: Text('Unblock'),
                                ));
                              } else {
                                items.add(const PopupMenuItem<String>(
                                  value: 'block',
                                  child: Text('Block'),
                                ));
                              }

                              if (userProfile.isMuted!) {
                                items.add(const PopupMenuItem<String>(
                                  value: 'unmute',
                                  child: Text('Unmute'),
                                ));
                              } else {
                                items.add(const PopupMenuItem<String>(
                                  value: 'mute',
                                  child: Text('Mute'),
                                ));
                              }

                              return items;
                            },
                          ),
                        )
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userProfile.name!,
                                      style: const TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 22,
                                        fontFamily: 'Chirp',
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "@${userProfile.username}",
                                      style: const TextStyle(
                                        color: AppColors.lightThinTextGray,
                                      ),
                                    ),
                                    Visibility(
                                      visible: userProfile.bio != "",
                                      replacement: const SizedBox(height: 12,),
                                      child: Container(

                                        margin: const EdgeInsets.symmetric(vertical: 12.0), // Adjust the value as needed
                                        child: Text(
                                          userProfile.bio?? "",
                                          softWrap: true,
                                          style:
                                          const TextStyle(color: AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  runSpacing: 6.0,
                                  children: [
                                    Visibility(
                                      visible: userProfile.location != "",
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            size: 16,
                                            color: AppColors.lightThinTextGray,
                                          ),
                                          CustomText(
                                            userProfile.location ??
                                                "Location",
                                            color: AppColors.lightThinTextGray,),
                                          const SizedBox(width: 16,)
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: userProfile.website != "",
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.link_outlined,
                                            size: 16,
                                            color: AppColors.lightThinTextGray,
                                          ),
                                          const SizedBox(width: 4),
                                          InkWell(
                                            onTap: () => _launchUrl("https://${userProfile.website!}"),
                                            child: CustomText(
                                                userProfile.website?? "mou.com",
                                                color: AppColors.TwitterBlue),
                                          ),
                                          const SizedBox(width: 16,)
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: userProfile.birthDate != "",
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.face_unlock_sharp,
                                            size: 16,
                                            color: AppColors.lightThinTextGray,
                                          ),
                                          CustomText(
                                              formatDate(userProfile.birthDate?? "2002-03-17",true) ??
                                                  "Created At Date",
                                              color: AppColors.lightThinTextGray),
                                          const SizedBox(width: 16,)
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: userProfile.createdAt != "",
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.date_range,
                                            size: 16,
                                            color: AppColors.lightThinTextGray,
                                          ),
                                          CustomText(
                                              formatDate(userProfile.createdAt?? "2023-12-10T17:11:45.000Z",false) ??
                                                  "Created At Date",
                                              color: AppColors.lightThinTextGray),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: [
                                    Row(mainAxisSize: MainAxisSize.min, children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.followingsScreen,
                                            arguments: {"username": userProfile.username},
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              userProfile.followingsCount ?? "0",
                                              style: const TextStyle(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            const Text(
                                              "Following",
                                              style: TextStyle(
                                                color: AppColors.lightThinTextGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                    ]),
                                    Row(mainAxisSize: MainAxisSize.min, children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.followersScreen,
                                            arguments: {"username": userProfile.username},
                                          );
                                          },
                                        child: Row(
                                          children: [
                                            Text(
                                              userProfile.followersCount ?? "0",
                                              style: const TextStyle(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            const Text(
                                              "Followers",
                                              style: TextStyle(
                                                color: AppColors.lightThinTextGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                    ]),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: userProfile.isBlocked != true,
                              replacement: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text("@${userProfile.username} is blocked",
                                    style: const TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 22,
                                      fontFamily: 'Chirp',
                                    ),
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  // Top Bar (including TabBar)
                                  TabBar(
                                    controller: _tabcontroller,
                                    tabs: const [
                                      Tab(text: "Posts"),
                                      Tab(text: "Likes"),
                                    ],
                                  ),
                                  // Content
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.9,
                                    child: TabBarView(
                                      controller: _tabcontroller,
                                      children: [
                                        // Posts Tab
                                        _buildTweetsListView(
                                          ref
                                              .watch(profileNotifierProvider)
                                              .profileTweetsResponse
                                              .data,
                                        ),
                                        // Likes Tab
                                        _buildTweetsListView(
                                          ref
                                              .watch(profileNotifierProvider)
                                              .profileTweetsResponse
                                              .data,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
    );
  }

  void _onRefresh() async {
    await loadData();
    _controller.refreshCompleted();
  }

  void _onLoading() async {
    final provider = ref.read(profileNotifierProvider);

    if (provider.profileTweetsResponse.data.length ==
        provider.profileTweetsResponse.total) {
      _controller.loadNoData();
    } else {
      if (pageIndex == 0) pageIndex++;
      pageIndex++;
      await loadData();
      _controller.loadComplete();
    }
  }

  loadData() async {
    await ref
        .read(profileNotifierProvider.notifier)
        .fetchUserProfile(widget.username!);
    await ref.read(profileNotifierProvider.notifier).getUserLikedTweets(
          username: widget.username!,
          page: pageIndex,
        );
    await ref.read(profileNotifierProvider.notifier).getUserTweets(
          username: widget.username!,
          page: pageIndex,
        );
  }

  bool get wantKeepAlive => true;

  Widget _buildTweetsListView(List<Tweet> tweets) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tweets.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Tweet tweet = tweets[index];
            Navigator.pushNamed(
              context,
              Routes.tweetScreen,
              arguments: {"tweet": tweet, "index": index},
            );
          },
          child: TweetCompose(
            tweet: tweets[index],
            index: index,
          ),
        );
      },
    );
  }

  String formatDate(String dateString, bool birthdate) {
    DateTime date = DateTime.parse(dateString);
    List<String> monthNames = [
      "", "January", "February", "March", "April", "May", "June", "July",
      "August", "September", "October", "November", "December"
    ];
    if (birthdate){
      return " Born ${monthNames[date.month]} ${date.day}, ${date.year}";
    }
    else {
      return " Joined ${monthNames[date.month]} ${date.year}";
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }


}