// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) {
  return _NotificationData.fromJson(json);
}

/// @nodoc
mixin _$NotificationData {
  String get notificationId => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  bool get isSeen => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get senderImgUrl => throw _privateConstructorUsedError;
  String get senderUsername => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call(
      {String notificationId,
      String timestamp,
      bool isSeen,
      String type,
      String content,
      String senderImgUrl,
      String senderUsername});
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? timestamp = null,
    Object? isSeen = null,
    Object? type = null,
    Object? content = null,
    Object? senderImgUrl = null,
    Object? senderUsername = null,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      senderImgUrl: null == senderImgUrl
          ? _value.senderImgUrl
          : senderImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      senderUsername: null == senderUsername
          ? _value.senderUsername
          : senderUsername // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDataImplCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$NotificationDataImplCopyWith(_$NotificationDataImpl value,
          $Res Function(_$NotificationDataImpl) then) =
      __$$NotificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationId,
      String timestamp,
      bool isSeen,
      String type,
      String content,
      String senderImgUrl,
      String senderUsername});
}

/// @nodoc
class __$$NotificationDataImplCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$NotificationDataImpl>
    implements _$$NotificationDataImplCopyWith<$Res> {
  __$$NotificationDataImplCopyWithImpl(_$NotificationDataImpl _value,
      $Res Function(_$NotificationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? timestamp = null,
    Object? isSeen = null,
    Object? type = null,
    Object? content = null,
    Object? senderImgUrl = null,
    Object? senderUsername = null,
  }) {
    return _then(_$NotificationDataImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      senderImgUrl: null == senderImgUrl
          ? _value.senderImgUrl
          : senderImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      senderUsername: null == senderUsername
          ? _value.senderUsername
          : senderUsername // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataImpl implements _NotificationData {
  const _$NotificationDataImpl(
      {this.notificationId = "",
      this.timestamp = "",
      this.isSeen = false,
      this.type = "",
      this.content = "",
      this.senderImgUrl = "",
      this.senderUsername = ""});

  factory _$NotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataImplFromJson(json);

  @override
  @JsonKey()
  final String notificationId;
  @override
  @JsonKey()
  final String timestamp;
  @override
  @JsonKey()
  final bool isSeen;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String senderImgUrl;
  @override
  @JsonKey()
  final String senderUsername;

  @override
  String toString() {
    return 'NotificationData(notificationId: $notificationId, timestamp: $timestamp, isSeen: $isSeen, type: $type, content: $content, senderImgUrl: $senderImgUrl, senderUsername: $senderUsername)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.senderImgUrl, senderImgUrl) ||
                other.senderImgUrl == senderImgUrl) &&
            (identical(other.senderUsername, senderUsername) ||
                other.senderUsername == senderUsername));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, timestamp,
      isSeen, type, content, senderImgUrl, senderUsername);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      __$$NotificationDataImplCopyWithImpl<_$NotificationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationData implements NotificationData {
  const factory _NotificationData(
      {final String notificationId,
      final String timestamp,
      final bool isSeen,
      final String type,
      final String content,
      final String senderImgUrl,
      final String senderUsername}) = _$NotificationDataImpl;

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$NotificationDataImpl.fromJson;

  @override
  String get notificationId;
  @override
  String get timestamp;
  @override
  bool get isSeen;
  @override
  String get type;
  @override
  String get content;
  @override
  String get senderImgUrl;
  @override
  String get senderUsername;
  @override
  @JsonKey(ignore: true)
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationsList _$NotificationsListFromJson(Map<String, dynamic> json) {
  return _NotificationsList.fromJson(json);
}

/// @nodoc
mixin _$NotificationsList {
  List<NotificationData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsListCopyWith<NotificationsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsListCopyWith<$Res> {
  factory $NotificationsListCopyWith(
          NotificationsList value, $Res Function(NotificationsList) then) =
      _$NotificationsListCopyWithImpl<$Res, NotificationsList>;
  @useResult
  $Res call({List<NotificationData> data});
}

/// @nodoc
class _$NotificationsListCopyWithImpl<$Res, $Val extends NotificationsList>
    implements $NotificationsListCopyWith<$Res> {
  _$NotificationsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsListImplCopyWith<$Res>
    implements $NotificationsListCopyWith<$Res> {
  factory _$$NotificationsListImplCopyWith(_$NotificationsListImpl value,
          $Res Function(_$NotificationsListImpl) then) =
      __$$NotificationsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotificationData> data});
}

/// @nodoc
class __$$NotificationsListImplCopyWithImpl<$Res>
    extends _$NotificationsListCopyWithImpl<$Res, _$NotificationsListImpl>
    implements _$$NotificationsListImplCopyWith<$Res> {
  __$$NotificationsListImplCopyWithImpl(_$NotificationsListImpl _value,
      $Res Function(_$NotificationsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$NotificationsListImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsListImpl implements _NotificationsList {
  const _$NotificationsListImpl({final List<NotificationData> data = const []})
      : _data = data;

  factory _$NotificationsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsListImplFromJson(json);

  final List<NotificationData> _data;
  @override
  @JsonKey()
  List<NotificationData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NotificationsList(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsListImplCopyWith<_$NotificationsListImpl> get copyWith =>
      __$$NotificationsListImplCopyWithImpl<_$NotificationsListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsListImplToJson(
      this,
    );
  }
}

abstract class _NotificationsList implements NotificationsList {
  const factory _NotificationsList({final List<NotificationData> data}) =
      _$NotificationsListImpl;

  factory _NotificationsList.fromJson(Map<String, dynamic> json) =
      _$NotificationsListImpl.fromJson;

  @override
  List<NotificationData> get data;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsListImplCopyWith<_$NotificationsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
