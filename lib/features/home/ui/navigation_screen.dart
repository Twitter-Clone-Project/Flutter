import 'package:flutter/cupertino.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/ui/widget/main_drawer_widget.dart';
import 'package:x_clone/features/notifications/ui/notifications_screen.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/web_services/socket_services.dart';

import '../../../app/widgets/animation/animated_fade_out_in.dart';
import '../../chat/data/providers/chat_provider.dart';
import '../../chat/ui/chats_screen.dart';
import '../../search/ui/search_screen.dart';
import '../data/providers/home_provider.dart';
import 'home_screen.dart';

/// A screen widget that displays a navigation bar at the bottom and switches between different screens based on user interaction.
///
/// The [NavigationScreen] widget is a stateful widget that manages the state of the currently selected screen index and renders the appropriate screen based on the selected index.
/// It also provides a bottom navigation bar for easy navigation between screens.
class NavigationScreen extends StatefulHookConsumerWidget {
  const NavigationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationsScreen(),
    const ChatsScreen(),
  ];

  @override
  void initState() {
    // Initialize the state of the widget.
    // This method is called when the widget is inserted into the widget tree.
    // It is used to perform one-time initialization tasks.
    // In this case, it sets up event listeners and fetches initial data.
    Future.delayed(const Duration(seconds: 0), () {
      SocketClient.onMessageReceive(
          (data) => ref.read(chatNotifierProvider.notifier).onMessageReceive(data));
      SocketClient.statusOfContact((data){});
      ref.read(chatNotifierProvider.notifier).getUnseenConversationsCnt();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final homeProvider = ref.watch(homeNotifierProvider);

    return SafeArea(
      child: Scaffold(
        drawer: const MainDrawer(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 10, // Blur radius
                offset: Offset(0, 3), // Offset from top
              ),
            ],
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Disable animation

              currentIndex: homeProvider.screenIndex,
              onTap: onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    ref.read(homeNotifierProvider).screenIndex == 0
                        ? Icons.home_filled
                        : Icons.home_outlined,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    ref.read(homeNotifierProvider).screenIndex == 1
                        ? Icons.search_sharp
                        : Icons.search_outlined,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    ref.read(homeNotifierProvider).screenIndex == 2
                        ? CupertinoIcons.bell_fill
                        : CupertinoIcons.bell,
                  ),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: ref.watch(chatNotifierProvider).unseenCnt !=
                          '0' // Checking if the value is not '0'
                      ? Badge(
                          backgroundColor: AppColors.primaryColor,
                          textColor: Colors.white,
                          label: AnimatedFadeOutIn<String>(
                            initialData: '0',
                            data: ref.watch(chatNotifierProvider).unseenCnt,
                            builder: (value) => Text(value),
                          ),
                          child: Icon(
                            ref.read(homeNotifierProvider).screenIndex == 3
                                ? Icons.mail
                                : Icons.mail_outlined,
                          ),
                        )
                      : Icon(
                          ref.read(homeNotifierProvider).screenIndex == 3
                              ? Icons.mail
                              : Icons.mail_outlined,
                        ),
                  label: 'Messages',
                ),
              ]),
        ),
        body: _children[homeProvider.screenIndex],
      ),
    );
  }

  /// Callback function that is called when a tab is tapped in the bottom navigation bar.
  ///
  /// The [index] parameter represents the index of the tapped tab.
  /// This function updates the selected screen index in the [homeProvider] and triggers a rebuild of the widget.
  void onTabTapped(int index) {
    ref.read(homeNotifierProvider.notifier).changePageIndex(index);
  }

  @override
  bool get wantKeepAlive => true;
}
