// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordResetState {
  Password get currentPassword => throw _privateConstructorUsedError;
  Password get newPassword => throw _privateConstructorUsedError;
  Password get confirmNewPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordResetStateCopyWith<PasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetStateCopyWith(
          PasswordResetState value, $Res Function(PasswordResetState) then) =
      _$PasswordResetStateCopyWithImpl<$Res, PasswordResetState>;
  @useResult
  $Res call(
      {Password currentPassword,
      Password newPassword,
      Password confirmNewPassword});
}

/// @nodoc
class _$PasswordResetStateCopyWithImpl<$Res, $Val extends PasswordResetState>
    implements $PasswordResetStateCopyWith<$Res> {
  _$PasswordResetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(_value.copyWith(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmNewPassword: null == confirmNewPassword
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as Password,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordResetStateCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory _$$_PasswordResetStateCopyWith(_$_PasswordResetState value,
          $Res Function(_$_PasswordResetState) then) =
      __$$_PasswordResetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Password currentPassword,
      Password newPassword,
      Password confirmNewPassword});
}

/// @nodoc
class __$$_PasswordResetStateCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res, _$_PasswordResetState>
    implements _$$_PasswordResetStateCopyWith<$Res> {
  __$$_PasswordResetStateCopyWithImpl(
      _$_PasswordResetState _value, $Res Function(_$_PasswordResetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(_$_PasswordResetState(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmNewPassword: null == confirmNewPassword
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$_PasswordResetState implements _PasswordResetState {
  _$_PasswordResetState(
      {required this.currentPassword,
      required this.newPassword,
      required this.confirmNewPassword});

  @override
  final Password currentPassword;
  @override
  final Password newPassword;
  @override
  final Password confirmNewPassword;

  @override
  String toString() {
    return 'PasswordResetState(currentPassword: $currentPassword, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordResetState &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmNewPassword, confirmNewPassword) ||
                other.confirmNewPassword == confirmNewPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentPassword, newPassword, confirmNewPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordResetStateCopyWith<_$_PasswordResetState> get copyWith =>
      __$$_PasswordResetStateCopyWithImpl<_$_PasswordResetState>(
          this, _$identity);
}

abstract class _PasswordResetState implements PasswordResetState {
  factory _PasswordResetState(
      {required final Password currentPassword,
      required final Password newPassword,
      required final Password confirmNewPassword}) = _$_PasswordResetState;

  @override
  Password get currentPassword;
  @override
  Password get newPassword;
  @override
  Password get confirmNewPassword;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordResetStateCopyWith<_$_PasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}
