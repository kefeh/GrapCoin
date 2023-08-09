// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_chat_room_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddChatRoomState {
  PlatformFile? get profileImage => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Either<FirebaseFailure, Unit>? get failureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddChatRoomStateCopyWith<AddChatRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddChatRoomStateCopyWith<$Res> {
  factory $AddChatRoomStateCopyWith(
          AddChatRoomState value, $Res Function(AddChatRoomState) then) =
      _$AddChatRoomStateCopyWithImpl<$Res, AddChatRoomState>;
  @useResult
  $Res call(
      {PlatformFile? profileImage,
      String name,
      bool isLoading,
      Either<FirebaseFailure, Unit>? failureOrSuccess});
}

/// @nodoc
class _$AddChatRoomStateCopyWithImpl<$Res, $Val extends AddChatRoomState>
    implements $AddChatRoomStateCopyWith<$Res> {
  _$AddChatRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImage = freezed,
    Object? name = null,
    Object? isLoading = null,
    Object? failureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: freezed == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<FirebaseFailure, Unit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddChatRoomStateCopyWith<$Res>
    implements $AddChatRoomStateCopyWith<$Res> {
  factory _$$_AddChatRoomStateCopyWith(
          _$_AddChatRoomState value, $Res Function(_$_AddChatRoomState) then) =
      __$$_AddChatRoomStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlatformFile? profileImage,
      String name,
      bool isLoading,
      Either<FirebaseFailure, Unit>? failureOrSuccess});
}

/// @nodoc
class __$$_AddChatRoomStateCopyWithImpl<$Res>
    extends _$AddChatRoomStateCopyWithImpl<$Res, _$_AddChatRoomState>
    implements _$$_AddChatRoomStateCopyWith<$Res> {
  __$$_AddChatRoomStateCopyWithImpl(
      _$_AddChatRoomState _value, $Res Function(_$_AddChatRoomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImage = freezed,
    Object? name = null,
    Object? isLoading = null,
    Object? failureOrSuccess = freezed,
  }) {
    return _then(_$_AddChatRoomState(
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as PlatformFile?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccess: freezed == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<FirebaseFailure, Unit>?,
    ));
  }
}

/// @nodoc

class _$_AddChatRoomState extends _AddChatRoomState {
  const _$_AddChatRoomState(
      {required this.profileImage,
      required this.name,
      required this.isLoading,
      this.failureOrSuccess})
      : super._();

  @override
  final PlatformFile? profileImage;
  @override
  final String name;
  @override
  final bool isLoading;
  @override
  final Either<FirebaseFailure, Unit>? failureOrSuccess;

  @override
  String toString() {
    return 'AddChatRoomState(profileImage: $profileImage, name: $name, isLoading: $isLoading, failureOrSuccess: $failureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddChatRoomState &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileImage, name, isLoading, failureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddChatRoomStateCopyWith<_$_AddChatRoomState> get copyWith =>
      __$$_AddChatRoomStateCopyWithImpl<_$_AddChatRoomState>(this, _$identity);
}

abstract class _AddChatRoomState extends AddChatRoomState {
  const factory _AddChatRoomState(
          {required final PlatformFile? profileImage,
          required final String name,
          required final bool isLoading,
          final Either<FirebaseFailure, Unit>? failureOrSuccess}) =
      _$_AddChatRoomState;
  const _AddChatRoomState._() : super._();

  @override
  PlatformFile? get profileImage;
  @override
  String get name;
  @override
  bool get isLoading;
  @override
  Either<FirebaseFailure, Unit>? get failureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_AddChatRoomStateCopyWith<_$_AddChatRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}
