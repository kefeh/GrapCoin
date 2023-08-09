// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnreadMessageModel {
  int get userLastSeenMessageTime => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  int get lastMessageTime => throw _privateConstructorUsedError;
  int get unreadMessageCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnreadMessageModelCopyWith<UnreadMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadMessageModelCopyWith<$Res> {
  factory $UnreadMessageModelCopyWith(
          UnreadMessageModel value, $Res Function(UnreadMessageModel) then) =
      _$UnreadMessageModelCopyWithImpl<$Res, UnreadMessageModel>;
  @useResult
  $Res call(
      {int userLastSeenMessageTime,
      bool read,
      int lastMessageTime,
      int unreadMessageCount});
}

/// @nodoc
class _$UnreadMessageModelCopyWithImpl<$Res, $Val extends UnreadMessageModel>
    implements $UnreadMessageModelCopyWith<$Res> {
  _$UnreadMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLastSeenMessageTime = null,
    Object? read = null,
    Object? lastMessageTime = null,
    Object? unreadMessageCount = null,
  }) {
    return _then(_value.copyWith(
      userLastSeenMessageTime: null == userLastSeenMessageTime
          ? _value.userLastSeenMessageTime
          : userLastSeenMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessageTime: null == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnreadMessageModelCopyWith<$Res>
    implements $UnreadMessageModelCopyWith<$Res> {
  factory _$$_UnreadMessageModelCopyWith(_$_UnreadMessageModel value,
          $Res Function(_$_UnreadMessageModel) then) =
      __$$_UnreadMessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userLastSeenMessageTime,
      bool read,
      int lastMessageTime,
      int unreadMessageCount});
}

/// @nodoc
class __$$_UnreadMessageModelCopyWithImpl<$Res>
    extends _$UnreadMessageModelCopyWithImpl<$Res, _$_UnreadMessageModel>
    implements _$$_UnreadMessageModelCopyWith<$Res> {
  __$$_UnreadMessageModelCopyWithImpl(
      _$_UnreadMessageModel _value, $Res Function(_$_UnreadMessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userLastSeenMessageTime = null,
    Object? read = null,
    Object? lastMessageTime = null,
    Object? unreadMessageCount = null,
  }) {
    return _then(_$_UnreadMessageModel(
      userLastSeenMessageTime: null == userLastSeenMessageTime
          ? _value.userLastSeenMessageTime
          : userLastSeenMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      lastMessageTime: null == lastMessageTime
          ? _value.lastMessageTime
          : lastMessageTime // ignore: cast_nullable_to_non_nullable
              as int,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UnreadMessageModel implements _UnreadMessageModel {
  _$_UnreadMessageModel(
      {required this.userLastSeenMessageTime,
      required this.read,
      required this.lastMessageTime,
      required this.unreadMessageCount});

  @override
  final int userLastSeenMessageTime;
  @override
  final bool read;
  @override
  final int lastMessageTime;
  @override
  final int unreadMessageCount;

  @override
  String toString() {
    return 'UnreadMessageModel(userLastSeenMessageTime: $userLastSeenMessageTime, read: $read, lastMessageTime: $lastMessageTime, unreadMessageCount: $unreadMessageCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnreadMessageModel &&
            (identical(
                    other.userLastSeenMessageTime, userLastSeenMessageTime) ||
                other.userLastSeenMessageTime == userLastSeenMessageTime) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.lastMessageTime, lastMessageTime) ||
                other.lastMessageTime == lastMessageTime) &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                other.unreadMessageCount == unreadMessageCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLastSeenMessageTime, read,
      lastMessageTime, unreadMessageCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnreadMessageModelCopyWith<_$_UnreadMessageModel> get copyWith =>
      __$$_UnreadMessageModelCopyWithImpl<_$_UnreadMessageModel>(
          this, _$identity);
}

abstract class _UnreadMessageModel implements UnreadMessageModel {
  factory _UnreadMessageModel(
      {required final int userLastSeenMessageTime,
      required final bool read,
      required final int lastMessageTime,
      required final int unreadMessageCount}) = _$_UnreadMessageModel;

  @override
  int get userLastSeenMessageTime;
  @override
  bool get read;
  @override
  int get lastMessageTime;
  @override
  int get unreadMessageCount;
  @override
  @JsonKey(ignore: true)
  _$$_UnreadMessageModelCopyWith<_$_UnreadMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
