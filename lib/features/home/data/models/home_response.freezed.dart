// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) {
  return _HomeResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeResponse {
  List<Tweet> get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeResponseCopyWith<HomeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeResponseCopyWith<$Res> {
  factory $HomeResponseCopyWith(
          HomeResponse value, $Res Function(HomeResponse) then) =
      _$HomeResponseCopyWithImpl<$Res, HomeResponse>;
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class _$HomeResponseCopyWithImpl<$Res, $Val extends HomeResponse>
    implements $HomeResponseCopyWith<$Res> {
  _$HomeResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$HomeResponseImplCopyWith<$Res>
    implements $HomeResponseCopyWith<$Res> {
  factory _$$HomeResponseImplCopyWith(
          _$HomeResponseImpl value, $Res Function(_$HomeResponseImpl) then) =
      __$$HomeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class __$$HomeResponseImplCopyWithImpl<$Res>
    extends _$HomeResponseCopyWithImpl<$Res, _$HomeResponseImpl>
    implements _$$HomeResponseImplCopyWith<$Res> {
  __$$HomeResponseImplCopyWithImpl(
      _$HomeResponseImpl _value, $Res Function(_$HomeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_$HomeResponseImpl(
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
class _$HomeResponseImpl implements _HomeResponse {
  const _$HomeResponseImpl({final List<Tweet> data = const [], this.total})
      : _data = data;

  factory _$HomeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeResponseImplFromJson(json);

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
    return 'HomeResponse(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeResponseImpl &&
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
  _$$HomeResponseImplCopyWith<_$HomeResponseImpl> get copyWith =>
      __$$HomeResponseImplCopyWithImpl<_$HomeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeResponseImplToJson(
      this,
    );
  }
}

abstract class _HomeResponse implements HomeResponse {
  const factory _HomeResponse({final List<Tweet> data, final int? total}) =
      _$HomeResponseImpl;

  factory _HomeResponse.fromJson(Map<String, dynamic> json) =
      _$HomeResponseImpl.fromJson;

  @override
  List<Tweet> get data;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$HomeResponseImplCopyWith<_$HomeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return _Tweet.fromJson(json);
}

/// @nodoc
mixin _$Tweet {
  String? get id => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get isRetweet => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  User? get retweetedUser => throw _privateConstructorUsedError;
  List<String>? get attachmentsUrl => throw _privateConstructorUsedError;
  bool? get isLiked => throw _privateConstructorUsedError;
  bool? get isRetweeted => throw _privateConstructorUsedError;
  bool? get isReplied => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  int? get retweetsCount => throw _privateConstructorUsedError;
  int? get repliesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCopyWith<Tweet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCopyWith<$Res> {
  factory $TweetCopyWith(Tweet value, $Res Function(Tweet) then) =
      _$TweetCopyWithImpl<$Res, Tweet>;
  @useResult
  $Res call(
      {String? id,
      String? text,
      String? createdAt,
      bool? isRetweet,
      User? user,
      User? retweetedUser,
      List<String>? attachmentsUrl,
      bool? isLiked,
      bool? isRetweeted,
      bool? isReplied,
      int? likesCount,
      int? retweetsCount,
      int? repliesCount});

  $UserCopyWith<$Res>? get user;
  $UserCopyWith<$Res>? get retweetedUser;
}

/// @nodoc
class _$TweetCopyWithImpl<$Res, $Val extends Tweet>
    implements $TweetCopyWith<$Res> {
  _$TweetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
    Object? isRetweet = freezed,
    Object? user = freezed,
    Object? retweetedUser = freezed,
    Object? attachmentsUrl = freezed,
    Object? isLiked = freezed,
    Object? isRetweeted = freezed,
    Object? isReplied = freezed,
    Object? likesCount = freezed,
    Object? retweetsCount = freezed,
    Object? repliesCount = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isRetweet: freezed == isRetweet
          ? _value.isRetweet
          : isRetweet // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      retweetedUser: freezed == retweetedUser
          ? _value.retweetedUser
          : retweetedUser // ignore: cast_nullable_to_non_nullable
              as User?,
      attachmentsUrl: freezed == attachmentsUrl
          ? _value.attachmentsUrl
          : attachmentsUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRetweeted: freezed == isRetweeted
          ? _value.isRetweeted
          : isRetweeted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReplied: freezed == isReplied
          ? _value.isReplied
          : isReplied // ignore: cast_nullable_to_non_nullable
              as bool?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      retweetsCount: freezed == retweetsCount
          ? _value.retweetsCount
          : retweetsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      repliesCount: freezed == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get retweetedUser {
    if (_value.retweetedUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.retweetedUser!, (value) {
      return _then(_value.copyWith(retweetedUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TweetImplCopyWith<$Res> implements $TweetCopyWith<$Res> {
  factory _$$TweetImplCopyWith(
          _$TweetImpl value, $Res Function(_$TweetImpl) then) =
      __$$TweetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? text,
      String? createdAt,
      bool? isRetweet,
      User? user,
      User? retweetedUser,
      List<String>? attachmentsUrl,
      bool? isLiked,
      bool? isRetweeted,
      bool? isReplied,
      int? likesCount,
      int? retweetsCount,
      int? repliesCount});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $UserCopyWith<$Res>? get retweetedUser;
}

/// @nodoc
class __$$TweetImplCopyWithImpl<$Res>
    extends _$TweetCopyWithImpl<$Res, _$TweetImpl>
    implements _$$TweetImplCopyWith<$Res> {
  __$$TweetImplCopyWithImpl(
      _$TweetImpl _value, $Res Function(_$TweetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? createdAt = freezed,
    Object? isRetweet = freezed,
    Object? user = freezed,
    Object? retweetedUser = freezed,
    Object? attachmentsUrl = freezed,
    Object? isLiked = freezed,
    Object? isRetweeted = freezed,
    Object? isReplied = freezed,
    Object? likesCount = freezed,
    Object? retweetsCount = freezed,
    Object? repliesCount = freezed,
  }) {
    return _then(_$TweetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isRetweet: freezed == isRetweet
          ? _value.isRetweet
          : isRetweet // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      retweetedUser: freezed == retweetedUser
          ? _value.retweetedUser
          : retweetedUser // ignore: cast_nullable_to_non_nullable
              as User?,
      attachmentsUrl: freezed == attachmentsUrl
          ? _value._attachmentsUrl
          : attachmentsUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isLiked: freezed == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRetweeted: freezed == isRetweeted
          ? _value.isRetweeted
          : isRetweeted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReplied: freezed == isReplied
          ? _value.isReplied
          : isReplied // ignore: cast_nullable_to_non_nullable
              as bool?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      retweetsCount: freezed == retweetsCount
          ? _value.retweetsCount
          : retweetsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      repliesCount: freezed == repliesCount
          ? _value.repliesCount
          : repliesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TweetImpl implements _Tweet {
  const _$TweetImpl(
      {this.id,
      this.text,
      this.createdAt,
      this.isRetweet,
      this.user,
      this.retweetedUser,
      final List<String>? attachmentsUrl,
      this.isLiked,
      this.isRetweeted,
      this.isReplied,
      this.likesCount,
      this.retweetsCount,
      this.repliesCount})
      : _attachmentsUrl = attachmentsUrl;

  factory _$TweetImpl.fromJson(Map<String, dynamic> json) =>
      _$$TweetImplFromJson(json);

  @override
  final String? id;
  @override
  final String? text;
  @override
  final String? createdAt;
  @override
  final bool? isRetweet;
  @override
  final User? user;
  @override
  final User? retweetedUser;
  final List<String>? _attachmentsUrl;
  @override
  List<String>? get attachmentsUrl {
    final value = _attachmentsUrl;
    if (value == null) return null;
    if (_attachmentsUrl is EqualUnmodifiableListView) return _attachmentsUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isLiked;
  @override
  final bool? isRetweeted;
  @override
  final bool? isReplied;
  @override
  final int? likesCount;
  @override
  final int? retweetsCount;
  @override
  final int? repliesCount;

  @override
  String toString() {
    return 'Tweet(id: $id, text: $text, createdAt: $createdAt, isRetweet: $isRetweet, user: $user, retweetedUser: $retweetedUser, attachmentsUrl: $attachmentsUrl, isLiked: $isLiked, isRetweeted: $isRetweeted, isReplied: $isReplied, likesCount: $likesCount, retweetsCount: $retweetsCount, repliesCount: $repliesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRetweet, isRetweet) ||
                other.isRetweet == isRetweet) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.retweetedUser, retweetedUser) ||
                other.retweetedUser == retweetedUser) &&
            const DeepCollectionEquality()
                .equals(other._attachmentsUrl, _attachmentsUrl) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isRetweeted, isRetweeted) ||
                other.isRetweeted == isRetweeted) &&
            (identical(other.isReplied, isReplied) ||
                other.isReplied == isReplied) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.retweetsCount, retweetsCount) ||
                other.retweetsCount == retweetsCount) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      text,
      createdAt,
      isRetweet,
      user,
      retweetedUser,
      const DeepCollectionEquality().hash(_attachmentsUrl),
      isLiked,
      isRetweeted,
      isReplied,
      likesCount,
      retweetsCount,
      repliesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetImplCopyWith<_$TweetImpl> get copyWith =>
      __$$TweetImplCopyWithImpl<_$TweetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TweetImplToJson(
      this,
    );
  }
}

abstract class _Tweet implements Tweet {
  const factory _Tweet(
      {final String? id,
      final String? text,
      final String? createdAt,
      final bool? isRetweet,
      final User? user,
      final User? retweetedUser,
      final List<String>? attachmentsUrl,
      final bool? isLiked,
      final bool? isRetweeted,
      final bool? isReplied,
      final int? likesCount,
      final int? retweetsCount,
      final int? repliesCount}) = _$TweetImpl;

  factory _Tweet.fromJson(Map<String, dynamic> json) = _$TweetImpl.fromJson;

  @override
  String? get id;
  @override
  String? get text;
  @override
  String? get createdAt;
  @override
  bool? get isRetweet;
  @override
  User? get user;
  @override
  User? get retweetedUser;
  @override
  List<String>? get attachmentsUrl;
  @override
  bool? get isLiked;
  @override
  bool? get isRetweeted;
  @override
  bool? get isReplied;
  @override
  int? get likesCount;
  @override
  int? get retweetsCount;
  @override
  int? get repliesCount;
  @override
  @JsonKey(ignore: true)
  _$$TweetImplCopyWith<_$TweetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
