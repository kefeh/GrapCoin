// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get key => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_url')
  String get contentUrl => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_name')
  String? get senderName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime)
  DateTime get at => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'pinned_at',
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable)
  DateTime? get pinnedAt => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  MessageEnum get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String key,
      String content,
      @JsonKey(name: 'content_url') String contentUrl,
      String from,
      @JsonKey(name: 'sender_name') String? senderName,
      @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime) DateTime at,
      @JsonKey(
          name: 'pinned_at',
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable)
      DateTime? pinnedAt,
      bool pinned,
      MessageEnum type});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? content = null,
    Object? contentUrl = null,
    Object? from = null,
    Object? senderName = freezed,
    Object? at = null,
    Object? pinnedAt = freezed,
    Object? pinned = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentUrl: null == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pinnedAt: freezed == pinnedAt
          ? _value.pinnedAt
          : pinnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String content,
      @JsonKey(name: 'content_url') String contentUrl,
      String from,
      @JsonKey(name: 'sender_name') String? senderName,
      @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime) DateTime at,
      @JsonKey(
          name: 'pinned_at',
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable)
      DateTime? pinnedAt,
      bool pinned,
      MessageEnum type});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? content = null,
    Object? contentUrl = null,
    Object? from = null,
    Object? senderName = freezed,
    Object? at = null,
    Object? pinnedAt = freezed,
    Object? pinned = null,
    Object? type = null,
  }) {
    return _then(_$_Message(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      contentUrl: null == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pinnedAt: freezed == pinnedAt
          ? _value.pinnedAt
          : pinnedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message extends _Message {
  const _$_Message(
      {this.key = '',
      required this.content,
      @JsonKey(name: 'content_url') this.contentUrl = '',
      required this.from,
      @JsonKey(name: 'sender_name') required this.senderName,
      @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime)
      required this.at,
      @JsonKey(
          name: 'pinned_at',
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable)
      this.pinnedAt,
      required this.pinned,
      this.type = MessageEnum.text})
      : super._();

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  final String content;
  @override
  @JsonKey(name: 'content_url')
  final String contentUrl;
  @override
  final String from;
  @override
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @override
  @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime)
  final DateTime at;
  @override
  @JsonKey(
      name: 'pinned_at',
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable)
  final DateTime? pinnedAt;
  @override
  final bool pinned;
  @override
  @JsonKey()
  final MessageEnum type;

  @override
  String toString() {
    return 'Message(key: $key, content: $content, contentUrl: $contentUrl, from: $from, senderName: $senderName, at: $at, pinnedAt: $pinnedAt, pinned: $pinned, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentUrl, contentUrl) ||
                other.contentUrl == contentUrl) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.pinnedAt, pinnedAt) ||
                other.pinnedAt == pinnedAt) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, content, contentUrl, from,
      senderName, at, pinnedAt, pinned, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {final String key,
      required final String content,
      @JsonKey(name: 'content_url') final String contentUrl,
      required final String from,
      @JsonKey(name: 'sender_name') required final String? senderName,
      @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime)
      required final DateTime at,
      @JsonKey(
          name: 'pinned_at',
          fromJson: fromJsonDateTimeNullable,
          toJson: toJsonDateTimeNullable)
      final DateTime? pinnedAt,
      required final bool pinned,
      final MessageEnum type}) = _$_Message;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get key;
  @override
  String get content;
  @override
  @JsonKey(name: 'content_url')
  String get contentUrl;
  @override
  String get from;
  @override
  @JsonKey(name: 'sender_name')
  String? get senderName;
  @override
  @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime)
  DateTime get at;
  @override
  @JsonKey(
      name: 'pinned_at',
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable)
  DateTime? get pinnedAt;
  @override
  bool get pinned;
  @override
  MessageEnum get type;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
