import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chats_response.freezed.dart';
part 'chats_response.g.dart';

ConversationsResponse conversationsResponseFromJson(String str) =>
    ConversationsResponse.fromJson(json.decode(str));

String conversationsResponseToJson(ConversationsResponse data) =>
    json.encode(data.toJson());

@freezed
class ConversationsResponse with _$ConversationsResponse {
  const factory ConversationsResponse({
    @Default([]) List<Conversation> conversations,
  }) = _ConversationsResponse;
  factory ConversationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationsResponseFromJson(json);
}

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    String? conversationId,
    bool? isConversationSeen,
    Contact? contact,
    LastMessage? lastMessage,
  }) = _Conversation;
  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}

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
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@freezed
class CommonFollowers with _$CommonFollowers {
  const factory CommonFollowers({
    String? name,
    String? username,
    String? imageUrl,
  }) = _CommonFollowers;
  factory CommonFollowers.fromJson(Map<String, dynamic> json) =>
      _$CommonFollowersFromJson(json);
}

@freezed
class LastMessage with _$LastMessage {
  const factory LastMessage({
    String? id,
    String? text,
    String? timestamp,
    bool? isSeen,
  }) = _LastMessage;
  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);
}

ChatResponse chatResponseFromJson(String str) =>
    ChatResponse.fromJson(json.decode(str));

String chatResponseToJson(ChatResponse data) => json.encode(data.toJson());

@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    @Default([]) List<Message> messages,
  }) = _ChatResponse;
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

Message messageResponseFromJson(String str) =>
    Message.fromJson(json.decode(str));

String messageResponseToJson(Message data) => json.encode(data.toJson());

@freezed
class Message with _$Message {
  const factory Message({
    String? senderId,
    String? messageId,
    String? text,
    String? time,
    String? senderUsername,
    bool? isSeen,
    bool? isFromMe,
  }) = _Message;
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
