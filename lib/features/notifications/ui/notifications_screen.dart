import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/app.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/notifications/data/providers/notification_provider.dart';
import 'package:x_clone/theme/app_colors.dart';

class NotificationsScreen extends StatefulHookConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  // Assuming you have a list of notifications

  late List<Notification> notifications;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(notificationsNotifierProvider.notifier)
          .getNotifications(page: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(notificationsNotifierProvider);
    final notificationsList = notifications.notifications.data
        .map((e) => Notification(
              notificationId: e.notificationId,
              timestamp: e.timestamp,
              isSeen: e.isSeen,
              content: e.content,
              senderImgUrl: e.senderImgUrl,
              senderUsername: e.senderUsername,
              type: e.type,
            ))
        .toList();
    final isLoading = ref.watch(notificationsNotifierProvider).loading;

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: SafeArea(
              child: ListView.builder(
                itemCount: ref
                    .watch(notificationsNotifierProvider)
                    .notifications
                    .data
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return notificationsList[index];
                },
              ),
            ),
          );
  }
}

class Notification extends StatefulWidget {
  String notificationId;
  bool isSeen;
  String content;
  String senderImgUrl;
  String timestamp;
  String senderUsername;
  String type;

  Notification({
    Key? key,
    required this.notificationId,
    required this.timestamp,
    required this.isSeen,
    required this.content,
    required this.senderImgUrl,
    required this.senderUsername,
    required this.type,
  }) : super(key: key) {}

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    final notificationId = widget.notificationId;
    final isSeen = widget.isSeen;
    final content = widget.content;
    final senderImgUrl = widget.senderImgUrl;
    final timestamp = widget.timestamp;
    final senderUsername = widget.senderUsername;
    final type = widget.type;

    return InkWell(
      onTap: () {
        switch (type) {
          case "FOLLOW":
            Navigator.pushNamed(
              context,
              Routes.profileScreen,
              arguments: senderUsername,
            );
            break;
          case "CHAT":
            // TODO: (Yousef Rabia) Handle this case.
            // Navigator.pushNamed(
            //   context,
            //   Routes.chatScreen,
            //   arguments: senderUsername,
            // );
            break;
          case "MENTION":
            Navigator.pushNamed(
              context,
              Routes.tweetScreen,
              arguments: notificationId,
            );
            break;
          case "UNFOLLOW":
            Navigator.pushNamed(
              context,
              Routes.profileScreen,
              arguments: senderUsername,
            );
            break;
        }
        ;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.profileScreen,
                  arguments: senderUsername,
                );
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(senderImgUrl),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.profileScreen,
                          arguments: senderUsername,
                        );
                      },
                      child: Text(
                        "@$senderUsername",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(
                    content,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.lightThinTextGray,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
