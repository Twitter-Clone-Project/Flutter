// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  TrendingList get trendingList => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get screenIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {TrendingList trendingList,
      String? errorMessage,
      bool loading,
      int screenIndex});

  $TrendingListCopyWith<$Res> get trendingList;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingList = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? screenIndex = null,
  }) {
    return _then(_value.copyWith(
      trendingList: null == trendingList
          ? _value.trendingList
          : trendingList // ignore: cast_nullable_to_non_nullable
              as TrendingList,
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TrendingListCopyWith<$Res> get trendingList {
    return $TrendingListCopyWith<$Res>(_value.trendingList, (value) {
      return _then(_value.copyWith(trendingList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TrendingList trendingList,
      String? errorMessage,
      bool loading,
      int screenIndex});

  @override
  $TrendingListCopyWith<$Res> get trendingList;
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendingList = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? screenIndex = null,
  }) {
    return _then(_$SearchStateImpl(
      trendingList: null == trendingList
          ? _value.trendingList
          : trendingList // ignore: cast_nullable_to_non_nullable
              as TrendingList,
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
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {this.trendingList = const TrendingList(data: []),
      this.errorMessage = null,
      this.loading = true,
      this.screenIndex = 0});

  @override
  @JsonKey()
  final TrendingList trendingList;
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
  String toString() {
    return 'SearchState(trendingList: $trendingList, errorMessage: $errorMessage, loading: $loading, screenIndex: $screenIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.trendingList, trendingList) ||
                other.trendingList == trendingList) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.screenIndex, screenIndex) ||
                other.screenIndex == screenIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, trendingList, errorMessage, loading, screenIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final TrendingList trendingList,
      final String? errorMessage,
      final bool loading,
      final int screenIndex}) = _$SearchStateImpl;

  @override
  TrendingList get trendingList;
  @override
  String? get errorMessage;
  @override
  bool get loading;
  @override
  int get screenIndex;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
