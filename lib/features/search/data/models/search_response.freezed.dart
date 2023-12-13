// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrendData _$TrendDataFromJson(Map<String, dynamic> json) {
  return _TrendData.fromJson(json);
}

/// @nodoc
mixin _$TrendData {
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrendDataCopyWith<TrendData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendDataCopyWith<$Res> {
  factory $TrendDataCopyWith(TrendData value, $Res Function(TrendData) then) =
      _$TrendDataCopyWithImpl<$Res, TrendData>;
  @useResult
  $Res call({String? name});
}

/// @nodoc
class _$TrendDataCopyWithImpl<$Res, $Val extends TrendData>
    implements $TrendDataCopyWith<$Res> {
  _$TrendDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendDataImplCopyWith<$Res>
    implements $TrendDataCopyWith<$Res> {
  factory _$$TrendDataImplCopyWith(
          _$TrendDataImpl value, $Res Function(_$TrendDataImpl) then) =
      __$$TrendDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name});
}

/// @nodoc
class __$$TrendDataImplCopyWithImpl<$Res>
    extends _$TrendDataCopyWithImpl<$Res, _$TrendDataImpl>
    implements _$$TrendDataImplCopyWith<$Res> {
  __$$TrendDataImplCopyWithImpl(
      _$TrendDataImpl _value, $Res Function(_$TrendDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$TrendDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendDataImpl implements _TrendData {
  const _$TrendDataImpl({this.name});

  factory _$TrendDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendDataImplFromJson(json);

  @override
  final String? name;

  @override
  String toString() {
    return 'TrendData(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendDataImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendDataImplCopyWith<_$TrendDataImpl> get copyWith =>
      __$$TrendDataImplCopyWithImpl<_$TrendDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendDataImplToJson(
      this,
    );
  }
}

abstract class _TrendData implements TrendData {
  const factory _TrendData({final String? name}) = _$TrendDataImpl;

  factory _TrendData.fromJson(Map<String, dynamic> json) =
      _$TrendDataImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$TrendDataImplCopyWith<_$TrendDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrendingList _$TrendingListFromJson(Map<String, dynamic> json) {
  return _TrendingList.fromJson(json);
}

/// @nodoc
mixin _$TrendingList {
  List<TrendData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrendingListCopyWith<TrendingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingListCopyWith<$Res> {
  factory $TrendingListCopyWith(
          TrendingList value, $Res Function(TrendingList) then) =
      _$TrendingListCopyWithImpl<$Res, TrendingList>;
  @useResult
  $Res call({List<TrendData>? data});
}

/// @nodoc
class _$TrendingListCopyWithImpl<$Res, $Val extends TrendingList>
    implements $TrendingListCopyWith<$Res> {
  _$TrendingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrendData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendingListImplCopyWith<$Res>
    implements $TrendingListCopyWith<$Res> {
  factory _$$TrendingListImplCopyWith(
          _$TrendingListImpl value, $Res Function(_$TrendingListImpl) then) =
      __$$TrendingListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TrendData>? data});
}

/// @nodoc
class __$$TrendingListImplCopyWithImpl<$Res>
    extends _$TrendingListCopyWithImpl<$Res, _$TrendingListImpl>
    implements _$$TrendingListImplCopyWith<$Res> {
  __$$TrendingListImplCopyWithImpl(
      _$TrendingListImpl _value, $Res Function(_$TrendingListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$TrendingListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TrendData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendingListImpl implements _TrendingList {
  const _$TrendingListImpl({final List<TrendData>? data}) : _data = data;

  factory _$TrendingListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendingListImplFromJson(json);

  final List<TrendData>? _data;
  @override
  List<TrendData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TrendingList(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingListImplCopyWith<_$TrendingListImpl> get copyWith =>
      __$$TrendingListImplCopyWithImpl<_$TrendingListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendingListImplToJson(
      this,
    );
  }
}

abstract class _TrendingList implements TrendingList {
  const factory _TrendingList({final List<TrendData>? data}) =
      _$TrendingListImpl;

  factory _TrendingList.fromJson(Map<String, dynamic> json) =
      _$TrendingListImpl.fromJson;

  @override
  List<TrendData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$TrendingListImplCopyWith<_$TrendingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
