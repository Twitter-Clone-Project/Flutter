import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';

import '../../../app/routes.dart';

import 'package:x_clone/web_services/web_services.dart';

import '../../../app/widgets/tweet_UI.dart';
import '../../../theme/app_assets.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  final RefreshController _controller = RefreshController();
  int pageIndex = 0;
  late TabController _tabcontroller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      var username = ref.read(authNotifierProvider).user?.username;
      ref.read(profileNotifierProvider.notifier).fetchUserProfile(username!);


    });
    _tabcontroller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final userProfile = ref.watch(profileNotifierProvider).userProfile;
    print("Opening profile of ${userProfile.username}");
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
            iconTheme: const IconThemeData(color: Colors.white,
            ),
            expandedHeight: backgroundImageHeight + profileImageDiameter / 2,
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
                    image: NetworkImage(
                        userProfile.bannerUrl
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
                        Container(
                          padding: EdgeInsets.all(2.5), // Adjust the padding to control the border width
                          decoration: BoxDecoration(
                            color: Colors.black, // Set the color of the border
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
                      SizedBox(height: 16),
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
                              Text(userProfile.location ?? "No Location Provided",
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
                                url_string: userProfile.website ?? "NoWebsiteProvided.com",
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
                            Text(userProfile.followingsCount?? "0",
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
                              userProfile.followersCount?? "0",
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
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: TabBarView(

                          controller: _tabcontroller,
                          children: [
                            Scaffold(
                        body: ref.watch(profileNotifierProvider).loading?

                        const Center(child: CircularProgressIndicator()):
                        ref.watch(profileNotifierProvider).profileTweetsResponse.data.isEmpty
                            ? const Center(
                          child: Text("No Tweets"),
                        )

                            :Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: CircleAvatar(
                                      child: CachedNetworkImage(
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        width: MediaQuery.of(context).size.height * 0.05,
                                        fit: BoxFit.scaleDown ,
                                        color: AppColors.primaryColor,
                                        imageUrl: "${ref.watch(profileNotifierProvider).profileTweetsResponse.data[0].user?.profileImageURL}",
                                        placeholder: (context, url) =>
                                            SvgPicture.asset(AppAssets.logo,colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn) , fit: BoxFit.cover),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(AppAssets.logo,colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn) , fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
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
                                  footer: const ClassicFooter(
                                    loadingText: 'Load for more',
                                  ),
                                  onLoading: _onLoading,
                                  onRefresh: _onRefresh,
                                  child: ListView.separated(
                                    itemCount: ref.watch(profileNotifierProvider).profileTweetsResponse.data!.length,
                                    itemBuilder: (BuildContext context, int index) =>TweetCompose(
                                      tweet: ref.watch(profileNotifierProvider).profileTweetsResponse.data![index],
                                    ), separatorBuilder: (BuildContext context, int index) => const Divider(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        floatingActionButton: FloatingActionButton(
                          backgroundColor: AppColors.primaryColor,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.profileScreen);
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                          ),
                        ),
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

    );}



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
    await ref.read(profileNotifierProvider.notifier).fetchUserProfile("mou");

  }
  @override
  bool get wantKeepAlive => true;
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





