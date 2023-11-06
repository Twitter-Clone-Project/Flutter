import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/home/ui/widget/main_drawer_widget.dart';

import '../../../app/widgets/animation/shimmer/shimmer_loading_anim.dart';
import '../data/providers/home_provider.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      // ref.read(homeNotifierProvider.notifier).getHomeData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final homeProvider = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
