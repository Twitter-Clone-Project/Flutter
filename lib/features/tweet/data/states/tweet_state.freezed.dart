// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TweetState {
  RetweetersList get retweetrsList => throw _privateConstructorUsedError;
  LikersList get likersList => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get screenIndex => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TweetStateCopyWith<TweetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetStateCopyWith<$Res> {
  factory $TweetStateCopyWith(
          TweetState value, $Res Function(TweetState) then) =
      _$TweetStateCopyWithImpl<$Res, TweetState>;
  @useResult
  $Res call(
      {RetweetersList retweetrsList,
      LikersList likersList,
      String? errorMessage,
      bool loading,
      int screenIndex,
      bool? isLiked});

  $RetweetersListCopyWith<$Res> get retweetrsList;
  $LikersListCopyWith<$Res> get likersList;
}

/// @nodoc
class _$TweetStateCopyWithImpl<$Res, $Val extends TweetState>
    implements $TweetStateCopyWith<$Res> {
  _$TweetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retweetrsList = null,
    Object? likersList = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? screenIndex = null,
    Object? isLiked = freezed,
  }) {
    return _then(_value.copyWith(
      retweetrsList: null == retweetrsList
          ? _value.retweetrsList
          : retweetrsList // ignore: cast_nullable_to_non_nullable
              as RetweetersList,
      likersList: null == likersList
          ? _value.likersList
          : likersList // ignore: cast_nullable_to_non_nullable
              as LikersList,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      screenIndex: null == screenIndex
          ? _value.screenIndex
          : screenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RetweetersListCopyWith<$Res> get retweetrsList {
    return $RetweetersListCopyWith<$Res>(_value.retweetrsList, (value) {
      return _then(_value.copyWith(retweetrsList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LikersListCopyWith<$Res> get likersList {
    return $LikersListCopyWith<$Res>(_value.likersList, (value) {
      return _then(_value.copyWith(likersList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TweetStateImplCopyWith<$Res>
    implements $TweetStateCopyWith<$Res> {
  factory _$$TweetStateImplCopyWith(
          _$TweetStateImpl value, $Res Function(_$TweetStateImpl) then) =
      __$$TweetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RetweetersList retweetrsList,
      LikersList likersList,
      String? errorMessage,
      bool loading,
      int screenIndex,
      bool? isLiked});

  @override
  $RetweetersListCopyWith<$Res> get retweetrsList;
  @override
  $LikersListCopyWith<$Res> get likersList;
}

/// @nodoc
class __$$TweetStateImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$TweetStateImpl>
    implements _$$TweetStateImplCopyWith<$Res> {
  __$$TweetStateImplCopyWithImpl(
      _$TweetStateImpl _value, $Res Function(_$TweetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retweetrsList = null,
    Object? likersList = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? screenIndex = null,
    Object? isLiked = freezed,
  }) {
    return _then(_$TweetStateImpl(
      retweetrsList: null == retweetrsList
          ? _value.retweetrsList
          : retweetrsList // ignore: cast_nullable_to_non_nullable
              as RetweetersList,
      likersList: null == likersList
          ? _value.likersList
          : likersList // ignore: cast_nullable_to_non_nullable
              as LikersList,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      screenIndex: null == screenIndex
          ? _value.screenIndex
          : screenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$TweetStateImpl implements _TweetState {
  const _$TweetStateImpl(
      {this.retweetrsList = const RetweetersList(data: []),
      this.likersList = const LikersList(data: []),
      this.errorMessage = null,
      this.loading = true,
      this.screenIndex = 0,
      this.isLiked = false});

  @override
  @JsonKey()
  final RetweetersList retweetrsList;
  @override
  @JsonKey()
  final LikersList likersList;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int screenIndex;
  @override
  @JsonKey()
  final bool? isLiked;

  @override
  String toString() {
    return 'TweetState(retweetrsList: $retweetrsList, likersList: $likersList, errorMessage: $errorMessage, loading: $loading, screenIndex: $screenIndex, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetStateImpl &&
            (identical(other.retweetrsList, retweetrsList) ||
                other.retweetrsList == retweetrsList) &&
            (identical(other.likersList, likersList) ||
                other.likersList == likersList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.screenIndex, screenIndex) ||
                other.screenIndex == screenIndex) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retweetrsList, likersList,
      errorMessage, loading, screenIndex, isLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetStateImplCopyWith<_$TweetStateImpl> get copyWith =>
      __$$TweetStateImplCopyWithImpl<_$TweetStateImpl>(this, _$identity);
}

abstract class _TweetState implements TweetState {
  const factory _TweetState(
      {final RetweetersList retweetrsList,
      final LikersList likersList,
      final String? errorMessage,
      final bool loading,
      final int screenIndex,
      final bool? isLiked}) = _$TweetStateImpl;

  @override
  RetweetersList get retweetrsList;
  @override
  LikersList get likersList;
  @override
  String? get errorMessage;
  @override
  bool get loading;
  @override
  int get screenIndex;
  @override
  bool? get isLiked;
  @override
  @JsonKey(ignore: true)
  _$$TweetStateImplCopyWith<_$TweetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
