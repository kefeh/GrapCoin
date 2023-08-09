// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_content_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageContentItem {
  File? get contentFile => throw _privateConstructorUsedError;
  MessageEnum get type => throw _privateConstructorUsedError;
  String get contentUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageContentItemCopyWith<MessageContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContentItemCopyWith<$Res> {
  factory $MessageContentItemCopyWith(
          MessageContentItem value, $Res Function(MessageContentItem) then) =
      _$MessageContentItemCopyWithImpl<$Res, MessageContentItem>;
  @useResult
  $Res call({File? contentFile, MessageEnum type, String contentUrl});
}

/// @nodoc
class _$MessageContentItemCopyWithImpl<$Res, $Val extends MessageContentItem>
    implements $MessageContentItemCopyWith<$Res> {
  _$MessageContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentFile = freezed,
    Object? type = null,
    Object? contentUrl = null,
  }) {
    return _then(_value.copyWith(
      contentFile: freezed == contentFile
          ? _value.contentFile
          : contentFile // ignore: cast_nullable_to_non_nullable
              as File?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      contentUrl: null == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageContentItemCopyWith<$Res>
    implements $MessageContentItemCopyWith<$Res> {
  factory _$$_MessageContentItemCopyWith(_$_MessageContentItem value,
          $Res Function(_$_MessageContentItem) then) =
      __$$_MessageContentItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? contentFile, MessageEnum type, String contentUrl});
}

/// @nodoc
class __$$_MessageContentItemCopyWithImpl<$Res>
    extends _$MessageContentItemCopyWithImpl<$Res, _$_MessageContentItem>
    implements _$$_MessageContentItemCopyWith<$Res> {
  __$$_MessageContentItemCopyWithImpl(
      _$_MessageContentItem _value, $Res Function(_$_MessageContentItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentFile = freezed,
    Object? type = null,
    Object? contentUrl = null,
  }) {
    return _then(_$_MessageContentItem(
      contentFile: freezed == contentFile
          ? _value.contentFile
          : contentFile // ignore: cast_nullable_to_non_nullable
              as File?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      contentUrl: null == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MessageContentItem extends _MessageContentItem {
  const _$_MessageContentItem(
      {this.contentFile, required this.type, required this.contentUrl})
      : super._();

  @override
  final File? contentFile;
  @override
  final MessageEnum type;
  @override
  final String contentUrl;

  @override
  String toString() {
    return 'MessageContentItem(contentFile: $contentFile, type: $type, contentUrl: $contentUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageContentItem &&
            (identical(other.contentFile, contentFile) ||
                other.contentFile == contentFile) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.contentUrl, contentUrl) ||
                other.contentUrl == contentUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentFile, type, contentUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageContentItemCopyWith<_$_MessageContentItem> get copyWith =>
      __$$_MessageContentItemCopyWithImpl<_$_MessageContentItem>(
          this, _$identity);
}

abstract class _MessageContentItem extends MessageContentItem {
  const factory _MessageContentItem(
      {final File? contentFile,
      required final MessageEnum type,
      required final String contentUrl}) = _$_MessageContentItem;
  const _MessageContentItem._() : super._();

  @override
  File? get contentFile;
  @override
  MessageEnum get type;
  @override
  String get contentUrl;
  @override
  @JsonKey(ignore: true)
  _$$_MessageContentItemCopyWith<_$_MessageContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}
