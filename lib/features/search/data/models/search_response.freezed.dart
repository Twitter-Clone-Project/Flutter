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
  String? get count => throw _privateConstructorUsedError;

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
  $Res call({String? name, String? count});
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
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
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
  $Res call({String? name, String? count});
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
    Object? count = freezed,
  }) {
    return _then(_$TrendDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendDataImpl implements _TrendData {
  const _$TrendDataImpl({this.name, this.count});

  factory _$TrendDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? count;

  @override
  String toString() {
    return 'TrendData(name: $name, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, count);

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
  const factory _TrendData({final String? name, final String? count}) =
      _$TrendDataImpl;

  factory _TrendData.fromJson(Map<String, dynamic> json) =
      _$TrendDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get count;
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
  bool operator ==(Object other) {
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

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get screenName => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profileImageURL => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;
  bool? get isFollowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? screenName,
      String? username,
      String? profileImageURL,
      String? bio,
      bool? isFollowed,
      bool? isFollowing});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? screenName = freezed,
    Object? username = freezed,
    Object? profileImageURL = freezed,
    Object? bio = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? screenName,
      String? username,
      String? profileImageURL,
      String? bio,
      bool? isFollowed,
      bool? isFollowing});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? screenName = freezed,
    Object? username = freezed,
    Object? profileImageURL = freezed,
    Object? bio = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
  }) {
    return _then(_$UserDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      screenName: freezed == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageURL: freezed == profileImageURL
          ? _value.profileImageURL
          : profileImageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.id,
      this.email,
      this.screenName,
      this.username,
      this.profileImageURL,
      this.bio,
      this.isFollowed,
      this.isFollowing});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? screenName;
  @override
  final String? username;
  @override
  final String? profileImageURL;
  @override
  final String? bio;
  @override
  final bool? isFollowed;
  @override
  final bool? isFollowing;

  @override
  String toString() {
    return 'UserData(id: $id, email: $email, screenName: $screenName, username: $username, profileImageURL: $profileImageURL, bio: $bio, isFollowed: $isFollowed, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profileImageURL, profileImageURL) ||
                other.profileImageURL == profileImageURL) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, screenName, username,
      profileImageURL, bio, isFollowed, isFollowing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final String? id,
      final String? email,
      final String? screenName,
      final String? username,
      final String? profileImageURL,
      final String? bio,
      final bool? isFollowed,
      final bool? isFollowing}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String? get id;
  @override
  String? get email;
  @override
  String? get screenName;
  @override
  String? get username;
  @override
  String? get profileImageURL;
  @override
  String? get bio;
  @override
  bool? get isFollowed;
  @override
  bool? get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsersList _$UsersListFromJson(Map<String, dynamic> json) {
  return _UsersList.fromJson(json);
}

/// @nodoc
mixin _$UsersList {
  List<UserData> get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersListCopyWith<UsersList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListCopyWith<$Res> {
  factory $UsersListCopyWith(UsersList value, $Res Function(UsersList) then) =
      _$UsersListCopyWithImpl<$Res, UsersList>;
  @useResult
  $Res call({List<UserData> data, int? total});
}

/// @nodoc
class _$UsersListCopyWithImpl<$Res, $Val extends UsersList>
    implements $UsersListCopyWith<$Res> {
  _$UsersListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersListImplCopyWith<$Res>
    implements $UsersListCopyWith<$Res> {
  factory _$$UsersListImplCopyWith(
          _$UsersListImpl value, $Res Function(_$UsersListImpl) then) =
      __$$UsersListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserData> data, int? total});
}

/// @nodoc
class __$$UsersListImplCopyWithImpl<$Res>
    extends _$UsersListCopyWithImpl<$Res, _$UsersListImpl>
    implements _$$UsersListImplCopyWith<$Res> {
  __$$UsersListImplCopyWithImpl(
      _$UsersListImpl _value, $Res Function(_$UsersListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_$UsersListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersListImpl implements _UsersList {
  const _$UsersListImpl({final List<UserData> data = const [], this.total})
      : _data = data;

  factory _$UsersListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersListImplFromJson(json);

  final List<UserData> _data;
  @override
  @JsonKey()
  List<UserData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? total;

  @override
  String toString() {
    return 'UsersList(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersListImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersListImplCopyWith<_$UsersListImpl> get copyWith =>
      __$$UsersListImplCopyWithImpl<_$UsersListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersListImplToJson(
      this,
    );
  }
}

abstract class _UsersList implements UsersList {
  const factory _UsersList({final List<UserData> data, final int? total}) =
      _$UsersListImpl;

  factory _UsersList.fromJson(Map<String, dynamic> json) =
      _$UsersListImpl.fromJson;

  @override
  List<UserData> get data;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$UsersListImplCopyWith<_$UsersListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TweetList _$TweetListFromJson(Map<String, dynamic> json) {
  return _TweetList.fromJson(json);
}

/// @nodoc
mixin _$TweetList {
  List<Tweet> get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetListCopyWith<TweetList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetListCopyWith<$Res> {
  factory $TweetListCopyWith(TweetList value, $Res Function(TweetList) then) =
      _$TweetListCopyWithImpl<$Res, TweetList>;
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class _$TweetListCopyWithImpl<$Res, $Val extends TweetList>
    implements $TweetListCopyWith<$Res> {
  _$TweetListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Tweet>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TweetListImplCopyWith<$Res>
    implements $TweetListCopyWith<$Res> {
  factory _$$TweetListImplCopyWith(
          _$TweetListImpl value, $Res Function(_$TweetListImpl) then) =
      __$$TweetListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class __$$TweetListImplCopyWithImpl<$Res>
    extends _$TweetListCopyWithImpl<$Res, _$TweetListImpl>
    implements _$$TweetListImplCopyWith<$Res> {
  __$$TweetListImplCopyWithImpl(
      _$TweetListImpl _value, $Res Function(_$TweetListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_$TweetListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Tweet>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TweetListImpl implements _TweetList {
  const _$TweetListImpl({final List<Tweet> data = const [], this.total})
      : _data = data;

  factory _$TweetListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TweetListImplFromJson(json);

  final List<Tweet> _data;
  @override
  @JsonKey()
  List<Tweet> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? total;

  @override
  String toString() {
    return 'TweetList(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetListImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetListImplCopyWith<_$TweetListImpl> get copyWith =>
      __$$TweetListImplCopyWithImpl<_$TweetListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TweetListImplToJson(
      this,
    );
  }
}

abstract class _TweetList implements TweetList {
  const factory _TweetList({final List<Tweet> data, final int? total}) =
      _$TweetListImpl;

  factory _TweetList.fromJson(Map<String, dynamic> json) =
      _$TweetListImpl.fromJson;

  @override
  List<Tweet> get data;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$TweetListImplCopyWith<_$TweetListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
