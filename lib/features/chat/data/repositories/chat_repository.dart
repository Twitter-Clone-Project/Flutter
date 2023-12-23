import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../web_services/socket_services.dart';
import '../../../../web_services/web_services.dart';
import '../model/chats_response.dart';


abstract class ChatRepository {
  getConversations();
  getMessagesHistory(String conversationId);
  sendMessage(String conversationId, String text ,String receiverId,String senderId);

}

class ChatRepositoryImpl implements ChatRepository {
  @override
  getConversations() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getConversations);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ConversationsResponse.fromJson(response.data["data"]);
      }
      return const ConversationsResponse(conversations: []);
    } catch (e) {
      rethrow;
    }
  }

  @override
  getMessagesHistory(String conversationId) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getMessagesHistory(conversationId));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ChatResponse.fromJson(response.data["data"]);
      }
      return const ChatResponse(messages : []);
    } catch (e) {
      rethrow;
    }
  }


  @override
  sendMessage(String conversationId, String text ,String receiverId,String senderId) async {
    try {

      SocketClient.sendMessage(
          conversationId: conversationId,
          text: text,
          receiverId: receiverId,
          senderId: senderId,
      );
    } catch (e) {
      rethrow;
    }
  }

}

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return ChatRepositoryImpl();
});
