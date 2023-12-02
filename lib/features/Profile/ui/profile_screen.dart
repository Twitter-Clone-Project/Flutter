import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/Profile/data/states/profile_state.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';

import '../../../app/routes.dart';

import 'package:x_clone/web_services/web_services.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {

  late TabController _tabcontroller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(profileNotifierProvider.notifier).fetchUserProfile("mou");


    });
    _tabcontroller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final userProfile = ref.watch(profileNotifierProvider).userProfile;

    // final isLoading = userProfileState.isLoading;

    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;
    final FormatNumber =
        NumberFormat.compact(locale: context.locale.toString()).format;

    // should be compared with user profile when its passed to the widget to show different options
    var isUserProfile = false;

    var actionMenu = isUserProfile ? ["Share"] : ["Share", "Block", "Mute"];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: backgroundImageHeight + profileImageDiameter / 2,
            floating: false,
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
                  child: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: profileImageDiameter / 2,
                          backgroundImage: NetworkImage(
                            userProfile.imageUrl ??
                                'https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                          ),
                        ),
                        // Add your button here
                        CustomButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.editProfileScreen);
                          },
                          text: 'Edit Profile',
                          filled: false,
                          horizontalPadding: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned for the button at the bottom right

              ],
            ),
            actions: [
              CircularIcon(
                icon: Icons.search,
                onPress: () {
                  _onRefresh();
                },
              ),
              PopupMenuButton(
                child: const CircularIcon(icon: Icons.more_vert),
                onSelected: (value) {},
                itemBuilder: (context) {
                  return actionMenu
                      .map((Action) =>
                          PopupMenuItem(value: Action, child: Text(Action)))
                      .toList();
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userProfile.name ?? "",
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "@${userProfile.username}",
                            style: const TextStyle(
                              color: AppColors.lightThinTextGray,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            userProfile.bio ?? "",
                            softWrap: true,
                            style: const TextStyle(color: AppColors.whiteColor),
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
                              Text(userProfile.location ?? "",
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
                                url_string: userProfile.website ?? "",
                              )
                            ],
                          ),
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                fill: 1,
                                color: AppColors.lightThinTextGray,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Joined February 2017",
                                style: TextStyle(
                                  color: AppColors.lightThinTextGray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(FormatNumber(96),
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
                              FormatNumber(10100),
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
                          Tab(text: "Replies"),
                          Tab(text: "Media"),
                          Tab(text: "Likes"),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: TabBarView(
                          
                          controller: _tabcontroller,
                          children: [
                            ListView(
                              shrinkWrap: true,
                              children: [
                                for (int i = 1; i <= 150; i++) Text("$i"),
                              ],
                            ),
                            const Text("1"),
                            const Text("3"),
                            const Text("4"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  void _onRefresh() async {
    await loadData();
    // Add a setState or refresh call here if needed
    // _tabcontroller.refreshCompleted();
  }

  // void _onLoading() async {
  //   final provider = ref.read(homeNotifierProvider);
  //
  //   if (provider.homeResponse.data?.length ==
  //       provider.homeResponse.total) {
  //     _controller.loadNoData();
  //   } else {
  //     if (pageIndex == 0) pageIndex++;
  //     pageIndex++;
  //     await loadData();
  //     _controller.loadComplete();
  //   }
  // }

  loadData() async {
    await ref.read(profileNotifierProvider.notifier).fetchUserProfile("mou");

  }
  // @override
  // bool get wantKeepAlive => true;
}

class _AppBarButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const _AppBarButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: AppColors.TwitterBlue,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: TextButton(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.whiteColor,
          ),
          onPressed: onPress),
    );
  }
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
            style: TextStyle(
                color: AppColors.TwitterBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
        onTap: () => _launchUrl());
  }
}
