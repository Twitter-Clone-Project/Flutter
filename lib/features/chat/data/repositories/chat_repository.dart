import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../web_services/socket_services.dart';
import '../../../../web_services/web_services.dart';
import '../model/chats_response.dart';

abstract class ChatRepository {
  getConversations();
  getMessagesHistory(String conversationId);
  sendMessage(
      String conversationId, String text, String receiverId, String senderId);
  startConversation(String id);
  getUnseenConversationsCnt();
}

class ChatRepositoryImpl implements ChatRepository {
  /// A repository class for managing chat-related data.
  /// Retrieves the count of unseen conversations.
  ///
  /// This method sends a GET request to the server to fetch the count of unseen conversations.
  /// If the request is successful (status code 200 or 201), it returns the count of unseen conversations.
  /// Otherwise, it returns an empty string.
  ///
  /// Example usage:
  /// ```dart
  /// int unseenCount = await chatRepository.getUnseenConversationsCnt();
  /// print('Unseen conversations count: $unseenCount');
  /// ```
  @override
  getUnseenConversationsCnt() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.unseenConversationsCnt);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["data"]["unseenCnt"];
      }
      return '';
    } catch (e) {
      rethrow;
    }
  }

  /// Starts a conversation with the specified user.
  ///
  /// The [id] parameter represents the ID of the user to start the conversation with.
  /// It sends a POST request to the server to initiate the conversation.
  /// Returns a [ConversationsResponse] object containing the list of conversations.
  /// Throws an exception if an error occurs during the process.
  @override
  startConversation(String id) async {
    var data = {
      "userIds": [id],
    };
    try {
      var response =
          await HttpClient.dio.post(EndPoints.startConversation, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
      }
      return const ConversationsResponse(conversations: []);
    } catch (e) {
      rethrow;
    }
  }

  /// This class provides methods for retrieving conversations from the server.
  /// Retrieves conversations from the server.
  ///
  /// Returns a [ConversationsResponse] object containing the list of conversations.
  /// If the request is successful, the conversations are returned in the response.
  /// If the request fails or encounters an error, an exception is thrown.
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

  /// Retrieves the messages history for a given conversation ID.
  ///
  /// This function makes an HTTP GET request to the server to fetch the messages history
  /// for the specified conversation ID. It returns a [ChatResponse] object containing
  /// the messages data.
  ///
  /// If the request is successful and the response status code is 200 or 201, the function
  /// parses the response data and returns a [ChatResponse] object with the messages.
  /// If the response status code is not 200 or 201, an empty [ChatResponse] object is returned.
  ///
  /// If an error occurs during the HTTP request, the error is rethrown.
  ///
  /// Example usage:
  /// ```dart
  /// final repository = ChatRepository();
  /// final conversationId = '123456789';
  ///
  /// try {
  ///   final chatResponse = await repository.getMessagesHistory(conversationId);
  ///   // Process the chatResponse object
  /// } catch (e) {
  ///   // Handle the error
  /// }
  /// ```
  @override
  getMessagesHistory(String conversationId) async {
    try {
      var response = await HttpClient.dio
          .get(EndPoints.getMessagesHistory(conversationId));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ChatResponse.fromJson(response.data["data"]);
      }
      return const ChatResponse(messages: []);
    } catch (e) {
      rethrow;
    }
  }

  /// A repository class for handling chat-related data operations.
  /// Sends a message in a conversation.
  ///
  /// The [conversationId] parameter specifies the ID of the conversation.
  /// The [text] parameter specifies the content of the message.
  /// The [receiverId] parameter specifies the ID of the message receiver.
  /// The [senderId] parameter specifies the ID of the message sender.
  ///
  /// Example usage:
  /// ```dart
  /// String conversationId = '12345';
  /// String text = 'Hello, how are you?';
  /// String receiverId = 'user123';
  /// String senderId = 'user456';
  ///
  /// await ChatRepository().sendMessage(conversationId, text, receiverId, senderId);
  /// ```
  @override
  sendMessage(String conversationId, String text, String receiverId,
      String senderId) async {
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
