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

  static connect() {
    socket.onConnect((_) {
      print("printed from socket.onConnect" + _.toString());
      socket.emit("add-user", {
        "userId": "66",
      });
    });
    
    socket.connect();
  }
  static onNotificationReceive(Function callback){

    socket.on("notification-receive", (data) {
      print(data);
      callback(data);
    });
  } 
}
