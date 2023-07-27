// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneAuthState {
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneAuthStateCopyWith<PhoneAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneAuthStateCopyWith<$Res> {
  factory $PhoneAuthStateCopyWith(
          PhoneAuthState value, $Res Function(PhoneAuthState) then) =
      _$PhoneAuthStateCopyWithImpl<$Res, PhoneAuthState>;
  @useResult
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class _$PhoneAuthStateCopyWithImpl<$Res, $Val extends PhoneAuthState>
    implements $PhoneAuthStateCopyWith<$Res> {
  _$PhoneAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhoneAuthStateCopyWith<$Res>
    implements $PhoneAuthStateCopyWith<$Res> {
  factory _$$_PhoneAuthStateCopyWith(
          _$_PhoneAuthState value, $Res Function(_$_PhoneAuthState) then) =
      __$$_PhoneAuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class __$$_PhoneAuthStateCopyWithImpl<$Res>
    extends _$PhoneAuthStateCopyWithImpl<$Res, _$_PhoneAuthState>
    implements _$$_PhoneAuthStateCopyWith<$Res> {
  __$$_PhoneAuthStateCopyWithImpl(
      _$_PhoneAuthState _value, $Res Function(_$_PhoneAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_PhoneAuthState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$_PhoneAuthState implements _PhoneAuthState {
  _$_PhoneAuthState({required this.email, required this.password});

  @override
  final EmailAddress email;
  @override
  final Password password;

  @override
  String toString() {
    return 'PhoneAuthState(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneAuthState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneAuthStateCopyWith<_$_PhoneAuthState> get copyWith =>
      __$$_PhoneAuthStateCopyWithImpl<_$_PhoneAuthState>(this, _$identity);
}

abstract class _PhoneAuthState implements PhoneAuthState {
  factory _PhoneAuthState(
      {required final EmailAddress email,
      required final Password password}) = _$_PhoneAuthState;

  @override
  EmailAddress get email;
  @override
  Password get password;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneAuthStateCopyWith<_$_PhoneAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
