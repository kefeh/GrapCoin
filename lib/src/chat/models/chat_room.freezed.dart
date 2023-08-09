// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  @JsonKey(name: 'muted_members')
  List<String> get mutedMembers => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_pic')
  String get profilePic => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: fromJsonDateTime, toJson: toJsonDateTime, name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_uid')
  String get creatorUID => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_message')
  String get recentMessage => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable,
      name: 'recent_message_time')
  DateTime? get recentMessageTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_message_sender')
  String get recentMessageSender => throw _privateConstructorUsedError;
  String? get activeCallId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {String key,
      String name,
      List<String> members,
      @JsonKey(name: 'muted_members') List<String> mutedMembers,
      @JsonKey(name: 'profile_pic') String profilePic,
      @JsonKey(
          fromJson: fromJsonDateTime,
          toJson: toJsonDateTime,
          name: 'created_at')
      DateTime createdAt,
      @JsonKey(name: 'creator_uid') String creatorUID,
      @JsonKey(name: 'recent_message') String recentMessage,
      @JsonKey(
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable,
          name: 'recent_message_time')
      DateTime? recentMessageTime,
      @JsonKey(name: 'recent_message_sender') String recentMessageSender,
      String? activeCallId});
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? members = null,
    Object? mutedMembers = null,
    Object? profilePic = null,
    Object? createdAt = null,
    Object? creatorUID = null,
    Object? recentMessage = null,
    Object? recentMessageTime = freezed,
    Object? recentMessageSender = null,
    Object? activeCallId = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mutedMembers: null == mutedMembers
          ? _value.mutedMembers
          : mutedMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creatorUID: null == creatorUID
          ? _value.creatorUID
          : creatorUID // ignore: cast_nullable_to_non_nullable
              as String,
      recentMessage: null == recentMessage
          ? _value.recentMessage
          : recentMessage // ignore: cast_nullable_to_non_nullable
              as String,
      recentMessageTime: freezed == recentMessageTime
          ? _value.recentMessageTime
          : recentMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recentMessageSender: null == recentMessageSender
          ? _value.recentMessageSender
          : recentMessageSender // ignore: cast_nullable_to_non_nullable
              as String,
      activeCallId: freezed == activeCallId
          ? _value.activeCallId
          : activeCallId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRoomCopyWith<$Res> implements $ChatRoomCopyWith<$Res> {
  factory _$$_ChatRoomCopyWith(
          _$_ChatRoom value, $Res Function(_$_ChatRoom) then) =
      __$$_ChatRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      List<String> members,
      @JsonKey(name: 'muted_members') List<String> mutedMembers,
      @JsonKey(name: 'profile_pic') String profilePic,
      @JsonKey(
          fromJson: fromJsonDateTime,
          toJson: toJsonDateTime,
          name: 'created_at')
      DateTime createdAt,
      @JsonKey(name: 'creator_uid') String creatorUID,
      @JsonKey(name: 'recent_message') String recentMessage,
      @JsonKey(
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable,
          name: 'recent_message_time')
      DateTime? recentMessageTime,
      @JsonKey(name: 'recent_message_sender') String recentMessageSender,
      String? activeCallId});
}

