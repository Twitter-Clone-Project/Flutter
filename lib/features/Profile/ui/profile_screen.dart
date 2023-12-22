import 'package:another_flushbar/flushbar.dart';
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

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key, required this.username});

  final String? username;

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  final RefreshController _controller = RefreshController();
  final RefreshController _tweetsController = RefreshController();
  final RefreshController _LikedTweetsController = RefreshController();
  int tweetsPageIndex = 1;
  int likedTweetsPageIndex = 1;
  late TabController _tabcontroller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      loadProfile();
      loadData();
    });
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  void loadProfile() async {
    await ref.read(profileNotifierProvider.notifier).loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final userProfile = ref.watch(profileNotifierProvider).userProfile;
    var myUser = ref.watch(authNotifierProvider).user;
    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;

    return Scaffold(
      floatingActionButton:
          userProfile.username == ref.watch(authNotifierProvider).user?.username
              ? FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addTweet);
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                )
              : null,
      body: ref.watch(profileNotifierProvider).profileLoading
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
              child: userProfile.isBlockingMe!
                  ? CustomScrollView(
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
                                      arguments: {
                                        "imageUrl": userProfile.bannerUrl
                                      },
                                    );
                                  },
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(userProfile.bannerUrl ??
                                        "https://kady-twitter-images.s3.amazonaws.com/DefaultBanner.png"),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              userProfile.imageUrl ??
                                                  "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg",
                                            ),
                                          ),
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
                            //   icon: ref.watch(profileNotifierProvider).loading
                            //       ? const CircularProgressIndicator(
                            //           color: Colors.white,
                            //           strokeWidth: 1,
                            //         )
                            //       : const Icon(
                            //           Icons.refresh,
                            //           color: AppColors.whiteColor,
                            //         ),
                            //   onPressed: () async {
                            //     _onRefresh();
                            //   },
                            // ),
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.more_vert,
                                  size: 25, color: Colors.white),
                              onSelected: (value) async {
                                switch (value) {
                                  case "unblock":
                                    {
                                      bool success = await ref
                                          .read(
                                              profileNotifierProvider.notifier)
                                          .toggleBlockStatus(
                                              userProfile.username!);
                                      showFlushbar(
                                          context,
                                          success,
                                          "You unblocked ${userProfile.username}",
                                          " Unblock failed, try again later");
                                    }
                                    break;
                                  case "block":
                                    bool success = await ref
                                        .read(profileNotifierProvider.notifier)
                                        .toggleBlockStatus(
                                            userProfile.username!);
                                    showFlushbar(
                                        context,
                                        success,
                                        "You blocked ${userProfile.username}",
                                        " block failed, try again later");
                                    break;
                                  case "unmute":
                                    bool success = await ref
                                        .read(profileNotifierProvider.notifier)
                                        .toggleMuteStatus(
                                            userProfile.username!);
                                    showFlushbar(
                                        context,
                                        success,
                                        "You unmuted ${userProfile.username}",
                                        " Unmute failed, try again later");
                                    break;
                                  case "mute":
                                    bool success = await ref
                                        .read(profileNotifierProvider.notifier)
                                        .toggleMuteStatus(
                                            userProfile.username!);
                                    showFlushbar(
                                        context,
                                        success,
                                        "You muted ${userProfile.username}",
                                        " mute failed, try again later");
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          " ${userProfile.name!}",
                                          style: const TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 22,
                                            fontFamily: 'Chirp',
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          " @${userProfile.username}",
                                          style: const TextStyle(
                                            color: AppColors.lightThinTextGray,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        const Divider(
                                          height: 20,
                                          thickness: 0.5,
                                          color: AppColors.lightThinTextGray,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                          child: CustomText(
                                            "You are blocked from following @${userProfile.username} and viewing @${userProfile.username}'s posts.",
                                            color: AppColors.lightThinTextGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        SliverAppBar(
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors
                                        .transparent, // Start with a transparent color
                                    Colors
                                        .black, // End with the desired background color
                                  ],
                                ),
                              ),
                              child: Stack(
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
                                          arguments: {
                                            "imageUrl": userProfile.bannerUrl
                                          },
                                        );
                                      },
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(userProfile.bannerUrl),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                                    "imageUrl":
                                                        userProfile.imageUrl
                                                  },
                                                );
                                              },
                                              child: CircleAvatar(
                                                radius:
                                                    profileImageDiameter / 2.5,
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
                                                      Navigator.pushNamed(
                                                          context,
                                                          Routes
                                                              .editProfileScreen);
                                                    },
                                                    text: 'Edit Profile',
                                                    filled: false,
                                                    horizontalPadding: 20,
                                                  )
                                                : userProfile.isBlocked == true
                                                    ? CustomButton(
                                                        onPressed: () async {
                                                          bool confirmUnblock =
                                                              await showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    AppColors
                                                                        .blackColor,
                                                                title: Text(
                                                                  'Unblock ${userProfile.name}?',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        18.0,
                                                                    fontFamily:
                                                                        'Chirp',
                                                                    // Use the font family name specified in pubspec.yaml
                                                                    color: Colors
                                                                        .white, // Set the text color to white
                                                                  ),
                                                                ),
                                                                content:
                                                                    const CustomText(
                                                                  'They will be able to follow you and view your posts.',
                                                                ),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(
                                                                              false); // User canceled unblock
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Cancel',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Chirp', // Use the font family name specified in pubspec.yaml
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(
                                                                              true); // User confirmed unblock
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Unblock',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14.0,
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

                                                          // If the user confirmed unblock, then proceed
                                                          if (confirmUnblock ==
                                                              true) {
                                                            bool success = await ref
                                                                .read(profileNotifierProvider
                                                                    .notifier)
                                                                .toggleBlockStatus(
                                                                    userProfile
                                                                        .username!);
                                                            showFlushbar(
                                                                context,
                                                                success,
                                                                "You unblocked ${userProfile.username}",
                                                                " Unblock failed, try again later");
                                                          }
                                                        },
                                                        text: 'Blocked',
                                                        filled: false,
                                                        red: true,
                                                        horizontalPadding: 20,
                                                      )
                                                    : userProfile.isFollowed ==
                                                            false
                                                        ? CustomButton(
                                                            onPressed:
                                                                () async {
                                                              ref
                                                                  .read(profileNotifierProvider
                                                                      .notifier)
                                                                  .toggleFollowStatus(
                                                                      userProfile
                                                                          .username!);
                                                            },
                                                            text: 'Follow',
                                                            filled: true,
                                                            horizontalPadding:
                                                                20,
                                                          )
                                                        : CustomButton(
                                                            onPressed:
                                                                () async {
                                                              // Show confirmation dialog
                                                              bool
                                                                  confirmUnfollow =
                                                                  await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        AppColors
                                                                            .blackColor,
                                                                    // Set the background color to dark grey
                                                                    title: Text(
                                                                      'Unfollow ${userProfile.name}?',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            18.0,
                                                                        fontFamily:
                                                                            'Chirp',
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
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop(false); // User canceled unfollow
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Cancel',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14.0,
                                                                            color:
                                                                                Colors.white,
                                                                            fontFamily:
                                                                                'Chirp', // Use the font family name specified in pubspec.yaml
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop(true); // User confirmed unfollow
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Unfollow',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14.0,
                                                                            color:
                                                                                Colors.white,
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
                                                              if (confirmUnfollow ==
                                                                  true) {
                                                                bool success = await ref
                                                                    .read(profileNotifierProvider
                                                                        .notifier)
                                                                    .toggleFollowStatus(
                                                                        userProfile
                                                                            .username!);
                                                                showFlushbar(
                                                                    context,
                                                                    success,
                                                                    "You unfollowed ${userProfile.username}",
                                                                    " Unfollow failed, try again later");
                                                              }
                                                            },
                                                            text: 'Following',
                                                            filled: false,
                                                            horizontalPadding:
                                                                20,
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
                          iconTheme: const IconThemeData(
                            color: Colors.white,
                          ),
                          expandedHeight:
                              backgroundImageHeight + profileImageDiameter / 2,
                          floating: true,
                          pinned: true,
                          //stretch: true,
                          backgroundColor: Colors.black87,
                          actions: [
                            // IconButton(
                            //   icon: ref.watch(profileNotifierProvider).loading
                            //       ? const CircularProgressIndicator(
                            //           color: Colors.white,
                            //           strokeWidth: 1,
                            //         )
                            //       : const Icon(
                            //           Icons.refresh,
                            //           color: AppColors.whiteColor,
                            //         ),
                            //   onPressed: () async {
                            //     _onRefresh();
                            //   },
                            // ),
                            // IconButton(
                            //   icon: const Icon(Icons.search,
                            //       size: 25, color: Colors.white),
                            //   onPressed: () {
                            //   },
                            // ),
                            Visibility(
                              visible: !(userProfile.username ==
                                  ref
                                      .watch(authNotifierProvider)
                                      .user
                                      ?.username),
                              child: PopupMenuButton<String>(
                                icon: const Icon(Icons.more_vert,
                                    size: 25, color: Colors.white),
                                onSelected: (value) async {
                                  switch (value) {
                                    case "unblock":
                                      {
                                        bool success = await ref
                                            .read(profileNotifierProvider
                                                .notifier)
                                            .toggleBlockStatus(
                                                userProfile.username!);
                                        showFlushbar(
                                            context,
                                            success,
                                            "You unblocked ${userProfile.username}",
                                            " Unblock failed, try again later");
                                      }
                                      break;
                                    case "block":
                                      bool success = await ref
                                          .read(
                                              profileNotifierProvider.notifier)
                                          .toggleBlockStatus(
                                              userProfile.username!);
                                      showFlushbar(
                                          context,
                                          success,
                                          "You blocked ${userProfile.username}",
                                          " block failed, try again later");
                                      break;
                                    case "unmute":
                                      bool success = await ref
                                          .read(
                                              profileNotifierProvider.notifier)
                                          .toggleMuteStatus(
                                              userProfile.username!);
                                      showFlushbar(
                                          context,
                                          success,
                                          "You unmuted ${userProfile.username}",
                                          " Unmute failed, try again later");
                                      break;
                                    case "mute":
                                      bool success = await ref
                                          .read(
                                              profileNotifierProvider.notifier)
                                          .toggleMuteStatus(
                                              userProfile.username!);
                                      showFlushbar(
                                          context,
                                          success,
                                          "You muted ${userProfile.username}",
                                          " mute failed, try again later");
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userProfile.name!,
                                          style: const TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 22,
                                            fontFamily: 'Chirp',
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "@${userProfile.username}",
                                          style: const TextStyle(
                                            color: AppColors.lightThinTextGray,
                                          ),
                                        ),
                                        Visibility(
                                          visible: userProfile.bio != null,
                                          replacement: const SizedBox(
                                            height: 12,
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 12.0),
                                            // Adjust the value as needed
                                            child: Text(
                                              userProfile.bio ?? "",
                                              softWrap: true,
                                              style: const TextStyle(
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                      runSpacing: 6.0,
                                      children: [
                                        Visibility(
                                          visible: userProfile.location != "" &&
                                              userProfile.location != null,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 16,
                                                color:
                                                    AppColors.lightThinTextGray,
                                              ),
                                              Text(
                                                " ${userProfile.location}" ??
                                                    "Location",
                                                style: const TextStyle(
                                                  color: AppColors
                                                      .lightThinTextGray,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: userProfile.website != "" &&
                                              userProfile.website != null,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.link_outlined,
                                                  size: 16,
                                                  color: AppColors
                                                      .lightThinTextGray,
                                                ),
                                                const SizedBox(width: 4),
                                                InkWell(
                                                  onTap: () => _launchUrl(
                                                      "${userProfile.website!}"),
                                                  child: Text(
                                                    " ${userProfile.website}" ??
                                                        "mou.com",
                                                    style: const TextStyle(
                                                      color:
                                                          AppColors.TwitterBlue,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 16,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              userProfile.birthDate != "" &&
                                                  userProfile.birthDate != null,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.face_unlock_sharp,
                                                size: 16,
                                                color:
                                                    AppColors.lightThinTextGray,
                                              ),
                                              Text(
                                                formatDate(
                                                        userProfile.birthDate ??
                                                            "2002-03-17",
                                                        true) ??
                                                    "Created At Date",
                                                style: const TextStyle(
                                                  color: AppColors
                                                      .lightThinTextGray,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              userProfile.createdAt != "" &&
                                                  userProfile.createdAt != null,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.date_range,
                                                size: 16,
                                                color:
                                                    AppColors.lightThinTextGray,
                                              ),
                                              Text(
                                                  formatDate(
                                                          userProfile
                                                                  .createdAt ??
                                                              "2023-12-10T17:11:45.000Z",
                                                          false) ??
                                                      "Created At Date",
                                                  style: const TextStyle(
                                                    color: AppColors
                                                        .lightThinTextGray,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 4.0,
                                      children: [
                                        Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    Routes.followingsScreen,
                                                    arguments: {
                                                      "username":
                                                          userProfile.username
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      userProfile
                                                              .followingsCount ??
                                                          "0",
                                                      style: const TextStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 4),
                                                    const Text(
                                                      "Following",
                                                      style: TextStyle(
                                                        color: AppColors
                                                            .lightThinTextGray,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ]),
                                        Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    Routes.followersScreen,
                                                    arguments: {
                                                      "username":
                                                          userProfile.username
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      userProfile
                                                              .followersCount ??
                                                          "0",
                                                      style: const TextStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      userProfile.followersCount ==
                                                              "1"
                                                          ? 'Follower'
                                                          : 'Followers',
                                                      style: const TextStyle(
                                                        color: AppColors
                                                            .lightThinTextGray,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ]),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Visibility(
                                      visible: userProfile.isMuted!,
                                      child: Row(children: [
                                        const Text(
                                          "You have muted posts from this account ",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            bool confirmUnmute =
                                                await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      AppColors.blackColor,
                                                  title: Text(
                                                    'Unmute ${userProfile.name}?',
                                                    style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: 'Chirp',
                                                      // Use the font family name specified in pubspec.yaml
                                                      color: Colors
                                                          .white, // Set the text color to white
                                                    ),
                                                  ),
                                                  content: const CustomText(
                                                    'Posts from this account will now be allowed in your Home timeline.',
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
                                                        'Unmute',
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
                                            if (confirmUnmute == true) {
                                              bool success = await ref
                                                  .read(profileNotifierProvider
                                                      .notifier)
                                                  .toggleMuteStatus(
                                                      userProfile.username!);
                                              showFlushbar(
                                                  context,
                                                  success,
                                                  "You unmuted ${userProfile.username}",
                                                  " Unmute failed, try again later");
                                            }
                                          },
                                          child: const Text(
                                            "Unmute",
                                            style: TextStyle(
                                              color: AppColors.TwitterBlue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              TabBar(
                                controller: _tabcontroller,
                                indicatorColor:
                                    Colors.white, // Set your desired color here
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      "Posts",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 16,
                                        fontFamily:
                                            'Chirp', // Set your custom font here
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Likes",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 16,
                                        fontFamily:
                                            'Chirp', // Set your custom font here
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                        ),
                      ],
                      body: Visibility(
                        visible: userProfile.isBlocked != true,
                        replacement: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              "@${userProfile.username} is blocked",
                              style: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                                fontFamily: 'Chirp',
                              ),
                            ),
                          ),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (ref
                                    .watch(profileNotifierProvider)
                                    .tweetsLoading ==
                                false) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabcontroller,
                                      children: [
                                        // Posts Tab
                                        SmartRefresher(
                                          controller: _tweetsController,
                                          header: const ClassicHeader(
                                            releaseText: 'Release to refresh',
                                            refreshingText: 'Refreshing...',
                                            completeText: 'Refresh completed',
                                            failedText: 'Refresh failed',
                                            idleText: 'Pull down to refresh',
                                          ),
                                          enablePullDown: true,
                                          enablePullUp: true,
                                          footer: const ClassicFooter(
                                            loadingText: 'Load for more',
                                          ),
                                          onLoading: _onTweetsLoading,
                                          onRefresh: _onRefresh,
                                          child: ref
                                                  .watch(
                                                      profileNotifierProvider)
                                                  .profileTweetsResponse
                                                  .data
                                                  .isEmpty
                                              ? const Center(
                                                  child: Text(
                                                    "No Tweets",
                                                    style: const TextStyle(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 22,
                                                      fontFamily: 'Chirp',
                                                    ),
                                                  ),
                                                )
                                              : ListView.separated(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: ref
                                                      .watch(
                                                          profileNotifierProvider)
                                                      .profileTweetsResponse
                                                      .data
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          InkWell(
                                                    child: TweetCompose(
                                                      tweet: ref
                                                          .watch(
                                                              profileNotifierProvider)
                                                          .profileTweetsResponse
                                                          .data[index],
                                                      index: index,
                                                      whom:
                                                          1, //0->Home,1->Profile,
                                                      inMyProfile:
                                                          myUser!.username ==
                                                                  userProfile
                                                                      .username
                                                              ? 1
                                                              : 0,
                                                      //if i am in myProfile-> 1 , Other profile-> 1
                                                    ),
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                        context,
                                                        Routes.tweetScreen,
                                                        arguments: {
                                                          "tweet": ref
                                                              .watch(
                                                                  profileNotifierProvider)
                                                              .profileTweetsResponse
                                                              .data[index],
                                                          "index": index,
                                                          "whom":
                                                              1, //0->Home , 1->Profile
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          const Divider(),
                                                ),
                                        ),
                                        SmartRefresher(
                                          controller: _LikedTweetsController,
                                          header: const ClassicHeader(
                                            releaseText: 'Release to refresh',
                                            refreshingText: 'Refreshing...',
                                            completeText: 'Refresh completed',
                                            failedText: 'Refresh failed',
                                            idleText: 'Pull down to refresh',
                                          ),
                                          enablePullDown: true,
                                          enablePullUp: true,
                                          footer: const ClassicFooter(
                                            loadingText: 'Load for more',
                                          ),
                                          onLoading: _onLikedTweetsLoading,
                                          onRefresh: _onRefresh,
                                          child: ref
                                                  .watch(
                                                      profileNotifierProvider)
                                                  .profileLikedTweetsResponse
                                                  .data
                                                  .isEmpty
                                              ? const Center(
                                                  child: Text(
                                                    "No Tweets",
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 22,
                                                      fontFamily: 'Chirp',
                                                    ),
                                                  ),
                                                )
                                              : ListView.separated(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: ref
                                                      .watch(
                                                          profileNotifierProvider)
                                                      .profileLikedTweetsResponse
                                                      .data
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          InkWell(
                                                    child: TweetCompose(
                                                      tweet: ref
                                                          .watch(
                                                              profileNotifierProvider)
                                                          .profileLikedTweetsResponse
                                                          .data[index],
                                                      index: index,
                                                      whom:
                                                          2, //0->Home,1->Profile,2->ProfileLikedTweets
                                                      inMyProfile:
                                                          myUser!.username ==
                                                                  userProfile
                                                                      .username
                                                              ? 1
                                                              : 0,
                                                      //if i am in myProfile-> 1 , Other profile-> 1
                                                    ),
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                        context,
                                                        Routes.tweetScreen,
                                                        arguments: {
                                                          "tweet": ref
                                                              .watch(
                                                                  profileNotifierProvider)
                                                              .profileLikedTweetsResponse
                                                              .data[index],
                                                          "index": index,
                                                          "whom":
                                                              2, //0->Home , 1->Profile
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          const Divider(),
                                                ),
                                        ),
                                        // Text("data")
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              // You can replace this with a loading indicator or any other UI while loading
                              return const Center(
                                  child: SizedBox(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                  strokeWidth: 1,
                                ),
                              ));
                            }
                          },
                        ),
                      ),
                    ),
            ),
    );
  }

  void _onRefresh() async {
    tweetsPageIndex = 1;
    likedTweetsPageIndex = 1;
    await loadData();
    _controller.refreshCompleted();
    _tweetsController.refreshCompleted();
    _LikedTweetsController.refreshCompleted();
  }

  void _onTweetsLoading() async {
    final provider = ref.read(profileNotifierProvider);

    if (provider.profileTweetsResponse.data.length ==
        provider.profileTweetsResponse.total) {
      _tweetsController.loadNoData();
    } else {
      if (tweetsPageIndex == 0) tweetsPageIndex++;
      tweetsPageIndex++;
      await ref
          .read(profileNotifierProvider.notifier)
          .getUserTweets(username: widget.username!, page: tweetsPageIndex);
      _tweetsController.loadComplete();
    }
  }

  void _onLikedTweetsLoading() async {
    final provider = ref.read(profileNotifierProvider);

    if (provider.profileLikedTweetsResponse.data.length ==
        provider.profileLikedTweetsResponse.total) {
      _LikedTweetsController.loadNoData();
    } else {
      if (likedTweetsPageIndex == 0) likedTweetsPageIndex++;
      likedTweetsPageIndex++;
      await ref.read(profileNotifierProvider.notifier).getUserLikedTweets(
          username: widget.username!, page: likedTweetsPageIndex);
      _LikedTweetsController.loadComplete();
    }
  }

  loadData() async {
    await ref
        .read(profileNotifierProvider.notifier)
        .fetchUserProfile(widget.username!);
    await ref.read(profileNotifierProvider.notifier).getUserTweets(
          username: widget.username!,
          page: tweetsPageIndex,
        );
    await ref.read(profileNotifierProvider.notifier).getUserLikedTweets(
          username: widget.username!,
          page: likedTweetsPageIndex,
        );
  }

  bool get wantKeepAlive => true;

  String formatDate(String dateString, bool birthdate) {
    DateTime date = DateTime.parse(dateString);
    List<String> monthNames = [
      "",
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    if (birthdate) {
      return " Born ${monthNames[date.month]} ${date.day}, ${date.year}";
    } else {
      return " Joined ${monthNames[date.month]} ${date.year}";
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void showFlushbar(
      BuildContext context, bool success, String successful, String failed) {
    Flushbar(
      message: success ? successful : failed,
      duration: const Duration(seconds: 3),
      backgroundColor: success ? AppColors.TwitterBlue : AppColors.warningColor,
    ).show(context);
  }
}
