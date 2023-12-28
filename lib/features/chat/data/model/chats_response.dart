import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chats_response.freezed.dart';
part 'chats_response.g.dart';

/// Converts a JSON string to a [ConversationsResponse] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"conversations": [{"conversationId": "1", "isConversationSeen": true, "contact": {...}, "lastMessage": {...}}]}';
/// ConversationsResponse response = conversationsResponseFromJson(jsonString);
/// ```
ConversationsResponse conversationsResponseFromJson(String str) =>
    ConversationsResponse.fromJson(json.decode(str));

/// Converts a [ConversationsResponse] object to a JSON string.
///
/// Example usage:
/// ```dart
/// ConversationsResponse response = ConversationsResponse(conversations: [Conversation(...)]);
/// String jsonString = conversationsResponseToJson(response);
/// ```
String conversationsResponseToJson(ConversationsResponse data) => json.encode(data.toJson());

/// Represents a response containing a list of conversations.
///
/// Example usage:
/// ```dart
/// ConversationsResponse response = ConversationsResponse(conversations: [Conversation(...)]);
/// ```
@freezed
class ConversationsResponse with _$ConversationsResponse {
  const factory ConversationsResponse({
    @Default([]) List<Conversation> conversations,
  }) = _ConversationsResponse;

  /// Creates a [ConversationsResponse] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'conversations': [{'conversationId': '1', 'isConversationSeen': true, 'contact': {...}, 'lastMessage': {...}}]};
  /// ConversationsResponse response = ConversationsResponse.fromJson(json);
  /// ```
  factory ConversationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationsResponseFromJson(json);
}

/// Represents a conversation.
///
/// Example usage:
/// ```dart
/// Conversation conversation = Conversation(conversationId: '1', isConversationSeen: true, contact: Contact(...), lastMessage: LastMessage(...));
/// ```
@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    String? conversationId,
    bool? isConversationSeen,
    Contact? contact,
    LastMessage? lastMessage,
  }) = _Conversation;

  /// Creates a [Conversation] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'conversationId': '1', 'isConversationSeen': true, 'contact': {...}, 'lastMessage': {...}};
  /// Conversation conversation = Conversation.fromJson(json);
  /// ```
  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}

/// Represents a contact.
///
/// Example usage:
/// ```dart
/// Contact contact = Contact(id: '1', inConversation: true, email: 'example@example.com', name: 'John Doe', username: 'johndoe', imageUrl: 'https://example.com/image.jpg', followersCount: '100', createdAt: '2022-01-01', commonFollowers: [CommonFollowers(...)], commonFollowersCnt: 5);
/// ```
@freezed
class Contact with _$Contact {
  const factory Contact({
    String? id,
    bool? inConversation,
    String? email,
    String? name,
    String? username,
    String? imageUrl,
    String? followersCount,
    String? createdAt,
    List<CommonFollowers>? commonFollowers,
    int? commonFollowersCnt,
  }) = _Contact;

  /// Creates a [Contact] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'id': '1', 'inConversation': true, 'email': 'example@example.com', 'name': 'John Doe', 'username': 'johndoe', 'imageUrl': 'https://example.com/image.jpg', 'followersCount': '100', 'createdAt': '2022-01-01', 'commonFollowers': [{...}], 'commonFollowersCnt': 5};
  /// Contact contact = Contact.fromJson(json);
  /// ```
  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

/// Represents a common follower.
///
/// Example usage:
/// ```dart
/// CommonFollowers commonFollowers = CommonFollowers(name: 'Jane Doe', username: 'janedoe', imageUrl: 'https://example.com/image.jpg');
/// ```
@freezed
class CommonFollowers with _$CommonFollowers {
  const factory CommonFollowers({
    String? name,
    String? username,
    String? imageUrl,
  }) = _CommonFollowers;

