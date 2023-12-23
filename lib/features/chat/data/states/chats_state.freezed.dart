// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  ConversationsResponse get conversationsResponse =>
      throw _privateConstructorUsedError;
  ChatResponse get chatResponse => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get chatLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {ConversationsResponse conversationsResponse,
      ChatResponse chatResponse,
      bool loading,
      bool chatLoading,
      String? errorMessage});

  $ConversationsResponseCopyWith<$Res> get conversationsResponse;
  $ChatResponseCopyWith<$Res> get chatResponse;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationsResponse = null,
    Object? chatResponse = null,
    Object? loading = null,
    Object? chatLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      conversationsResponse: null == conversationsResponse
          ? _value.conversationsResponse
          : conversationsResponse // ignore: cast_nullable_to_non_nullable
              as ConversationsResponse,
      chatResponse: null == chatResponse
          ? _value.chatResponse
          : chatResponse // ignore: cast_nullable_to_non_nullable
              as ChatResponse,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      chatLoading: null == chatLoading
          ? _value.chatLoading
          : chatLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConversationsResponseCopyWith<$Res> get conversationsResponse {
    return $ConversationsResponseCopyWith<$Res>(_value.conversationsResponse,
        (value) {
      return _then(_value.copyWith(conversationsResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatResponseCopyWith<$Res> get chatResponse {
    return $ChatResponseCopyWith<$Res>(_value.chatResponse, (value) {
      return _then(_value.copyWith(chatResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConversationsResponse conversationsResponse,
      ChatResponse chatResponse,
      bool loading,
      bool chatLoading,
      String? errorMessage});

  @override
  $ConversationsResponseCopyWith<$Res> get conversationsResponse;
  @override
  $ChatResponseCopyWith<$Res> get chatResponse;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationsResponse = null,
    Object? chatResponse = null,
    Object? loading = null,
    Object? chatLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ChatStateImpl(
      conversationsResponse: null == conversationsResponse
          ? _value.conversationsResponse
          : conversationsResponse // ignore: cast_nullable_to_non_nullable
              as ConversationsResponse,
      chatResponse: null == chatResponse
          ? _value.chatResponse
          : chatResponse // ignore: cast_nullable_to_non_nullable
              as ChatResponse,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      chatLoading: null == chatLoading
          ? _value.chatLoading
          : chatLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {this.conversationsResponse =
          const ConversationsResponse(conversations: []),
      this.chatResponse = const ChatResponse(messages: []),
      this.loading = false,
      this.chatLoading = false,
      this.errorMessage});

  @override
  @JsonKey()
  final ConversationsResponse conversationsResponse;
  @override
  @JsonKey()
  final ChatResponse chatResponse;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool chatLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatState(conversationsResponse: $conversationsResponse, chatResponse: $chatResponse, loading: $loading, chatLoading: $chatLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.conversationsResponse, conversationsResponse) ||
                other.conversationsResponse == conversationsResponse) &&
            (identical(other.chatResponse, chatResponse) ||
                other.chatResponse == chatResponse) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.chatLoading, chatLoading) ||
                other.chatLoading == chatLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationsResponse,
      chatResponse, loading, chatLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final ConversationsResponse conversationsResponse,
      final ChatResponse chatResponse,
      final bool loading,
      final bool chatLoading,
      final String? errorMessage}) = _$ChatStateImpl;

  @override
  ConversationsResponse get conversationsResponse;
  @override
  ChatResponse get chatResponse;
  @override
  bool get loading;
  @override
  bool get chatLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
