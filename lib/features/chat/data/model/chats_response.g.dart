// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationsResponseImpl _$$ConversationsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationsResponseImpl(
      conversations: (json['conversations'] as List<dynamic>?)
              ?.map((e) => Conversation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ConversationsResponseImplToJson(
        _$ConversationsResponseImpl instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
    };

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      conversationId: json['conversationId'] as String?,
      isConversationSeen: json['isConversationSeen'] as bool?,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      lastMessage: json['lastMessage'] == null
          ? null
          : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'isConversationSeen': instance.isConversationSeen,
      'contact': instance.contact,
      'lastMessage': instance.lastMessage,
    };

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: json['id'] as String?,
      inConversation: json['inConversation'] as bool?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      imageUrl: json['imageUrl'] as String?,
      followersCount: json['followersCount'] as String?,
      createdAt: json['createdAt'] as String?,
      commonFollowers: (json['commonFollowers'] as List<dynamic>?)
          ?.map((e) => CommonFollowers.fromJson(e as Map<String, dynamic>))
          .toList(),
      commonFollowersCnt: json['commonFollowersCnt'] as int?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inConversation': instance.inConversation,
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
      'followersCount': instance.followersCount,
      'createdAt': instance.createdAt,
      'commonFollowers': instance.commonFollowers,
      'commonFollowersCnt': instance.commonFollowersCnt,
    };

_$CommonFollowersImpl _$$CommonFollowersImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonFollowersImpl(
      name: json['name'] as String?,
      username: json['username'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$CommonFollowersImplToJson(
        _$CommonFollowersImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'imageUrl': instance.imageUrl,
    };

_$LastMessageImpl _$$LastMessageImplFromJson(Map<String, dynamic> json) =>
    _$LastMessageImpl(
      id: json['id'] as String?,
      text: json['text'] as String?,
      timestamp: json['timestamp'] as String?,
      isSeen: json['isSeen'] as bool?,
    );

Map<String, dynamic> _$$LastMessageImplToJson(_$LastMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'timestamp': instance.timestamp,
      'isSeen': instance.isSeen,
    };

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      senderId: json['senderId'] as String?,
      messageId: json['messageId'] as String?,
      text: json['text'] as String?,
      time: json['time'] as String?,
      isSeen: json['isSeen'] as bool?,
      isFromMe: json['isFromMe'] as bool?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'messageId': instance.messageId,
      'text': instance.text,
      'time': instance.time,
      'isSeen': instance.isSeen,
      'isFromMe': instance.isFromMe,
    };
