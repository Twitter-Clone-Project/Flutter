import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';

import '../../auth/data/providers/auth_provider.dart';
import '../../home/data/providers/home_provider.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Center(
          child: CustomButton(text: "Logout", onPressed: (){
            ref.read(homeNotifierProvider.notifier).changePageIndex(0);
            ref.read(authNotifierProvider.notifier).logout();
          }),
        ),
      ),
    );
  }

}
