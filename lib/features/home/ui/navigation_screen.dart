import 'package:flutter/cupertino.dart';
import 'package:x_clone/features/home/ui/widget/main_drawer_widget.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Notifications/ui/notifications_screen.dart';
import '../../chat/ui/chat_screen.dart';
import '../../search/ui/search_screen.dart';
import '../data/providers/home_provider.dart';
import 'home_screen.dart';

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
    const ChatScreen(),
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final homeProvider = ref.watch(homeNotifierProvider);

    return Scaffold(
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
                icon: Icon(
                  ref.read(homeNotifierProvider).screenIndex == 3
                      ? Icons.mail
                      : Icons.mail_outlined,
                ),
                label: 'Messages',
              ),
            ]),
      ),
      body: _children[homeProvider.screenIndex],
    );
  }

  void onTabTapped(int index) {
    ref.read(homeNotifierProvider.notifier).changePageIndex(index);
  }

  @override
  bool get wantKeepAlive => true;
}