/// @nodoc
class __$$_ChatRoomCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$_ChatRoom>
    implements _$$_ChatRoomCopyWith<$Res> {
  __$$_ChatRoomCopyWithImpl(
      _$_ChatRoom _value, $Res Function(_$_ChatRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? members = null,
    Object? mutedMembers = null,
    Object? profilePic = null,
    Object? createdAt = null,
    Object? creatorUID = null,
    Object? recentMessage = null,
    Object? recentMessageTime = freezed,
    Object? recentMessageSender = null,
    Object? activeCallId = freezed,
  }) {
    return _then(_$_ChatRoom(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mutedMembers: null == mutedMembers
          ? _value._mutedMembers
          : mutedMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creatorUID: null == creatorUID
          ? _value.creatorUID
          : creatorUID // ignore: cast_nullable_to_non_nullable
              as String,
      recentMessage: null == recentMessage
          ? _value.recentMessage
          : recentMessage // ignore: cast_nullable_to_non_nullable
              as String,
      recentMessageTime: freezed == recentMessageTime
          ? _value.recentMessageTime
          : recentMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recentMessageSender: null == recentMessageSender
          ? _value.recentMessageSender
          : recentMessageSender // ignore: cast_nullable_to_non_nullable
              as String,
      activeCallId: freezed == activeCallId
          ? _value.activeCallId
          : activeCallId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoom extends _ChatRoom {
  const _$_ChatRoom(
      {required this.key,
      required this.name,
      final List<String> members = const [],
      @JsonKey(name: 'muted_members')
      final List<String> mutedMembers = const [],
      @JsonKey(name: 'profile_pic') this.profilePic = '',
      @JsonKey(
          fromJson: fromJsonDateTime,
          toJson: toJsonDateTime,
          name: 'created_at')
      required this.createdAt,
      @JsonKey(name: 'creator_uid') required this.creatorUID,
      @JsonKey(name: 'recent_message') this.recentMessage = '',
      @JsonKey(
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable,
          name: 'recent_message_time')
      this.recentMessageTime,
      @JsonKey(name: 'recent_message_sender') this.recentMessageSender = '',
      this.activeCallId})
      : _members = members,
        _mutedMembers = mutedMembers,
        super._();

  factory _$_ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomFromJson(json);

  @override
  final String key;
  @override
  final String name;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<String> _mutedMembers;
  @override
  @JsonKey(name: 'muted_members')
  List<String> get mutedMembers {
    if (_mutedMembers is EqualUnmodifiableListView) return _mutedMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mutedMembers);
  }

  @override
  @JsonKey(name: 'profile_pic')
  final String profilePic;
  @override
  @JsonKey(
      fromJson: fromJsonDateTime, toJson: toJsonDateTime, name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'creator_uid')
  final String creatorUID;
  @override
  @JsonKey(name: 'recent_message')
  final String recentMessage;
  @override
  @JsonKey(
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable,
      name: 'recent_message_time')
  final DateTime? recentMessageTime;
  @override
  @JsonKey(name: 'recent_message_sender')
  final String recentMessageSender;
  @override
  final String? activeCallId;

  @override
  String toString() {
    return 'ChatRoom(key: $key, name: $name, members: $members, mutedMembers: $mutedMembers, profilePic: $profilePic, createdAt: $createdAt, creatorUID: $creatorUID, recentMessage: $recentMessage, recentMessageTime: $recentMessageTime, recentMessageSender: $recentMessageSender, activeCallId: $activeCallId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoom &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._mutedMembers, _mutedMembers) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.creatorUID, creatorUID) ||
                other.creatorUID == creatorUID) &&
            (identical(other.recentMessage, recentMessage) ||
                other.recentMessage == recentMessage) &&
            (identical(other.recentMessageTime, recentMessageTime) ||
                other.recentMessageTime == recentMessageTime) &&
            (identical(other.recentMessageSender, recentMessageSender) ||
                other.recentMessageSender == recentMessageSender) &&
            (identical(other.activeCallId, activeCallId) ||
                other.activeCallId == activeCallId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_mutedMembers),
      profilePic,
      createdAt,
      creatorUID,
      recentMessage,
      recentMessageTime,
      recentMessageSender,
      activeCallId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      __$$_ChatRoomCopyWithImpl<_$_ChatRoom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomToJson(
      this,
    );
  }
}

abstract class _ChatRoom extends ChatRoom {
  const factory _ChatRoom(
      {required final String key,
      required final String name,
      final List<String> members,
      @JsonKey(name: 'muted_members') final List<String> mutedMembers,
      @JsonKey(name: 'profile_pic') final String profilePic,
      @JsonKey(
          fromJson: fromJsonDateTime,
          toJson: toJsonDateTime,
          name: 'created_at')
      required final DateTime createdAt,
      @JsonKey(name: 'creator_uid') required final String creatorUID,
      @JsonKey(name: 'recent_message') final String recentMessage,
      @JsonKey(
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable,
          name: 'recent_message_time')
      final DateTime? recentMessageTime,
      @JsonKey(name: 'recent_message_sender') final String recentMessageSender,
      final String? activeCallId}) = _$_ChatRoom;
  const _ChatRoom._() : super._();

  factory _ChatRoom.fromJson(Map<String, dynamic> json) = _$_ChatRoom.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  List<String> get members;
  @override
  @JsonKey(name: 'muted_members')
  List<String> get mutedMembers;
  @override
  @JsonKey(name: 'profile_pic')
  String get profilePic;
  @override
  @JsonKey(
      fromJson: fromJsonDateTime, toJson: toJsonDateTime, name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'creator_uid')
  String get creatorUID;
  @override
  @JsonKey(name: 'recent_message')
  String get recentMessage;
  @override
  @JsonKey(
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable,
      name: 'recent_message_time')
  DateTime? get recentMessageTime;
  @override
  @JsonKey(name: 'recent_message_sender')
  String get recentMessageSender;
  @override
  String? get activeCallId;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomCopyWith<_$_ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
