import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/web_services/notifications_services.dart';
import 'package:x_clone/web_services/web_services.dart';

import '../features/chat/data/model/chats_response.dart' as chats;

class SocketClient {
  static handleNotificationReceiveWithNotification(dynamic data) async {
    var notificationData = NotificationData.fromJson(data);

    await NotificationServices.showNotification(
      title: "Notification from ${notificationData.senderUsername}",
      body: notificationData.content,
      id: notificationData.notificationId,
    );
  }

  static handleMessageReceiveWithNotification(Map<String, dynamic> data) async {
    print(data);
    // chats.Message message = chats.Message.fromJson(data);
    await NotificationServices.showNotification(
      title: "Message from ${data["senderId"]}",
      body: data["text"] ?? "",
      id: data["conversationId"] ?? "",
    );
  }

  static final IO.Socket socket = IO.io(
    EndPoints.socketUrl,
    <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    },
  );

  static connect(String userId) {
    socket.onConnect((_) {
      print("socccccccccccccccccccccccket connected");
      socket.emit("add-user", {
        "userId": userId,
      });
    });

    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.I0 server disconnected'));

    socket.on("notification-receive", (data) async {
      await handleNotificationReceiveWithNotification(data);
    });
    socket.on("msg-receive", (data) async {
      await handleMessageReceiveWithNotification(data);
    });

    socket.connect();
  }

  static disconnectNotification() {
    socket.off("notification-receive");
    socket.on("notification-receive", (data) async {
      await handleNotificationReceiveWithNotification(data);
    });
  }

  static onNotificationReceive(Function callback) {
    socket.off("notification-receive");
    socket.on("notification-receive", (data) {
      callback(data);
    });
  }

  static markNotificationsAsSeen(String userId) {
    socket.emit("mark-notifications-as-seen", {
      "userId": userId,
    });
  }

  static sendMessage(
      {required String conversationId,
      required String text,
      required String receiverId,
      required String senderId}) {
    socket.emit("msg-send", {
      "conversationId": conversationId,
      "text": text,
      "receiverId": receiverId,
      "senderId": senderId,
      "isSeen": false,
    });
  }

  static chatOpen(
      {required String conversationId,
      required String senderId,
      required String contactId}) {
    print("oooooooooooooooooooooooooooooooopen");

    socket.emit("chat-opened", {
      "conversationId": conversationId,
      "userId": senderId,
      "contactId": contactId,
    });
  }

  static chatClose(
      {required String conversationId, required String contactId}) {
    socket.emit("chat-closed", {
      "conversationId": conversationId,
      "contactId": contactId,
    });
    socket.off("msg-receive");
    socket.on("msg-receive", (data) async {
      await handleMessageReceiveWithNotification(data);
    });
  }

  static onMessageReceive(Function callback) {
    socket.off("msg-receive");
    socket.on("msg-receive", (data) {
      callback(data);
    });
  }
}
