import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/web_services/notifications_services.dart';
import 'package:x_clone/web_services/web_services.dart';

import '../features/chat/data/model/chats_response.dart' as chats;
import '../utils/utils.dart';

class SocketClient {
  static handleNotificationReceiveWithNotification(dynamic data) async {
    var notificationData = NotificationData.fromJson(data);

    await NotificationServices.showNotification(
      title: "Notification from ${notificationData.senderUsername}",
      body: notificationData.content,
      id: notificationData.notificationId,
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
      socket.emit("add-user", {
        "userId": userId,
      });
    });
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.I0 server disconnected')) ;
    socket.on("notification-receive", (data) async {
      handleNotificationReceiveWithNotification(data);
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

  static sendMessage({required String conversationId, required String text ,required String receiverId,required String senderId}) {
    socket.emit("msg-send", {
      "conversationId": conversationId,
      "text": text,
      "receiverId": receiverId,
      "senderId": senderId,
      "isSeen": false,
    });
  }
  static chatOpen({required String conversationId, required String senderId, required String contactId}) {
    socket.emit("chat-opened", {
      "conversationId": conversationId,
      "userId": senderId,
      "contactId":contactId,
    });
  }
  static chatClose({required String conversationId,required String contactId}) {
    socket.emit("chat-closed", {
      "conversationId": conversationId,
      "contactId":contactId,
    });
  }
  static onMessageReceive(Function callback) {
    socket.off("msg-receive");
    socket.on("msg-receive", (data) {
      print(data);
      callback(data);
    });
  }
  static statusOfContact(Function callback) {
    socket.off("status-of-contact");
    socket.on("status-of-contact", (data) {
      print(data);
      if(data["inConversation"]==true)
        {
          openConversationIds.add(data["conversationId"]);
          callback(data);
        }
      else if(data["inConversation"]==false)
        {
          openConversationIds.remove(data["conversationId"]);
        }
    });
  }
}