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

RetweeterData _$RetweeterDataFromJson(Map<String, dynamic> json) {
  return _RetweeterData.fromJson(json);
}

/// @nodoc
mixin _$RetweeterData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get screenName => throw _privateConstructorUsedError;
  String? get profileImageURL => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RetweeterDataCopyWith<RetweeterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetweeterDataCopyWith<$Res> {
  factory $RetweeterDataCopyWith(
          RetweeterData value, $Res Function(RetweeterData) then) =
      _$RetweeterDataCopyWithImpl<$Res, RetweeterData>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? screenName,
      String? profileImageURL,
      bool? isFollowed});
}

/// @nodoc
class _$RetweeterDataCopyWithImpl<$Res, $Val extends RetweeterData>
    implements $RetweeterDataCopyWith<$Res> {
  _$RetweeterDataCopyWithImpl(this._value, this._then);

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
abstract class _$$RetweeterDataImplCopyWith<$Res>
    implements $RetweeterDataCopyWith<$Res> {
  factory _$$RetweeterDataImplCopyWith(
          _$RetweeterDataImpl value, $Res Function(_$RetweeterDataImpl) then) =
      __$$RetweeterDataImplCopyWithImpl<$Res>;
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
class __$$RetweeterDataImplCopyWithImpl<$Res>
    extends _$RetweeterDataCopyWithImpl<$Res, _$RetweeterDataImpl>
    implements _$$RetweeterDataImplCopyWith<$Res> {
  __$$RetweeterDataImplCopyWithImpl(
      _$RetweeterDataImpl _value, $Res Function(_$RetweeterDataImpl) _then)
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
    return _then(_$RetweeterDataImpl(
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
class _$RetweeterDataImpl implements _RetweeterData {
  const _$RetweeterDataImpl(
      {this.id,
      this.name,
      this.screenName,
      this.profileImageURL,
      this.isFollowed});

  factory _$RetweeterDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetweeterDataImplFromJson(json);

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
    return 'RetweeterData(id: $id, name: $name, screenName: $screenName, profileImageURL: $profileImageURL, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetweeterDataImpl &&
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
  _$$RetweeterDataImplCopyWith<_$RetweeterDataImpl> get copyWith =>
      __$$RetweeterDataImplCopyWithImpl<_$RetweeterDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetweeterDataImplToJson(
      this,
    );
  }
}

abstract class _RetweeterData implements RetweeterData {
  const factory _RetweeterData(
      {final String? id,
      final String? name,
      final String? screenName,
      final String? profileImageURL,
      final bool? isFollowed}) = _$RetweeterDataImpl;

  factory _RetweeterData.fromJson(Map<String, dynamic> json) =
      _$RetweeterDataImpl.fromJson;

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
  _$$RetweeterDataImplCopyWith<_$RetweeterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RetweetersList _$RetweetersListFromJson(Map<String, dynamic> json) {
  return _RetweetersList.fromJson(json);
}

/// @nodoc
mixin _$RetweetersList {
  List<RetweeterData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RetweetersListCopyWith<RetweetersList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetweetersListCopyWith<$Res> {
  factory $RetweetersListCopyWith(
          RetweetersList value, $Res Function(RetweetersList) then) =
      _$RetweetersListCopyWithImpl<$Res, RetweetersList>;
  @useResult
  $Res call({List<RetweeterData>? data});
}

/// @nodoc
class _$RetweetersListCopyWithImpl<$Res, $Val extends RetweetersList>
    implements $RetweetersListCopyWith<$Res> {
  _$RetweetersListCopyWithImpl(this._value, this._then);

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
              as List<RetweeterData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RetweetersListImplCopyWith<$Res>
    implements $RetweetersListCopyWith<$Res> {
  factory _$$RetweetersListImplCopyWith(_$RetweetersListImpl value,
          $Res Function(_$RetweetersListImpl) then) =
      __$$RetweetersListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RetweeterData>? data});
}

/// @nodoc
class __$$RetweetersListImplCopyWithImpl<$Res>
    extends _$RetweetersListCopyWithImpl<$Res, _$RetweetersListImpl>
    implements _$$RetweetersListImplCopyWith<$Res> {
  __$$RetweetersListImplCopyWithImpl(
      _$RetweetersListImpl _value, $Res Function(_$RetweetersListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RetweetersListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RetweeterData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RetweetersListImpl implements _RetweetersList {
  const _$RetweetersListImpl({final List<RetweeterData>? data}) : _data = data;

  factory _$RetweetersListImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetweetersListImplFromJson(json);

  final List<RetweeterData>? _data;
  @override
  List<RetweeterData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RetweetersList(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetweetersListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetweetersListImplCopyWith<_$RetweetersListImpl> get copyWith =>
      __$$RetweetersListImplCopyWithImpl<_$RetweetersListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetweetersListImplToJson(
      this,
    );
  }
}

abstract class _RetweetersList implements RetweetersList {
  const factory _RetweetersList({final List<RetweeterData>? data}) =
      _$RetweetersListImpl;

  factory _RetweetersList.fromJson(Map<String, dynamic> json) =
      _$RetweetersListImpl.fromJson;

  @override
  List<RetweeterData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$RetweetersListImplCopyWith<_$RetweetersListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReplierData _$ReplierDataFromJson(Map<String, dynamic> json) {
  return _ReplierData.fromJson(json);
}

/// @nodoc
mixin _$ReplierData {
  String? get replyId => throw _privateConstructorUsedError;
  String? get replyTweetId => throw _privateConstructorUsedError;
  String? get replyUserId => throw _privateConstructorUsedError;
  String? get replyText => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get screenName => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get profileImageURL => throw _privateConstructorUsedError;
  String? get followersCount => throw _privateConstructorUsedError;
  String? get followingCount => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplierDataCopyWith<ReplierData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplierDataCopyWith<$Res> {
  factory $ReplierDataCopyWith(
          ReplierData value, $Res Function(ReplierData) then) =
      _$ReplierDataCopyWithImpl<$Res, ReplierData>;
  @useResult
  $Res call(
      {String? replyId,
      String? replyTweetId,
      String? replyUserId,
      String? replyText,
      String? createdAt,
      String? username,
      String? screenName,
      String? bio,
      String? profileImageURL,
      String? followersCount,
      String? followingCount,
      bool? isFollowed});
}

/// @nodoc
class _$ReplierDataCopyWithImpl<$Res, $Val extends ReplierData>
    implements $ReplierDataCopyWith<$Res> {
  _$ReplierDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyId = freezed,
    Object? replyTweetId = freezed,
    Object? replyUserId = freezed,
    Object? replyText = freezed,
    Object? createdAt = freezed,
    Object? username = freezed,
    Object? screenName = freezed,
    Object? bio = freezed,
    Object? profileImageURL = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
    Object? isFollowed = freezed,
  }) {
    return _then(_value.copyWith(
      replyId: freezed == replyId
          ? _value.replyId
          : replyId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyTweetId: freezed == replyTweetId
          ? _value.replyTweetId
          : replyTweetId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyUserId: freezed == replyUserId
          ? _value.replyUserId
          : replyUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyText: freezed == replyText
          ? _value.replyText
          : replyText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReplierDataImplCopyWith<$Res>
    implements $ReplierDataCopyWith<$Res> {
  factory _$$ReplierDataImplCopyWith(
          _$ReplierDataImpl value, $Res Function(_$ReplierDataImpl) then) =
      __$$ReplierDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? replyId,
      String? replyTweetId,
      String? replyUserId,
      String? replyText,
      String? createdAt,
      String? username,
      String? screenName,
      String? bio,
      String? profileImageURL,
      String? followersCount,
      String? followingCount,
      bool? isFollowed});
}

/// @nodoc
class __$$ReplierDataImplCopyWithImpl<$Res>
    extends _$ReplierDataCopyWithImpl<$Res, _$ReplierDataImpl>
    implements _$$ReplierDataImplCopyWith<$Res> {
  __$$ReplierDataImplCopyWithImpl(
      _$ReplierDataImpl _value, $Res Function(_$ReplierDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyId = freezed,
    Object? replyTweetId = freezed,
    Object? replyUserId = freezed,
    Object? replyText = freezed,
    Object? createdAt = freezed,
    Object? username = freezed,
    Object? screenName = freezed,
    Object? bio = freezed,
    Object? profileImageURL = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
    Object? isFollowed = freezed,
  }) {
    return _then(_$ReplierDataImpl(
      replyId: freezed == replyId
          ? _value.replyId
          : replyId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyTweetId: freezed == replyTweetId
          ? _value.replyTweetId
          : replyTweetId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyUserId: freezed == replyUserId
          ? _value.replyUserId
          : replyUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      replyText: freezed == replyText
          ? _value.replyText
          : replyText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
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
class _$ReplierDataImpl implements _ReplierData {
  const _$ReplierDataImpl(
      {this.replyId,
      this.replyTweetId,
      this.replyUserId,
      this.replyText,
      this.createdAt,
      this.username,
      this.screenName,
      this.bio,
      this.profileImageURL,
      this.followersCount,
      this.followingCount,
      this.isFollowed});

  factory _$ReplierDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplierDataImplFromJson(json);

  @override
  final String? replyId;
  @override
  final String? replyTweetId;
  @override
  final String? replyUserId;
  @override
  final String? replyText;
  @override
  final String? createdAt;
  @override
  final String? username;
  @override
  final String? screenName;
  @override
  final String? bio;
  @override
  final String? profileImageURL;
  @override
  final String? followersCount;
  @override
  final String? followingCount;
  @override
  final bool? isFollowed;

  @override
  String toString() {
    return 'ReplierData(replyId: $replyId, replyTweetId: $replyTweetId, replyUserId: $replyUserId, replyText: $replyText, createdAt: $createdAt, username: $username, screenName: $screenName, bio: $bio, profileImageURL: $profileImageURL, followersCount: $followersCount, followingCount: $followingCount, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplierDataImpl &&
            (identical(other.replyId, replyId) || other.replyId == replyId) &&
            (identical(other.replyTweetId, replyTweetId) ||
                other.replyTweetId == replyTweetId) &&
            (identical(other.replyUserId, replyUserId) ||
                other.replyUserId == replyUserId) &&
            (identical(other.replyText, replyText) ||
                other.replyText == replyText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profileImageURL, profileImageURL) ||
                other.profileImageURL == profileImageURL) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      replyId,
      replyTweetId,
      replyUserId,
      replyText,
      createdAt,
      username,
      screenName,
      bio,
      profileImageURL,
      followersCount,
      followingCount,
      isFollowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplierDataImplCopyWith<_$ReplierDataImpl> get copyWith =>
      __$$ReplierDataImplCopyWithImpl<_$ReplierDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplierDataImplToJson(
      this,
    );
  }
}

abstract class _ReplierData implements ReplierData {
  const factory _ReplierData(
      {final String? replyId,
      final String? replyTweetId,
      final String? replyUserId,
      final String? replyText,
      final String? createdAt,
      final String? username,
      final String? screenName,
      final String? bio,
      final String? profileImageURL,
      final String? followersCount,
      final String? followingCount,
      final bool? isFollowed}) = _$ReplierDataImpl;

  factory _ReplierData.fromJson(Map<String, dynamic> json) =
      _$ReplierDataImpl.fromJson;

  @override
  String? get replyId;
  @override
  String? get replyTweetId;
  @override
  String? get replyUserId;
  @override
  String? get replyText;
  @override
  String? get createdAt;
  @override
  String? get username;
  @override
  String? get screenName;
  @override
  String? get bio;
  @override
  String? get profileImageURL;
  @override
  String? get followersCount;
  @override
  String? get followingCount;
  @override
  bool? get isFollowed;
  @override
  @JsonKey(ignore: true)
  _$$ReplierDataImplCopyWith<_$ReplierDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepliersList _$RepliersListFromJson(Map<String, dynamic> json) {
  return _RepliersList.fromJson(json);
}

/// @nodoc
mixin _$RepliersList {
  List<ReplierData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepliersListCopyWith<RepliersList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliersListCopyWith<$Res> {
  factory $RepliersListCopyWith(
          RepliersList value, $Res Function(RepliersList) then) =
      _$RepliersListCopyWithImpl<$Res, RepliersList>;
  @useResult
  $Res call({List<ReplierData>? data});
}

/// @nodoc
class _$RepliersListCopyWithImpl<$Res, $Val extends RepliersList>
    implements $RepliersListCopyWith<$Res> {
  _$RepliersListCopyWithImpl(this._value, this._then);

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
              as List<ReplierData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepliersListImplCopyWith<$Res>
    implements $RepliersListCopyWith<$Res> {
  factory _$$RepliersListImplCopyWith(
          _$RepliersListImpl value, $Res Function(_$RepliersListImpl) then) =
      __$$RepliersListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReplierData>? data});
}

/// @nodoc
class __$$RepliersListImplCopyWithImpl<$Res>
    extends _$RepliersListCopyWithImpl<$Res, _$RepliersListImpl>
    implements _$$RepliersListImplCopyWith<$Res> {
  __$$RepliersListImplCopyWithImpl(
      _$RepliersListImpl _value, $Res Function(_$RepliersListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RepliersListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReplierData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepliersListImpl implements _RepliersList {
  const _$RepliersListImpl({final List<ReplierData>? data}) : _data = data;

  factory _$RepliersListImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepliersListImplFromJson(json);

  final List<ReplierData>? _data;
  @override
  List<ReplierData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RepliersList(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepliersListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepliersListImplCopyWith<_$RepliersListImpl> get copyWith =>
      __$$RepliersListImplCopyWithImpl<_$RepliersListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepliersListImplToJson(
      this,
    );
  }
}

abstract class _RepliersList implements RepliersList {
  const factory _RepliersList({final List<ReplierData>? data}) =
      _$RepliersListImpl;

  factory _RepliersList.fromJson(Map<String, dynamic> json) =
      _$RepliersListImpl.fromJson;

  @override
  List<ReplierData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$RepliersListImplCopyWith<_$RepliersListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
