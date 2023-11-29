// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikerData _$LikerDataFromJson(Map<String, dynamic> json) {
  return _LikerData.fromJson(json);
}

/// @nodoc
mixin _$LikerData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get screenName => throw _privateConstructorUsedError;
  String? get profileImageURL => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikerDataCopyWith<LikerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikerDataCopyWith<$Res> {
  factory $LikerDataCopyWith(LikerData value, $Res Function(LikerData) then) =
      _$LikerDataCopyWithImpl<$Res, LikerData>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? screenName,
      String? profileImageURL,
      bool? isFollowed});
}

/// @nodoc
class _$LikerDataCopyWithImpl<$Res, $Val extends LikerData>
    implements $LikerDataCopyWith<$Res> {
  _$LikerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? screenName = freezed,
    Object? profileImageURL = freezed,
    Object? isFollowed = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikerDataImplCopyWith<$Res>
    implements $LikerDataCopyWith<$Res> {
  factory _$$LikerDataImplCopyWith(
          _$LikerDataImpl value, $Res Function(_$LikerDataImpl) then) =
      __$$LikerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? screenName,
      String? profileImageURL,
      bool? isFollowed});
}

/// @nodoc
class __$$LikerDataImplCopyWithImpl<$Res>
    extends _$LikerDataCopyWithImpl<$Res, _$LikerDataImpl>
    implements _$$LikerDataImplCopyWith<$Res> {
  __$$LikerDataImplCopyWithImpl(
      _$LikerDataImpl _value, $Res Function(_$LikerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? screenName = freezed,
    Object? profileImageURL = freezed,
    Object? isFollowed = freezed,
  }) {
    return _then(_$LikerDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikerDataImpl implements _LikerData {
  const _$LikerDataImpl(
      {this.id,
      this.name,
      this.screenName,
      this.profileImageURL,
      this.isFollowed});

  factory _$LikerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikerDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? screenName;
  @override
  final String? profileImageURL;
  @override
  final bool? isFollowed;

  @override
  String toString() {
    return 'LikerData(id: $id, name: $name, screenName: $screenName, profileImageURL: $profileImageURL, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikerDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.profileImageURL, profileImageURL) ||
                other.profileImageURL == profileImageURL) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, screenName, profileImageURL, isFollowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikerDataImplCopyWith<_$LikerDataImpl> get copyWith =>
      __$$LikerDataImplCopyWithImpl<_$LikerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikerDataImplToJson(
      this,
    );
  }
}

abstract class _LikerData implements LikerData {
  const factory _LikerData(
      {final String? id,
      final String? name,
      final String? screenName,
      final String? profileImageURL,
      final bool? isFollowed}) = _$LikerDataImpl;

  factory _LikerData.fromJson(Map<String, dynamic> json) =
      _$LikerDataImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get screenName;
  @override
  String? get profileImageURL;
  @override
  bool? get isFollowed;
  @override
  @JsonKey(ignore: true)
  _$$LikerDataImplCopyWith<_$LikerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LikersList _$LikersListFromJson(Map<String, dynamic> json) {
  return _LikersList.fromJson(json);
}

/// @nodoc
mixin _$LikersList {
  List<LikerData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikersListCopyWith<LikersList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikersListCopyWith<$Res> {
  factory $LikersListCopyWith(
          LikersList value, $Res Function(LikersList) then) =
      _$LikersListCopyWithImpl<$Res, LikersList>;
  @useResult
  $Res call({List<LikerData>? data});
}

/// @nodoc
class _$LikersListCopyWithImpl<$Res, $Val extends LikersList>
    implements $LikersListCopyWith<$Res> {
  _$LikersListCopyWithImpl(this._value, this._then);

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
              as List<LikerData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikersListImplCopyWith<$Res>
    implements $LikersListCopyWith<$Res> {
  factory _$$LikersListImplCopyWith(
          _$LikersListImpl value, $Res Function(_$LikersListImpl) then) =
      __$$LikersListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LikerData>? data});
}

/// @nodoc
class __$$LikersListImplCopyWithImpl<$Res>
    extends _$LikersListCopyWithImpl<$Res, _$LikersListImpl>
    implements _$$LikersListImplCopyWith<$Res> {
  __$$LikersListImplCopyWithImpl(
      _$LikersListImpl _value, $Res Function(_$LikersListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$LikersListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LikerData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LikersListImpl implements _LikersList {
  const _$LikersListImpl({final List<LikerData>? data}) : _data = data;

  factory _$LikersListImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikersListImplFromJson(json);

  final List<LikerData>? _data;
  @override
  List<LikerData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LikersList(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikersListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikersListImplCopyWith<_$LikersListImpl> get copyWith =>
      __$$LikersListImplCopyWithImpl<_$LikersListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikersListImplToJson(
      this,
    );
  }
}

abstract class _LikersList implements LikersList {
  const factory _LikersList({final List<LikerData>? data}) = _$LikersListImpl;

  factory _LikersList.fromJson(Map<String, dynamic> json) =
      _$LikersListImpl.fromJson;

  @override
  List<LikerData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$LikersListImplCopyWith<_$LikersListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
