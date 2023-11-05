import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationsScreen extends StatefulHookConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child:  Center(
          child: Text("Notifications Screen"),
        ),
      ),
    );
  }

}
