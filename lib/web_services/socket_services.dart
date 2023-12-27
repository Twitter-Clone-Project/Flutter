import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/web_services/notifications_services.dart';
import 'package:x_clone/web_services/web_services.dart';

import '../features/chat/data/model/chats_response.dart' as chats;
import '../utils/utils.dart';

class SocketClient {
  static Function(NotificationData) _onFollowReceive = (notification) {};
  static Function(NotificationData) _onUnFollowReceive = (notification) {};
  static Function(NotificationData) _onNotificationReceive = (notification) {};

  /// Handles the receiving of a notification with the provided [data].
  ///
  /// This function takes in a dynamic [data] parameter and converts it into a [NotificationData] object.
  /// It then uses the [NotificationServices.showNotification] method to display a notification with the
  /// title as "Notification from {senderUsername}" and the body as the content of the notification data.
  /// The [id] parameter is used to uniquely identify the notification.
  ///
  /// Example:
  /// ```dart
  /// dynamic data = {
  ///   "senderUsername": "JohnDoe",
  ///   "content": "You have a new message",
  ///   "notificationId": 12345
  /// };
  ///
  /// handleNotificationReceiveWithNotification(data);
  /// ```
  static handleNotificationReceiveWithNotification(
      Map<String, dynamic> data) async {
    var notificationData = NotificationData.fromJson(data);

    await NotificationServices.showNotification(
      title: "Notification from ${notificationData.senderUsername}",
      body: notificationData.content,
      id: notificationData.notificationId,
    );
  }

  /// Handles the received message and displays a notification.
  ///
  /// This function takes in a [Map] of type [String] and [dynamic] representing the received message data.
  /// It prints the received data and converts it into a [chats.Message] object using the [fromJson] method.
  /// If the message is not sent by the current user, it shows a notification with the sender's username as the title
  /// and the message text as the body. The notification ID is set to the message ID if available, otherwise an empty string is used.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> data = {
  ///   "senderUsername": "JohnDoe",
  ///   "text": "Hello, how are you?",
  ///   "isFromMe": false,
  ///   "messageId": "123456789"
  /// };
  ///
  /// handleMessageReceiveWithNotification(data);
  /// ```
  ///
  /// Note: This function assumes that the [NotificationServices.showNotification] method is implemented and available.
  static handleMessageReceiveWithNotification(Map<String, dynamic> data) async {
    chats.Message message = chats.Message.fromJson(data);
    if (message.isFromMe != null && message.isFromMe == true) return;

    await NotificationServices.showNotification(
      title: "Message from ${message.senderUsername}",
      body: message.text ?? "",
      id: message.messageId ?? "",
    );
  }

