// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get bannerUrl => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;
  bool? get isConfirmed => throw _privateConstructorUsedError;
  bool? get isFollowing => throw _privateConstructorUsedError;
  bool? get isMuted => throw _privateConstructorUsedError;
  bool? get isBlocked => throw _privateConstructorUsedError;
  bool? get isBlockingMe => throw _privateConstructorUsedError;
  String? get followersCount => throw _privateConstructorUsedError;
  String? get followingsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String? userId,
      String? name,
      String? username,
      String? bio,
      String? website,
      String? location,
      String imageUrl,
      String bannerUrl,
      String? birthDate,
      String? createdAt,
      bool? isFollowed,
      bool? isConfirmed,
      bool? isFollowing,
      bool? isMuted,
      bool? isBlocked,
      bool? isBlockingMe,
      String? followersCount,
      String? followingsCount});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? bio = freezed,
    Object? website = freezed,
    Object? location = freezed,
    Object? imageUrl = null,
    Object? bannerUrl = null,
    Object? birthDate = freezed,
    Object? createdAt = freezed,
    Object? isFollowed = freezed,
    Object? isConfirmed = freezed,
    Object? isFollowing = freezed,
    Object? isMuted = freezed,
    Object? isBlocked = freezed,
    Object? isBlockingMe = freezed,
    Object? followersCount = freezed,
    Object? followingsCount = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConfirmed: freezed == isConfirmed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMuted: freezed == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlockingMe: freezed == isBlockingMe
          ? _value.isBlockingMe
          : isBlockingMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingsCount: freezed == followingsCount
          ? _value.followingsCount
          : followingsCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? name,
      String? username,
      String? bio,
      String? website,
      String? location,
      String imageUrl,
      String bannerUrl,
      String? birthDate,
      String? createdAt,
      bool? isFollowed,
      bool? isConfirmed,
      bool? isFollowing,
      bool? isMuted,
      bool? isBlocked,
      bool? isBlockingMe,
      String? followersCount,
      String? followingsCount});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? bio = freezed,
    Object? website = freezed,
    Object? location = freezed,
    Object? imageUrl = null,
    Object? bannerUrl = null,
    Object? birthDate = freezed,
    Object? createdAt = freezed,
    Object? isFollowed = freezed,
    Object? isConfirmed = freezed,
    Object? isFollowing = freezed,
    Object? isMuted = freezed,
    Object? isBlocked = freezed,
    Object? isBlockingMe = freezed,
    Object? followersCount = freezed,
    Object? followingsCount = freezed,
  }) {
    return _then(_$UserProfileImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConfirmed: freezed == isConfirmed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMuted: freezed == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlocked: freezed == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBlockingMe: freezed == isBlockingMe
          ? _value.isBlockingMe
          : isBlockingMe // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingsCount: freezed == followingsCount
          ? _value.followingsCount
          : followingsCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {this.userId,
      this.name,
      this.username,
      this.bio,
      this.website,
      this.location,
      this.imageUrl =
          "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg",
      this.bannerUrl =
          "https://kady-twitter-images.s3.amazonaws.com/DefaultBanner.png",
      this.birthDate,
      this.createdAt,
      this.isFollowed,
      this.isConfirmed,
      this.isFollowing,
      this.isMuted,
      this.isBlocked,
      this.isBlockingMe,
      this.followersCount,
      this.followingsCount});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? bio;
  @override
  final String? website;
  @override
  final String? location;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String bannerUrl;
  @override
  final String? birthDate;
  @override
  final String? createdAt;
  @override
  final bool? isFollowed;
  @override
  final bool? isConfirmed;
  @override
  final bool? isFollowing;
  @override
  final bool? isMuted;
  @override
  final bool? isBlocked;
  @override
  final bool? isBlockingMe;
  @override
  final String? followersCount;
  @override
  final String? followingsCount;

  @override
  String toString() {
    return 'UserProfile(userId: $userId, name: $name, username: $username, bio: $bio, website: $website, location: $location, imageUrl: $imageUrl, bannerUrl: $bannerUrl, birthDate: $birthDate, createdAt: $createdAt, isFollowed: $isFollowed, isConfirmed: $isConfirmed, isFollowing: $isFollowing, isMuted: $isMuted, isBlocked: $isBlocked, isBlockingMe: $isBlockingMe, followersCount: $followersCount, followingsCount: $followingsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isBlockingMe, isBlockingMe) ||
                other.isBlockingMe == isBlockingMe) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingsCount, followingsCount) ||
                other.followingsCount == followingsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      name,
      username,
      bio,
      website,
      location,
      imageUrl,
      bannerUrl,
      birthDate,
      createdAt,
      isFollowed,
      isConfirmed,
      isFollowing,
      isMuted,
      isBlocked,
      isBlockingMe,
      followersCount,
      followingsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {final String? userId,
      final String? name,
      final String? username,
      final String? bio,
      final String? website,
      final String? location,
      final String imageUrl,
      final String bannerUrl,
      final String? birthDate,
      final String? createdAt,
      final bool? isFollowed,
      final bool? isConfirmed,
      final bool? isFollowing,
      final bool? isMuted,
      final bool? isBlocked,
      final bool? isBlockingMe,
      final String? followersCount,
      final String? followingsCount}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get bio;
  @override
  String? get website;
  @override
  String? get location;
  @override
  String get imageUrl;
  @override
  String get bannerUrl;
  @override
  String? get birthDate;
  @override
  String? get createdAt;
  @override
  bool? get isFollowed;
  @override
  bool? get isConfirmed;
  @override
  bool? get isFollowing;
  @override
  bool? get isMuted;
  @override
  bool? get isBlocked;
  @override
  bool? get isBlockingMe;
  @override
  String? get followersCount;
  @override
  String? get followingsCount;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileTweetsResponse _$ProfileTweetsResponseFromJson(
    Map<String, dynamic> json) {
  return _ProfileTweetsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileTweetsResponse {
  List<Tweet> get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileTweetsResponseCopyWith<ProfileTweetsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTweetsResponseCopyWith<$Res> {
  factory $ProfileTweetsResponseCopyWith(ProfileTweetsResponse value,
          $Res Function(ProfileTweetsResponse) then) =
      _$ProfileTweetsResponseCopyWithImpl<$Res, ProfileTweetsResponse>;
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class _$ProfileTweetsResponseCopyWithImpl<$Res,
        $Val extends ProfileTweetsResponse>
    implements $ProfileTweetsResponseCopyWith<$Res> {
  _$ProfileTweetsResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfileTweetsResponseImplCopyWith<$Res>
    implements $ProfileTweetsResponseCopyWith<$Res> {
  factory _$$ProfileTweetsResponseImplCopyWith(
          _$ProfileTweetsResponseImpl value,
          $Res Function(_$ProfileTweetsResponseImpl) then) =
      __$$ProfileTweetsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class __$$ProfileTweetsResponseImplCopyWithImpl<$Res>
    extends _$ProfileTweetsResponseCopyWithImpl<$Res,
        _$ProfileTweetsResponseImpl>
    implements _$$ProfileTweetsResponseImplCopyWith<$Res> {
  __$$ProfileTweetsResponseImplCopyWithImpl(_$ProfileTweetsResponseImpl _value,
      $Res Function(_$ProfileTweetsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_$ProfileTweetsResponseImpl(
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
class _$ProfileTweetsResponseImpl implements _ProfileTweetsResponse {
  const _$ProfileTweetsResponseImpl(
      {final List<Tweet> data = const [], this.total})
      : _data = data;

  factory _$ProfileTweetsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileTweetsResponseImplFromJson(json);

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
    return 'ProfileTweetsResponse(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileTweetsResponseImpl &&
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
  _$$ProfileTweetsResponseImplCopyWith<_$ProfileTweetsResponseImpl>
      get copyWith => __$$ProfileTweetsResponseImplCopyWithImpl<
          _$ProfileTweetsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileTweetsResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfileTweetsResponse implements ProfileTweetsResponse {
  const factory _ProfileTweetsResponse(
      {final List<Tweet> data, final int? total}) = _$ProfileTweetsResponseImpl;

  factory _ProfileTweetsResponse.fromJson(Map<String, dynamic> json) =
      _$ProfileTweetsResponseImpl.fromJson;

  @override
  List<Tweet> get data;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$ProfileTweetsResponseImplCopyWith<_$ProfileTweetsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProfileLikedTweetsResponse _$ProfileLikedTweetsResponseFromJson(
    Map<String, dynamic> json) {
  return _ProfileLikedTweetsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileLikedTweetsResponse {
  List<Tweet> get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileLikedTweetsResponseCopyWith<ProfileLikedTweetsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileLikedTweetsResponseCopyWith<$Res> {
  factory $ProfileLikedTweetsResponseCopyWith(ProfileLikedTweetsResponse value,
          $Res Function(ProfileLikedTweetsResponse) then) =
      _$ProfileLikedTweetsResponseCopyWithImpl<$Res,
          ProfileLikedTweetsResponse>;
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class _$ProfileLikedTweetsResponseCopyWithImpl<$Res,
        $Val extends ProfileLikedTweetsResponse>
    implements $ProfileLikedTweetsResponseCopyWith<$Res> {
  _$ProfileLikedTweetsResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfileLikedTweetsResponseImplCopyWith<$Res>
    implements $ProfileLikedTweetsResponseCopyWith<$Res> {
  factory _$$ProfileLikedTweetsResponseImplCopyWith(
          _$ProfileLikedTweetsResponseImpl value,
          $Res Function(_$ProfileLikedTweetsResponseImpl) then) =
      __$$ProfileLikedTweetsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tweet> data, int? total});
}

/// @nodoc
class __$$ProfileLikedTweetsResponseImplCopyWithImpl<$Res>
    extends _$ProfileLikedTweetsResponseCopyWithImpl<$Res,
        _$ProfileLikedTweetsResponseImpl>
    implements _$$ProfileLikedTweetsResponseImplCopyWith<$Res> {
  __$$ProfileLikedTweetsResponseImplCopyWithImpl(
      _$ProfileLikedTweetsResponseImpl _value,
      $Res Function(_$ProfileLikedTweetsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
  }) {
    return _then(_$ProfileLikedTweetsResponseImpl(
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
class _$ProfileLikedTweetsResponseImpl implements _ProfileLikedTweetsResponse {
  const _$ProfileLikedTweetsResponseImpl(
      {final List<Tweet> data = const [], this.total})
      : _data = data;

  factory _$ProfileLikedTweetsResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProfileLikedTweetsResponseImplFromJson(json);

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
    return 'ProfileLikedTweetsResponse(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLikedTweetsResponseImpl &&
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
  _$$ProfileLikedTweetsResponseImplCopyWith<_$ProfileLikedTweetsResponseImpl>
      get copyWith => __$$ProfileLikedTweetsResponseImplCopyWithImpl<
          _$ProfileLikedTweetsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileLikedTweetsResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfileLikedTweetsResponse
    implements ProfileLikedTweetsResponse {
  const factory _ProfileLikedTweetsResponse(
      {final List<Tweet> data,
      final int? total}) = _$ProfileLikedTweetsResponseImpl;

  factory _ProfileLikedTweetsResponse.fromJson(Map<String, dynamic> json) =
      _$ProfileLikedTweetsResponseImpl.fromJson;

  @override
  List<Tweet> get data;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$ProfileLikedTweetsResponseImplCopyWith<_$ProfileLikedTweetsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FollowerData _$FollowerDataFromJson(Map<String, dynamic> json) {
  return _FollowerData.fromJson(json);
}

/// @nodoc
mixin _$FollowerData {
  String? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;
  bool? get isFollowing => throw _privateConstructorUsedError;
  String? get followersCount => throw _privateConstructorUsedError;
  String? get followingCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowerDataCopyWith<FollowerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowerDataCopyWith<$Res> {
  factory $FollowerDataCopyWith(
          FollowerData value, $Res Function(FollowerData) then) =
      _$FollowerDataCopyWithImpl<$Res, FollowerData>;
  @useResult
  $Res call(
      {String? userId,
      String? username,
      String? name,
      String? bio,
      String? imageUrl,
      bool? isFollowed,
      bool? isFollowing,
      String? followersCount,
      String? followingCount});
}

/// @nodoc
class _$FollowerDataCopyWithImpl<$Res, $Val extends FollowerData>
    implements $FollowerDataCopyWith<$Res> {
  _$FollowerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? bio = freezed,
    Object? imageUrl = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowerDataImplCopyWith<$Res>
    implements $FollowerDataCopyWith<$Res> {
  factory _$$FollowerDataImplCopyWith(
          _$FollowerDataImpl value, $Res Function(_$FollowerDataImpl) then) =
      __$$FollowerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? username,
      String? name,
      String? bio,
      String? imageUrl,
      bool? isFollowed,
      bool? isFollowing,
      String? followersCount,
      String? followingCount});
}

/// @nodoc
class __$$FollowerDataImplCopyWithImpl<$Res>
    extends _$FollowerDataCopyWithImpl<$Res, _$FollowerDataImpl>
    implements _$$FollowerDataImplCopyWith<$Res> {
  __$$FollowerDataImplCopyWithImpl(
      _$FollowerDataImpl _value, $Res Function(_$FollowerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? bio = freezed,
    Object? imageUrl = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_$FollowerDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowerDataImpl implements _FollowerData {
  const _$FollowerDataImpl(
      {this.userId,
      this.username,
      this.name,
      this.bio,
      this.imageUrl,
      this.isFollowed,
      this.isFollowing,
      this.followersCount,
      this.followingCount});

  factory _$FollowerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowerDataImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? bio;
  @override
  final String? imageUrl;
  @override
  final bool? isFollowed;
  @override
  final bool? isFollowing;
  @override
  final String? followersCount;
  @override
  final String? followingCount;

  @override
  String toString() {
    return 'FollowerData(userId: $userId, username: $username, name: $name, bio: $bio, imageUrl: $imageUrl, isFollowed: $isFollowed, isFollowing: $isFollowing, followersCount: $followersCount, followingCount: $followingCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowerDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, username, name, bio,
      imageUrl, isFollowed, isFollowing, followersCount, followingCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowerDataImplCopyWith<_$FollowerDataImpl> get copyWith =>
      __$$FollowerDataImplCopyWithImpl<_$FollowerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowerDataImplToJson(
      this,
    );
  }
}

abstract class _FollowerData implements FollowerData {
  const factory _FollowerData(
      {final String? userId,
      final String? username,
      final String? name,
      final String? bio,
      final String? imageUrl,
      final bool? isFollowed,
      final bool? isFollowing,
      final String? followersCount,
      final String? followingCount}) = _$FollowerDataImpl;

  factory _FollowerData.fromJson(Map<String, dynamic> json) =
      _$FollowerDataImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get username;
  @override
  String? get name;
  @override
  String? get bio;
  @override
  String? get imageUrl;
  @override
  bool? get isFollowed;
  @override
  bool? get isFollowing;
  @override
  String? get followersCount;
  @override
  String? get followingCount;
  @override
  @JsonKey(ignore: true)
  _$$FollowerDataImplCopyWith<_$FollowerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowersList _$FollowersListFromJson(Map<String, dynamic> json) {
  return _FollowersList.fromJson(json);
}

/// @nodoc
mixin _$FollowersList {
  List<FollowerData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowersListCopyWith<FollowersList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersListCopyWith<$Res> {
  factory $FollowersListCopyWith(
          FollowersList value, $Res Function(FollowersList) then) =
      _$FollowersListCopyWithImpl<$Res, FollowersList>;
  @useResult
  $Res call({List<FollowerData>? data});
}

/// @nodoc
class _$FollowersListCopyWithImpl<$Res, $Val extends FollowersList>
    implements $FollowersListCopyWith<$Res> {
  _$FollowersListCopyWithImpl(this._value, this._then);

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
              as List<FollowerData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowersListImplCopyWith<$Res>
    implements $FollowersListCopyWith<$Res> {
  factory _$$FollowersListImplCopyWith(
          _$FollowersListImpl value, $Res Function(_$FollowersListImpl) then) =
      __$$FollowersListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FollowerData>? data});
}

/// @nodoc
class __$$FollowersListImplCopyWithImpl<$Res>
    extends _$FollowersListCopyWithImpl<$Res, _$FollowersListImpl>
    implements _$$FollowersListImplCopyWith<$Res> {
  __$$FollowersListImplCopyWithImpl(
      _$FollowersListImpl _value, $Res Function(_$FollowersListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FollowersListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FollowerData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowersListImpl implements _FollowersList {
  const _$FollowersListImpl({final List<FollowerData>? data}) : _data = data;

  factory _$FollowersListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowersListImplFromJson(json);

  final List<FollowerData>? _data;
  @override
  List<FollowerData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowersList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowersListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowersListImplCopyWith<_$FollowersListImpl> get copyWith =>
      __$$FollowersListImplCopyWithImpl<_$FollowersListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowersListImplToJson(
      this,
    );
  }
}

abstract class _FollowersList implements FollowersList {
  const factory _FollowersList({final List<FollowerData>? data}) =
      _$FollowersListImpl;

  factory _FollowersList.fromJson(Map<String, dynamic> json) =
      _$FollowersListImpl.fromJson;

  @override
  List<FollowerData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FollowersListImplCopyWith<_$FollowersListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingData _$FollowingDataFromJson(Map<String, dynamic> json) {
  return _FollowingData.fromJson(json);
}

/// @nodoc
mixin _$FollowingData {
  String? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;
  bool? get isFollowing => throw _privateConstructorUsedError;
  String? get followersCount => throw _privateConstructorUsedError;
  String? get followingCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingDataCopyWith<FollowingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingDataCopyWith<$Res> {
  factory $FollowingDataCopyWith(
          FollowingData value, $Res Function(FollowingData) then) =
      _$FollowingDataCopyWithImpl<$Res, FollowingData>;
  @useResult
  $Res call(
      {String? userId,
      String? username,
      String? name,
      String? bio,
      String? imageUrl,
      bool? isFollowed,
      bool? isFollowing,
      String? followersCount,
      String? followingCount});
}

/// @nodoc
class _$FollowingDataCopyWithImpl<$Res, $Val extends FollowingData>
    implements $FollowingDataCopyWith<$Res> {
  _$FollowingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? bio = freezed,
    Object? imageUrl = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingDataImplCopyWith<$Res>
    implements $FollowingDataCopyWith<$Res> {
  factory _$$FollowingDataImplCopyWith(
          _$FollowingDataImpl value, $Res Function(_$FollowingDataImpl) then) =
      __$$FollowingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? username,
      String? name,
      String? bio,
      String? imageUrl,
      bool? isFollowed,
      bool? isFollowing,
      String? followersCount,
      String? followingCount});
}

/// @nodoc
class __$$FollowingDataImplCopyWithImpl<$Res>
    extends _$FollowingDataCopyWithImpl<$Res, _$FollowingDataImpl>
    implements _$$FollowingDataImplCopyWith<$Res> {
  __$$FollowingDataImplCopyWithImpl(
      _$FollowingDataImpl _value, $Res Function(_$FollowingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? bio = freezed,
    Object? imageUrl = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
  }) {
    return _then(_$FollowingDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as String?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingDataImpl implements _FollowingData {
  const _$FollowingDataImpl(
      {this.userId,
      this.username,
      this.name,
      this.bio,
      this.imageUrl,
      this.isFollowed,
      this.isFollowing,
      this.followersCount,
      this.followingCount});

  factory _$FollowingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingDataImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? bio;
  @override
  final String? imageUrl;
  @override
  final bool? isFollowed;
  @override
  final bool? isFollowing;
  @override
  final String? followersCount;
  @override
  final String? followingCount;

  @override
  String toString() {
    return 'FollowingData(userId: $userId, username: $username, name: $name, bio: $bio, imageUrl: $imageUrl, isFollowed: $isFollowed, isFollowing: $isFollowing, followersCount: $followersCount, followingCount: $followingCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, username, name, bio,
      imageUrl, isFollowed, isFollowing, followersCount, followingCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingDataImplCopyWith<_$FollowingDataImpl> get copyWith =>
      __$$FollowingDataImplCopyWithImpl<_$FollowingDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingDataImplToJson(
      this,
    );
  }
}

abstract class _FollowingData implements FollowingData {
  const factory _FollowingData(
      {final String? userId,
      final String? username,
      final String? name,
      final String? bio,
      final String? imageUrl,
      final bool? isFollowed,
      final bool? isFollowing,
      final String? followersCount,
      final String? followingCount}) = _$FollowingDataImpl;

  factory _FollowingData.fromJson(Map<String, dynamic> json) =
      _$FollowingDataImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get username;
  @override
  String? get name;
  @override
  String? get bio;
  @override
  String? get imageUrl;
  @override
  bool? get isFollowed;
  @override
  bool? get isFollowing;
  @override
  String? get followersCount;
  @override
  String? get followingCount;
  @override
  @JsonKey(ignore: true)
  _$$FollowingDataImplCopyWith<_$FollowingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowingsList _$FollowingsListFromJson(Map<String, dynamic> json) {
  return _FollowingsList.fromJson(json);
}

/// @nodoc
mixin _$FollowingsList {
  List<FollowingData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingsListCopyWith<FollowingsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingsListCopyWith<$Res> {
  factory $FollowingsListCopyWith(
          FollowingsList value, $Res Function(FollowingsList) then) =
      _$FollowingsListCopyWithImpl<$Res, FollowingsList>;
  @useResult
  $Res call({List<FollowingData>? data});
}

/// @nodoc
class _$FollowingsListCopyWithImpl<$Res, $Val extends FollowingsList>
    implements $FollowingsListCopyWith<$Res> {
  _$FollowingsListCopyWithImpl(this._value, this._then);

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
              as List<FollowingData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingsListImplCopyWith<$Res>
    implements $FollowingsListCopyWith<$Res> {
  factory _$$FollowingsListImplCopyWith(_$FollowingsListImpl value,
          $Res Function(_$FollowingsListImpl) then) =
      __$$FollowingsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FollowingData>? data});
}

/// @nodoc
class __$$FollowingsListImplCopyWithImpl<$Res>
    extends _$FollowingsListCopyWithImpl<$Res, _$FollowingsListImpl>
    implements _$$FollowingsListImplCopyWith<$Res> {
  __$$FollowingsListImplCopyWithImpl(
      _$FollowingsListImpl _value, $Res Function(_$FollowingsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FollowingsListImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FollowingData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingsListImpl implements _FollowingsList {
  const _$FollowingsListImpl({final List<FollowingData>? data}) : _data = data;

  factory _$FollowingsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingsListImplFromJson(json);

  final List<FollowingData>? _data;
  @override
  List<FollowingData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingsList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingsListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingsListImplCopyWith<_$FollowingsListImpl> get copyWith =>
      __$$FollowingsListImplCopyWithImpl<_$FollowingsListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingsListImplToJson(
      this,
    );
  }
}

abstract class _FollowingsList implements FollowingsList {
  const factory _FollowingsList({final List<FollowingData>? data}) =
      _$FollowingsListImpl;

  factory _FollowingsList.fromJson(Map<String, dynamic> json) =
      _$FollowingsListImpl.fromJson;

  @override
  List<FollowingData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$FollowingsListImplCopyWith<_$FollowingsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
