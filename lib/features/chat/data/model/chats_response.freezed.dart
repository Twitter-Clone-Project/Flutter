// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  List<Conversation> get conversations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
          ChatResponse value, $Res Function(ChatResponse) then) =
      _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call({List<Conversation> conversations});
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_value.copyWith(
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatResponseImplCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$ChatResponseImplCopyWith(
          _$ChatResponseImpl value, $Res Function(_$ChatResponseImpl) then) =
      __$$ChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Conversation> conversations});
}

/// @nodoc
class __$$ChatResponseImplCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$ChatResponseImpl>
    implements _$$ChatResponseImplCopyWith<$Res> {
  __$$ChatResponseImplCopyWithImpl(
      _$ChatResponseImpl _value, $Res Function(_$ChatResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
  }) {
    return _then(_$ChatResponseImpl(
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatResponseImpl implements _ChatResponse {
  const _$ChatResponseImpl({final List<Conversation> conversations = const []})
      : _conversations = conversations;

  factory _$ChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatResponseImplFromJson(json);

  final List<Conversation> _conversations;
  @override
  @JsonKey()
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  String toString() {
    return 'ChatResponse(conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_conversations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      __$$ChatResponseImplCopyWithImpl<_$ChatResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatResponse implements ChatResponse {
  const factory _ChatResponse({final List<Conversation> conversations}) =
      _$ChatResponseImpl;

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$ChatResponseImpl.fromJson;

  @override
  List<Conversation> get conversations;
  @override
  @JsonKey(ignore: true)
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
mixin _$Conversation {
  String? get conversationId => throw _privateConstructorUsedError;
  bool? get isConversationSeen => throw _privateConstructorUsedError;
  Contact? get contact => throw _privateConstructorUsedError;
  LastMessage? get lastMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res, Conversation>;
  @useResult
  $Res call(
      {String? conversationId,
      bool? isConversationSeen,
      Contact? contact,
      LastMessage? lastMessage});

  $ContactCopyWith<$Res>? get contact;
  $LastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res, $Val extends Conversation>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = freezed,
    Object? isConversationSeen = freezed,
    Object? contact = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isConversationSeen: freezed == isConversationSeen
          ? _value.isConversationSeen
          : isConversationSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LastMessageCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $LastMessageCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversationImplCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$$ConversationImplCopyWith(
          _$ConversationImpl value, $Res Function(_$ConversationImpl) then) =
      __$$ConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? conversationId,
      bool? isConversationSeen,
      Contact? contact,
      LastMessage? lastMessage});

  @override
  $ContactCopyWith<$Res>? get contact;
  @override
  $LastMessageCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$ConversationImplCopyWithImpl<$Res>
    extends _$ConversationCopyWithImpl<$Res, _$ConversationImpl>
    implements _$$ConversationImplCopyWith<$Res> {
  __$$ConversationImplCopyWithImpl(
      _$ConversationImpl _value, $Res Function(_$ConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = freezed,
    Object? isConversationSeen = freezed,
    Object? contact = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_$ConversationImpl(
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      isConversationSeen: freezed == isConversationSeen
          ? _value.isConversationSeen
          : isConversationSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as LastMessage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationImpl implements _Conversation {
  const _$ConversationImpl(
      {this.conversationId,
      this.isConversationSeen,
      this.contact,
      this.lastMessage});

  factory _$ConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationImplFromJson(json);

  @override
  final String? conversationId;
  @override
  final bool? isConversationSeen;
  @override
  final Contact? contact;
  @override
  final LastMessage? lastMessage;

  @override
  String toString() {
    return 'Conversation(conversationId: $conversationId, isConversationSeen: $isConversationSeen, contact: $contact, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.isConversationSeen, isConversationSeen) ||
                other.isConversationSeen == isConversationSeen) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, conversationId, isConversationSeen, contact, lastMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      __$$ConversationImplCopyWithImpl<_$ConversationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationImplToJson(
      this,
    );
  }
}

abstract class _Conversation implements Conversation {
  const factory _Conversation(
      {final String? conversationId,
      final bool? isConversationSeen,
      final Contact? contact,
      final LastMessage? lastMessage}) = _$ConversationImpl;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$ConversationImpl.fromJson;

  @override
  String? get conversationId;
  @override
  bool? get isConversationSeen;
  @override
  Contact? get contact;
  @override
  LastMessage? get lastMessage;
  @override
  @JsonKey(ignore: true)
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String? get id => throw _privateConstructorUsedError;
  bool? get inConversation => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get followersCount => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  List<CommonFollowers>? get commonFollowers =>
      throw _privateConstructorUsedError;
  int? get commonFollowersCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {String? id,
      bool? inConversation,
      String? email,
      String? name,
      String? username,
      String? imageUrl,
      String? followersCount,
      String? createdAt,
      List<CommonFollowers>? commonFollowers,
      int? commonFollowersCnt});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? inConversation = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
    Object? followersCount = freezed,
    Object? createdAt = freezed,
    Object? commonFollowers = freezed,
    Object? commonFollowersCnt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      inConversation: freezed == inConversation
          ? _value.inConversation
          : inConversation // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      commonFollowers: freezed == commonFollowers
          ? _value.commonFollowers
          : commonFollowers // ignore: cast_nullable_to_non_nullable
              as List<CommonFollowers>?,
      commonFollowersCnt: freezed == commonFollowersCnt
          ? _value.commonFollowersCnt
          : commonFollowersCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      bool? inConversation,
      String? email,
      String? name,
      String? username,
      String? imageUrl,
      String? followersCount,
      String? createdAt,
      List<CommonFollowers>? commonFollowers,
      int? commonFollowersCnt});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? inConversation = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
    Object? followersCount = freezed,
    Object? createdAt = freezed,
    Object? commonFollowers = freezed,
    Object? commonFollowersCnt = freezed,
  }) {
    return _then(_$ContactImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      inConversation: freezed == inConversation
          ? _value.inConversation
          : inConversation // ignore: cast_nullable_to_non_nullable
              as bool?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      commonFollowers: freezed == commonFollowers
          ? _value._commonFollowers
          : commonFollowers // ignore: cast_nullable_to_non_nullable
              as List<CommonFollowers>?,
      commonFollowersCnt: freezed == commonFollowersCnt
          ? _value.commonFollowersCnt
          : commonFollowersCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {this.id,
      this.inConversation,
      this.email,
      this.name,
      this.username,
      this.imageUrl,
      this.followersCount,
      this.createdAt,
      final List<CommonFollowers>? commonFollowers,
      this.commonFollowersCnt})
      : _commonFollowers = commonFollowers;

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final String? id;
  @override
  final bool? inConversation;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? imageUrl;
  @override
  final String? followersCount;
  @override
  final String? createdAt;
  final List<CommonFollowers>? _commonFollowers;
  @override
  List<CommonFollowers>? get commonFollowers {
    final value = _commonFollowers;
    if (value == null) return null;
    if (_commonFollowers is EqualUnmodifiableListView) return _commonFollowers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? commonFollowersCnt;

  @override
  String toString() {
    return 'Contact(id: $id, inConversation: $inConversation, email: $email, name: $name, username: $username, imageUrl: $imageUrl, followersCount: $followersCount, createdAt: $createdAt, commonFollowers: $commonFollowers, commonFollowersCnt: $commonFollowersCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inConversation, inConversation) ||
                other.inConversation == inConversation) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._commonFollowers, _commonFollowers) &&
            (identical(other.commonFollowersCnt, commonFollowersCnt) ||
                other.commonFollowersCnt == commonFollowersCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      inConversation,
      email,
      name,
      username,
      imageUrl,
      followersCount,
      createdAt,
      const DeepCollectionEquality().hash(_commonFollowers),
      commonFollowersCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {final String? id,
      final bool? inConversation,
      final String? email,
      final String? name,
      final String? username,
      final String? imageUrl,
      final String? followersCount,
      final String? createdAt,
      final List<CommonFollowers>? commonFollowers,
      final int? commonFollowersCnt}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  String? get id;
  @override
  bool? get inConversation;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get imageUrl;
  @override
  String? get followersCount;
  @override
  String? get createdAt;
  @override
  List<CommonFollowers>? get commonFollowers;
  @override
  int? get commonFollowersCnt;
  @override
  @JsonKey(ignore: true)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonFollowers _$CommonFollowersFromJson(Map<String, dynamic> json) {
  return _CommonFollowers.fromJson(json);
}

/// @nodoc
mixin _$CommonFollowers {
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonFollowersCopyWith<CommonFollowers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonFollowersCopyWith<$Res> {
  factory $CommonFollowersCopyWith(
          CommonFollowers value, $Res Function(CommonFollowers) then) =
      _$CommonFollowersCopyWithImpl<$Res, CommonFollowers>;
  @useResult
  $Res call({String? name, String? username, String? imageUrl});
}

/// @nodoc
class _$CommonFollowersCopyWithImpl<$Res, $Val extends CommonFollowers>
    implements $CommonFollowersCopyWith<$Res> {
  _$CommonFollowersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonFollowersImplCopyWith<$Res>
    implements $CommonFollowersCopyWith<$Res> {
  factory _$$CommonFollowersImplCopyWith(_$CommonFollowersImpl value,
          $Res Function(_$CommonFollowersImpl) then) =
      __$$CommonFollowersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? username, String? imageUrl});
}

/// @nodoc
class __$$CommonFollowersImplCopyWithImpl<$Res>
    extends _$CommonFollowersCopyWithImpl<$Res, _$CommonFollowersImpl>
    implements _$$CommonFollowersImplCopyWith<$Res> {
  __$$CommonFollowersImplCopyWithImpl(
      _$CommonFollowersImpl _value, $Res Function(_$CommonFollowersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$CommonFollowersImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommonFollowersImpl implements _CommonFollowers {
  const _$CommonFollowersImpl({this.name, this.username, this.imageUrl});

  factory _$CommonFollowersImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommonFollowersImplFromJson(json);

  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'CommonFollowers(name: $name, username: $username, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonFollowersImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, username, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonFollowersImplCopyWith<_$CommonFollowersImpl> get copyWith =>
      __$$CommonFollowersImplCopyWithImpl<_$CommonFollowersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommonFollowersImplToJson(
      this,
    );
  }
}

abstract class _CommonFollowers implements CommonFollowers {
  const factory _CommonFollowers(
      {final String? name,
      final String? username,
      final String? imageUrl}) = _$CommonFollowersImpl;

  factory _CommonFollowers.fromJson(Map<String, dynamic> json) =
      _$CommonFollowersImpl.fromJson;

  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CommonFollowersImplCopyWith<_$CommonFollowersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LastMessage _$LastMessageFromJson(Map<String, dynamic> json) {
  return _LastMessage.fromJson(json);
}

/// @nodoc
mixin _$LastMessage {
  String? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  bool? get isSeen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastMessageCopyWith<LastMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastMessageCopyWith<$Res> {
  factory $LastMessageCopyWith(
          LastMessage value, $Res Function(LastMessage) then) =
      _$LastMessageCopyWithImpl<$Res, LastMessage>;
  @useResult
  $Res call({String? id, String? text, String? timestamp, bool? isSeen});
}

/// @nodoc
class _$LastMessageCopyWithImpl<$Res, $Val extends LastMessage>
    implements $LastMessageCopyWith<$Res> {
  _$LastMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? timestamp = freezed,
    Object? isSeen = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      isSeen: freezed == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastMessageImplCopyWith<$Res>
    implements $LastMessageCopyWith<$Res> {
  factory _$$LastMessageImplCopyWith(
          _$LastMessageImpl value, $Res Function(_$LastMessageImpl) then) =
      __$$LastMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? text, String? timestamp, bool? isSeen});
}

/// @nodoc
class __$$LastMessageImplCopyWithImpl<$Res>
    extends _$LastMessageCopyWithImpl<$Res, _$LastMessageImpl>
    implements _$$LastMessageImplCopyWith<$Res> {
  __$$LastMessageImplCopyWithImpl(
      _$LastMessageImpl _value, $Res Function(_$LastMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? timestamp = freezed,
    Object? isSeen = freezed,
  }) {
    return _then(_$LastMessageImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      isSeen: freezed == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastMessageImpl implements _LastMessage {
  const _$LastMessageImpl({this.id, this.text, this.timestamp, this.isSeen});

  factory _$LastMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastMessageImplFromJson(json);

  @override
  final String? id;
  @override
  final String? text;
  @override
  final String? timestamp;
  @override
  final bool? isSeen;

  @override
  String toString() {
    return 'LastMessage(id: $id, text: $text, timestamp: $timestamp, isSeen: $isSeen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, timestamp, isSeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastMessageImplCopyWith<_$LastMessageImpl> get copyWith =>
      __$$LastMessageImplCopyWithImpl<_$LastMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastMessageImplToJson(
      this,
    );
  }
}

abstract class _LastMessage implements LastMessage {
  const factory _LastMessage(
      {final String? id,
      final String? text,
      final String? timestamp,
      final bool? isSeen}) = _$LastMessageImpl;

  factory _LastMessage.fromJson(Map<String, dynamic> json) =
      _$LastMessageImpl.fromJson;

  @override
  String? get id;
  @override
  String? get text;
  @override
  String? get timestamp;
  @override
  bool? get isSeen;
  @override
  @JsonKey(ignore: true)
  _$$LastMessageImplCopyWith<_$LastMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
