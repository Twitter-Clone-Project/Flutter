// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  HomeResponse get homeResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get screenIndex => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {HomeResponse homeResponse,
      String? errorMessage,
      bool loading,
      int screenIndex,
      int pageIndex});

  $HomeResponseCopyWith<$Res> get homeResponse;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeResponse = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? screenIndex = null,
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      homeResponse: null == homeResponse
          ? _value.homeResponse
          : homeResponse // ignore: cast_nullable_to_non_nullable
              as HomeResponse,
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
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HomeResponseCopyWith<$Res> get homeResponse {
    return $HomeResponseCopyWith<$Res>(_value.homeResponse, (value) {
      return _then(_value.copyWith(homeResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomeResponse homeResponse,
      String? errorMessage,
      bool loading,
      int screenIndex,
      int pageIndex});

  @override
  $HomeResponseCopyWith<$Res> get homeResponse;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeResponse = null,
    Object? errorMessage = freezed,
    Object? loading = null,
    Object? screenIndex = null,
    Object? pageIndex = null,
  }) {
    return _then(_$HomeStateImpl(
      homeResponse: null == homeResponse
          ? _value.homeResponse
          : homeResponse // ignore: cast_nullable_to_non_nullable
              as HomeResponse,
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
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.homeResponse = const HomeResponse(data: [], total: 0),
      this.errorMessage = null,
      this.loading = true,
      this.screenIndex = 0,
      this.pageIndex = 0});

  @override
  @JsonKey()
  final HomeResponse homeResponse;
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
  final int pageIndex;

  @override
  String toString() {
    return 'HomeState(homeResponse: $homeResponse, errorMessage: $errorMessage, loading: $loading, screenIndex: $screenIndex, pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.homeResponse, homeResponse) ||
                other.homeResponse == homeResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.screenIndex, screenIndex) ||
                other.screenIndex == screenIndex) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, homeResponse, errorMessage, loading, screenIndex, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final HomeResponse homeResponse,
      final String? errorMessage,
      final bool loading,
      final int screenIndex,
      final int pageIndex}) = _$HomeStateImpl;

  @override
  HomeResponse get homeResponse;
  @override
  String? get errorMessage;
  @override
  bool get loading;
  @override
  int get screenIndex;
  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