  /// Creates a [CommonFollowers] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'name': 'Jane Doe', 'username': 'janedoe', 'imageUrl': 'https://example.com/image.jpg'};
  /// CommonFollowers commonFollowers = CommonFollowers.fromJson(json);
  /// ```
  factory CommonFollowers.fromJson(Map<String, dynamic> json) => _$CommonFollowersFromJson(json);
}

/// Represents the last message in a conversation.
///
/// Example usage:
/// ```dart
/// LastMessage lastMessage = LastMessage(id: '1', text: 'Hello', timestamp: '2022-01-01 10:00:00', isSeen: true, isFromMe: false);
/// ```
@freezed
class LastMessage with _$LastMessage {
  const factory LastMessage({
    String? id,
    String? text,
    String? timestamp,
    bool? isSeen,
    bool? isFromMe,
  }) = _LastMessage;

  /// Creates a [LastMessage] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'id': '1', 'text': 'Hello', 'timestamp': '2022-01-01 10:00:00', 'isSeen': true, 'isFromMe': false};
  /// LastMessage lastMessage = LastMessage.fromJson(json);
  /// ```
  factory LastMessage.fromJson(Map<String, dynamic> json) => _$LastMessageFromJson(json);
}


/// Converts a JSON string to a [ChatResponse] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"messages": [{"senderId": "1", "messageId": "1", "text": "Hello", "time": "2022-01-01 10:00:00", "isSeen": true, "senderUsername": "johndoe", "isFromMe": false}]}';
/// ChatResponse response = chatResponseFromJson(jsonString);
/// ```
ChatResponse chatResponseFromJson(String str) =>
    ChatResponse.fromJson(json.decode(str));

/// Converts a [ChatResponse] object to a JSON string.
///
/// Example usage:
/// ```dart
/// ChatResponse response = ChatResponse(messages: [Message(...)]);
/// String jsonString = chatResponseToJson(response);
/// ```
String chatResponseToJson(ChatResponse data) => json.encode(data.toJson());

/// Represents a response containing a list of messages.
///
/// Example usage:
/// ```dart
/// ChatResponse response = ChatResponse(messages: [Message(...)]);
/// ```
@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    @Default([]) List<Message> messages,
  }) = _ChatResponse;

  /// Creates a [ChatResponse] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'messages': [{'senderId': '1', 'messageId': '1', 'text': 'Hello', 'time': '2022-01-01 10:00:00', 'isSeen': true, 'senderUsername': 'johndoe', 'isFromMe': false}]};
  /// ChatResponse response = ChatResponse.fromJson(json);
  /// ```
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

/// Converts a JSON string to a [Message] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"senderId": "1", "messageId": "1", "text": "Hello", "time": "2022-01-01 10:00:00", "isSeen": true, "senderUsername": "johndoe", "isFromMe": false}';
/// Message message = messageResponseFromJson(jsonString);
/// ```
Message messageResponseFromJson(String str) =>
    Message.fromJson(json.decode(str));

/// Converts a [Message] object to a JSON string.
///
/// Example usage:
/// ```dart
/// Message message = Message(senderId: '1', messageId: '1', text: 'Hello', time: '2022-01-01 10:00:00', isSeen: true, senderUsername: 'johndoe', isFromMe: false);
/// String jsonString = messageResponseToJson(message);
/// ```
String messageResponseToJson(Message data) => json.encode(data.toJson());


/// Represents a message.
///
/// Example usage:
/// ```dart
/// Message message = Message(senderId: '1', messageId: '1', text: 'Hello', time: '2022-01-01 10:00:00', isSeen: true, senderUsername: 'johndoe', isFromMe: false);
/// ```
@freezed
class Message with _$Message {
  const factory Message({
    String? senderId,
    String? messageId,
    String? text,
    String? time,
    bool? isSeen,
    String? senderUsername,
    bool? isFromMe,
  }) = _Message;

  /// Creates a [Message] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {'senderId': '1', 'messageId': '1', 'text': 'Hello', 'time': '2022-01-01 10:00:00', 'isSeen': true, 'senderUsername': 'johndoe', 'isFromMe': false};
  /// Message message = Message.fromJson(json);
  /// ```
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
