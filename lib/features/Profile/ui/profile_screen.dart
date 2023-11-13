import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    var backgroundImageHeight = mediaQuery.size.height * 0.15;
    var profileImageDiameter = mediaQuery.size.width * 0.25;
    final FormatNumber =
        NumberFormat.compact(locale: context.locale.toString()).format;

    // should be compared with user profile when its passed to the widget to show different options
    var isUserProfile = false;

    var actionMenu = isUserProfile ? ["Share"] : ["Share", "Block", "Mute"];

    ref.read(authNotifierProvider).user?.id;

    return Scaffold(
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: [
          Column(
            children: [
              Container(
                width: mediaQuery.size.width,
                height: backgroundImageHeight,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      "https://pbs.twimg.com/profile_banners/828032731023937536/1678008682/1500x500"),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularIcon(icon: Icons.arrow_back),
                      Row(
                        children: [
                          CircularIcon(icon: Icons.search),
                          SizedBox(width: 16),
                          PopupMenuButton(
                              child: CircularIcon(icon: Icons.more_vert),
                              onSelected: (value) {},
                              itemBuilder: (context) {
                                return actionMenu
                                    .map((Action) => PopupMenuItem(
                                        value: Action, child: Text(Action)))
                                    .toList();
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: backgroundImageHeight + 8 - profileImageDiameter * 0.5,
            width: mediaQuery.size.width,
            child: Container(
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      bottom: BorderSide(color: AppColors.lightThinTextGray))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: profileImageDiameter,
                              width: profileImageDiameter,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.pureBlack,
                                      style: BorderStyle.solid,
                                      width: 6),
                                  borderRadius: BorderRadius.circular(560),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://pbs.twimg.com/profile_images/1694885283081457665/aK943S-s_400x400.jpg"))),
                            ),
                            Wrap(
                              alignment: WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8,
                              children: [
                                CircularIcon(
                                  icon: Icons.notification_add_outlined,
                                  border: 2,
                                ),
                                CircularIcon(
                                  icon: Icons.email_outlined,
                                  border: 2,
                                ),
                                CustomButton(
                                  text: "Follow",
                                  filled: false,
                                  horizontalPadding: 32,
                                  verticalPadding: 4,
                                  onPressed: () => {},
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "randy",
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "@bigrando420",
                              style:
                                  TextStyle(color: AppColors.lightThinTextGray),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Game designer. Working on a 2D survival crafter. Building a game studio one step at a time. If you've got experience I'd love to chat.",
                              softWrap: true,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Wrap(spacing: 8.0, runSpacing: 4.0, children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                fill: 1,
                                color: AppColors.lightThinTextGray,
                              ),
                              SizedBox(width: 4),
                              Text("Thailand",
                                  style: TextStyle(
                                      color: AppColors.lightThinTextGray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.link_outlined,
                                fill: 1,
                                color: AppColors.lightThinTextGray,
                              ),
                              SizedBox(width: 4),
                              Link(
                                  url_string:
                                      "https://youtube.com/@bigrando420")
                            ],
                          ),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.calendar_month,
                              fill: 1,
                              color: AppColors.lightThinTextGray,
                            ),
                            SizedBox(width: 4),
                            Text("Joined February 2017",
                                style: TextStyle(
                                    color: AppColors.lightThinTextGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold))
                          ])
                        ]),
                        SizedBox(height: 16),
                        Wrap(spacing: 8.0, runSpacing: 4.0, children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(FormatNumber(96),
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            const Text(
                              "Following",
                              style: const TextStyle(
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
                            const Text("Followers",
                                style: TextStyle(
                                    color: AppColors.lightThinTextGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ]),
                        // account you follow

                        SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _AppBarButton(
                                text: "Posts",
                                onPress: () => {},
                              ),
                              _AppBarButton(
                                text: "Replies",
                                onPress: () => {},
                              ),
                              _AppBarButton(
                                text: "Media",
                                onPress: () => {},
                              ),
                              _AppBarButton(
                                text: "Likes",
                                onPress: () => {},
                              ),
                            ])
                      ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
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
    return Container(
      child: IconButton.outlined(
        icon: Icon(
          icon,
          color: AppColors.whiteColor,
        ),
        onPressed: onPress ?? () => {},
        splashRadius: 18,
        iconSize: 18,
        padding: const EdgeInsets.all(6),
        constraints: const BoxConstraints(),
      ),
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.5),
        border: Border.all(
          color: AppColors.borderDarkGray,
          style: BorderStyle.solid,
          width: border?? 0,
        ),
        borderRadius: BorderRadius.circular(560),
      ),
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
