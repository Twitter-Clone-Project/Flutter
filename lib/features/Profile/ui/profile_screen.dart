import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import '../../../app/routes.dart';
import '../../../app/widgets/tweet_UI.dart';
import '../../../theme/app_assets.dart';
import '../../auth/data/model/user.dart';
import '../../home/data/models/home_response.dart';
import '../data/model/user_profile.dart';

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
    final userProfile = ref
        .watch(profileNotifierProvider)
        .userProfile;
    var myUser = ref
        .read(authNotifierProvider)
        .user;
    var IsBlocked = userProfile.isBlocked;
    var IsMuted = userProfile.isBlocked;
    // print("Opening profile of ${userProfile.username}");
    // List<Tweet> tweetsList = ref.watch(profileNotifierProvider).profileTweetsResponse.data;
    // print("tweets length ${tweetsList.length}");

    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;

    var isUserProfile =
        userProfile.username == ref
            .read(authNotifierProvider)
            .user
            ?.username;
    return Scaffold(
      body: ref
          .watch(profileNotifierProvider)
          .loading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
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
            backgroundColor: Colors.transparent,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: profileImageDiameter / 2,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(userProfile.bannerUrl),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2.5),
                          // Adjust the padding to control the border width
                          decoration: const BoxDecoration(
                            color: Colors
                                .black, // Set the color of the border
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: profileImageDiameter / 2,
                            backgroundImage: NetworkImage(
                              userProfile.imageUrl,
                            ),
                          ),
                        ),
                        // Add your button here
                        _EditProfileButton(
                          userProfile: userProfile,
                          myUser: myUser!,
                          onEditProfile: () {
                            Navigator.pushNamed(
                                context, Routes.editProfileScreen);
                          },
                          onFollow: () {
                            if (userProfile.isFollowed!) {
                              ref.read(profileNotifierProvider.notifier)
                                  .unfollowUser(userProfile.username!);
                            }
                            else {
                              ref.read(profileNotifierProvider.notifier)
                                  .followUser(userProfile.username!);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, size: 25, color: Colors.white),
                onPressed: () {
                  // Add your functionality here when the search icon is clicked
                  // For example, you can navigate to the search screen:
                  _onRefresh();
                },
              ),
              Visibility(
                visible: !isUserProfile,
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, size: 25, color: Colors.white),
                  onSelected: (value) {
                    switch (value) {
                      case "unblock":
                      case "block":
                      ref.read(profileNotifierProvider.notifier).blockOrUnblockUser(userProfile.username!);
                        break;
                      case "unmute":
                        print("unmute selected");
                        // ref.read(profileNotifierProvider.notifier).unmuteUser(userProfile.username!);
                        break;
                      case "mute":
                        print("Mute selected");
                        // ref.read(profileNotifierProvider.notifier).muteUser(userProfile.username!);
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
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userProfile.name ?? "",
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "@${userProfile.username}",
                            style: const TextStyle(
                              color: AppColors.lightThinTextGray,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            userProfile.bio ?? "No Bio Provided",
                            softWrap: true,
                            style: const TextStyle(
                                color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                fill: 1,
                                color: AppColors.lightThinTextGray,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                  userProfile.location ??
                                      "No Location Provided",
                                  style: const TextStyle(
                                      color: AppColors.lightThinTextGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.link_outlined,
                                fill: 1,
                                color: AppColors.lightThinTextGray,
                              ),
                              const SizedBox(width: 4),
                              Link(
                                url_string: userProfile.website ??
                                    "NoWebsiteProvided.com",
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(userProfile.followingsCount ?? "0",
                                style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            const Text(
                              "Following",
                              style: TextStyle(
                                  color: AppColors.lightThinTextGray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              userProfile.followersCount ?? "0",
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Followers",
                              style: TextStyle(
                                color: AppColors.lightThinTextGray,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TabBar(
                        controller: _tabcontroller,
                        tabs: const [
                          Tab(text: "Posts"),
                          Tab(text: "Likes"),
                        ],
                      ),
                      Visibility(
                        visible: IsBlocked != true,
                        replacement: const Center(
                            child: Padding(
                              padding:
                              EdgeInsets.only(
                                  top: 50),
                              // Adjust the top padding as needed
                              child: Text("You Blocked This User"),
                            ),
                        ),
                        child: SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.9,
                          child: TabBarView(
                            controller: _tabcontroller,
                            children: [
                              Scaffold(
                                body: ref
                                    .watch(profileNotifierProvider)
                                    .loading
                                    ? const Center(
                                    child: CircularProgressIndicator())
                                    : ref
                                    .watch(profileNotifierProvider)
                                    .profileTweetsResponse
                                    .data
                                    .isEmpty
                                    ? const Center(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        top: 50),
                                    // Adjust the top padding as needed
                                    child: Text("No Tweets"),
                                  ),
                                )
                                    : Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets
                                          .symmetric(
                                          vertical: 10,
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Spacer()
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: double.infinity,
                                        child: SmartRefresher(
                                          controller: _controller,
                                          enablePullDown: true,
                                          enablePullUp: true,
                                          footer:
                                          const ClassicFooter(
                                            loadingText:
                                            'Load for more',
                                          ),
                                          onLoading: _onLoading,
                                          onRefresh: _onRefresh,
                                          child:
                                          ListView.separated(
                                            itemCount: ref.watch(profileNotifierProvider).profileTweetsResponse.data.length ,
                                            itemBuilder:
                                                (BuildContext context, int index) =>
                                                InkWell(
                                                  child: TweetCompose(
                                                    tweet: ref
                                                        .watch(
                                                        profileNotifierProvider)
                                                        .profileTweetsResponse
                                                        .data[index],
                                                    index: index,
                                                  ),
                                                  onTap: () {
                                                    Tweet tweet = ref
                                                        .watch(profileNotifierProvider)
                                                        .profileTweetsResponse
                                                        .data[index];
                                                    Navigator.pushNamed(
                                                      context,
                                                      Routes.tweetScreen,
                                                      arguments: {
                                                        "tweet": tweet,
                                                        "index": index,
                                                      },
                                                    );
                                                  },
                                                ),
                                            separatorBuilder:
                                                (BuildContext context, int index) =>
                                            const Divider(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Scaffold(
                                body: ref
                                    .watch(profileNotifierProvider)
                                    .loading
                                    ? const Center(
                                    child: CircularProgressIndicator())
                                    : ref
                                    .watch(profileNotifierProvider)
                                    .profileLikedTweetsResponse
                                    .data
                                    .isEmpty
                                    ? const Center(
                                  child: Text("No Tweets"),
                                )
                                    : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets
                                          .symmetric(
                                          vertical: 20,
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Scaffold.of(context)
                                                  .openDrawer();
                                            },
                                            child: CircleAvatar(
                                              child:
                                              CachedNetworkImage(
                                                height: MediaQuery
                                                    .of(
                                                    context)
                                                    .size
                                                    .height *
                                                    0.05,
                                                width: MediaQuery
                                                    .of(
                                                    context)
                                                    .size
                                                    .height *
                                                    0.05,
                                                fit: BoxFit
                                                    .scaleDown,
                                                color: AppColors
                                                    .primaryColor,
                                                imageUrl:
                                                "${ref
                                                    .watch(
                                                    profileNotifierProvider)
                                                    .profileLikedTweetsResponse
                                                    .data[0].user
                                                    ?.profileImageURL}",
                                                placeholder: (context,
                                                    url) =>
                                                    SvgPicture.asset(
                                                        AppAssets
                                                            .logo,
                                                        colorFilter: const ColorFilter
                                                            .mode(
                                                            AppColors
                                                                .whiteColor,
                                                            BlendMode
                                                                .srcIn),
                                                        fit: BoxFit
                                                            .cover),
                                                errorWidget: (context,
                                                    url,
                                                    error) =>
                                                    SvgPicture.asset(
                                                        AppAssets
                                                            .logo,
                                                        colorFilter: const ColorFilter
                                                            .mode(
                                                            AppColors
                                                                .whiteColor,
                                                            BlendMode
                                                                .srcIn),
                                                        fit: BoxFit
                                                            .cover),
                                              ),
                                            ),
                                          ),
                                          const Spacer()
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: double.infinity,
                                        child: SmartRefresher(
                                          controller: _controller,
                                          enablePullDown: true,
                                          enablePullUp: true,
                                          footer:
                                          const ClassicFooter(
                                            loadingText:
                                            'Load for more',
                                          ),
                                          onLoading: _onLoading,
                                          onRefresh: _onRefresh,
                                          child:
                                          ListView.separated(
                                            itemCount: ref
                                                .watch(
                                                profileNotifierProvider)
                                                .profileLikedTweetsResponse
                                                .data.length,
                                            itemBuilder: (BuildContext
                                            context,
                                                int index) =>
                                                TweetCompose(
                                                  tweet: ref
                                                      .watch(
                                                      profileNotifierProvider)
                                                      .profileLikedTweetsResponse
                                                      .data[index],
                                                  index: index,
                                                ),
                                            separatorBuilder:
                                                (BuildContext
                                            context,
                                                int index) =>
                                            const Divider(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                floatingActionButton: FloatingActionButton(
                                  backgroundColor: AppColors.primaryColor,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.profileScreen);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          ,
        ]
        ,
      )
      ,
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
    await ref.read(profileNotifierProvider.notifier).fetchUserProfile(widget.username!);
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
}


class CircularIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;
  final double? border;

  const CircularIcon(
      {super.key, required this.icon, this.onPress, this.border});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      icon: Icon(
        icon,
        color: AppColors.whiteColor,
      ),
      onPressed: onPress ?? () => {},
      splashRadius: 18,
      iconSize: 18,
      padding: const EdgeInsets.all(6),
      constraints: const BoxConstraints(),
    );
  }
}

class Link extends StatelessWidget {
  final String url_string;

  const Link({super.key, required this.url_string});

  Uri _getUrl() {
    return Uri.parse(url_string);
  }

  String _getUrlText() {
    var url_obj = _getUrl();
    return url_obj.host + url_obj.path;
  }

  Future<void> _launchUrl() async {
    var url = _getUrl();
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(_getUrlText(),
            style: const TextStyle(
                color: AppColors.TwitterBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
        onTap: () => _launchUrl());
  }
}


class _EditProfileButton extends StatelessWidget {
  final UserProfile userProfile;
  final User myUser;
  final VoidCallback onEditProfile;
  final VoidCallback onFollow;

  const _EditProfileButton({
    required this.userProfile,
    required this.myUser,
    required this.onEditProfile,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    final isMyProfile = userProfile.username == myUser.username;

    return Container(
      constraints: const BoxConstraints(),
      child: isMyProfile
          ? CustomButton(
        onPressed: onEditProfile,
        text: 'Edit Profile',
        filled: false,
        horizontalPadding: 20,
      )
          : CustomButton(
        onPressed: onFollow,
        text: userProfile.isFollowed! ? 'Unfollow' : 'Follow',
        filled: userProfile.isFollowed! ? false : true,
        horizontalPadding: 20,
      ),
    );
  }
}


String formatJoinDate(String inputDate) {
  // Parse the input date
  DateTime dateTime = DateTime.parse(inputDate);

  // Format the date as "Joined Month Year"
  String formattedDate = 'Joined ' +
      DateFormat('MMMM yyyy').format(dateTime);

  return formattedDate;
}