  static final IO.Socket socket = IO.io(
    EndPoints.socketUrl,
    <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    },
  );

  /// Connects to the socket server and adds the user with the specified userId.
  ///
  /// This function establishes a connection to the socket server and emits an "add-user" event
  /// with the userId as a parameter. It also handles connect errors and disconnection events.
  /// When a "notification-receive" event is received, it calls the [handleNotificationReceiveWithNotification]
  /// function to handle the notification data.
  ///
  /// Example:
  /// ```dart
  /// SocketServices.connect("12");
  /// ```
  static connect(
    String userId, {
    Function(NotificationData)? onFollow,
    Function(NotificationData)? onUnFollow,
    Function(NotificationData)? onMessage,
    Function(NotificationData)? onNotification,
  }) {
    socket.onConnect((_) {
      socket.emit("add-user", {
        "userId": userId,
      });
    });
    SocketClient._onFollowReceive = onFollow ?? (notifiaction) {};
    SocketClient._onUnFollowReceive = onUnFollow ?? (notifiaction) {};
    SocketClient._onNotificationReceive = onNotification ?? (notifiaction) {};

    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.I0 server disconnected'));

    SocketClient.disconnectNotification();

    socket.connect();
  }

  /// Disconnects the socket from the "notification-receive" event and attaches a new event listener.
  ///
  /// This function is responsible for disconnecting the socket from the "notification-receive" event
  /// and attaching a new event listener that calls the [handleNotificationReceiveWithNotification] function
  /// when a notification is received.
  ///
  /// Example:
  /// ```dart
  /// disconnectNotification();
  /// ```
  /// In this example, the `disconnectNotification` function is called to disconnect the socket from the
  /// "notification-receive" event and attach a new event listener.
  static disconnectNotification() {
    socket.off("notification-receive");
    socket.on("notification-receive", (data) async {
      var notificationData = NotificationData.fromJson(data);
      if (notificationData.type == "FOLLOW")
        SocketClient._onFollowReceive(notificationData);
      else if (notificationData.type == "UNFOLLOW")
        SocketClient._onUnFollowReceive(notificationData);
      SocketClient._onNotificationReceive(notificationData);

      await handleNotificationReceiveWithNotification(data);
    });
  }

  /// Listens for notification receive events and invokes the provided [callback] function.
  ///
  /// This function registers a callback function to be executed when a "notification-receive" event is received from the socket.
  /// It first removes any existing event listeners for "notification-receive" to avoid duplicate callbacks.
  /// Then, it adds a new event listener for "notification-receive" that invokes the [callback] function with the received data.
  ///
  /// Example:
  /// ```dart
  /// SocketServices.onNotificationReceive((data) {
  ///   print("Received notification: $data");
  /// });
  /// ```
  static onNotificationReceive(Function callback) {
    socket.off("notification-receive");
    socket.on("notification-receive", (data) {
      var notificationData = NotificationData.fromJson(data);
      if (notificationData.type == "FOLLOW")
        SocketClient._onFollowReceive(notificationData);
      else if (notificationData.type == "UNFOLLOW")
        SocketClient._onUnFollowReceive(notificationData);
      SocketClient._onNotificationReceive(notificationData);

      callback(data);
    });
  }

  /// Marks the notifications as seen for a specific user.
  ///
  /// This function emits a socket event to mark the notifications as seen for the user
  /// with the provided [userId].
  ///
  /// Example:
  /// ```dart
  /// markNotificationsAsSeen("12");
  /// ```
  static markNotificationsAsSeen(String userId) {
    socket.emit("mark-notifications-as-seen", {
      "userId": userId,
    });
  }

  /// Sends a message through the socket.
  ///
  /// The [conversationId] is the ID of the conversation.
  /// The [text] is the content of the message.
  /// The [receiverId] is the ID of the message receiver.
  /// The [senderId] is the ID of the message sender.
  ///
  /// Example:
  /// ```dart
  /// sendMessage(
  ///   conversationId: "123456",
  ///   text: "Hello, how are you?",
  ///   receiverId: "7890",
  ///   senderId: "1234",
  /// );
  /// ```
  static sendMessage({
    required String conversationId,
    required String text,
    required String receiverId,
    required String senderId,
  }) {
    socket.emit("msg-send", {
      "conversationId": conversationId,
      "text": text,
      "receiverId": receiverId,
      "senderId": senderId,
    });
  }

  /// Opens a chat by emitting a "chat-opened" event to the socket server.
  ///
  /// The [conversationId] is the ID of the conversation.
  /// The [senderId] is the ID of the user who is opening the chat.
  /// The [contactId] is the ID of the contact with whom the chat is being opened.
  ///
  /// Example:
  /// ```dart
  /// chatOpen(
  ///   conversationId: "12345",
  ///   senderId: "12",
  ///   contactId: "23",
  /// );
  /// ```
  static chatOpen({
    required String conversationId,
    required String senderId,
    required String contactId,
  }) {
    socket.emit("chat-opened", {
      "conversationId": conversationId,
      "userId": senderId,
      "contactId": contactId,
    });
  }

  /// Closes the chat conversation between the current user and a contact.
  ///
  /// The [conversationId] parameter is the unique identifier of the conversation.
  /// The [contactId] parameter is the unique identifier of the contact.
  ///
  /// Example:
  /// ```dart
  /// chatClose(conversationId: "12345", contactId: "67890");
  /// ```
  static chatClose(
      {required String conversationId, required String contactId}) {
    socket.emit("chat-closed", {
      "conversationId": conversationId,
      "contactId": contactId,
    });
  }

  /// Listens for incoming messages and invokes the provided [callback] function when a message is received.
  ///
  /// The [callback] function should accept a single parameter of type [dynamic] which represents the received message data.
  /// This function also handles the received message by calling [handleMessageReceiveWithNotification] and passing the received data to it.
  ///
  /// Example:
  /// ```dart
  /// SocketServices.onMessageReceive((data) {
  ///   print("Received message: $data");
  ///   // Perform additional operations with the received data
  /// });
  /// ```
  static onMessageReceive(Function callback) {
    socket.off("msg-receive");
    socket.on("msg-receive", (data) async {
      print(data);
      await handleMessageReceiveWithNotification(data);
      callback(data);
    });
  }

  /// Listens for the status of a contact and performs the specified callback function when the status changes.
  ///
  /// The [callback] function is called when the status of the contact changes. It receives a [data] parameter
  /// containing information about the contact's status. The [data] parameter is a Map with the following keys:
  ///   - "inConversation": A boolean value indicating whether the contact is currently in a conversation.
  ///   - "conversationId": The ID of the conversation the contact is in.
  ///
  /// Example usage:
  /// ```dart
  /// statusOfContact((data) {
  ///   if (data["inConversation"] == true) {
  ///     print("Contact is in a conversation");
  ///     print("Conversation ID: ${data["conversationId"]}");
  ///   } else {
  ///     print("Contact is not in a conversation");
  ///   }
  /// });
  /// ```
  ///
  static statusOfContact(Function callback) {
    socket.off("status-of-contact");
    socket.on("status-of-contact", (data) async {
      if (data["inConversation"] == true) {
        if (openConversationIds.contains(data["conversationId"]) == false) {
          openConversationIds.add(data["conversationId"]);
        }
        callback(data);
      } else if (data["inConversation"] == false) {
        openConversationIds.remove(data["conversationId"]);
      }
    });
  }
}
