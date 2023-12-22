import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:x_clone/web_services/web_services.dart';

class SocketClient {
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

    socket.on("notification-receive", (data) {});

    socket.connect();
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
}
