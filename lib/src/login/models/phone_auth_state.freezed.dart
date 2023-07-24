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
  String get nameCountry => throw _privateConstructorUsedError;
  String get codeCountry => throw _privateConstructorUsedError;
  String get currentPhoneNumber => throw _privateConstructorUsedError;
  String get oldPhoneNumber => throw _privateConstructorUsedError;
  bool get onOtpScreen => throw _privateConstructorUsedError;

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
  $Res call(
      {String nameCountry,
      String codeCountry,
      String currentPhoneNumber,
      String oldPhoneNumber,
      bool onOtpScreen});
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
    Object? nameCountry = null,
    Object? codeCountry = null,
    Object? currentPhoneNumber = null,
    Object? oldPhoneNumber = null,
    Object? onOtpScreen = null,
  }) {
    return _then(_value.copyWith(
      nameCountry: null == nameCountry
          ? _value.nameCountry
          : nameCountry // ignore: cast_nullable_to_non_nullable
              as String,
      codeCountry: null == codeCountry
          ? _value.codeCountry
          : codeCountry // ignore: cast_nullable_to_non_nullable
              as String,
      currentPhoneNumber: null == currentPhoneNumber
          ? _value.currentPhoneNumber
          : currentPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      oldPhoneNumber: null == oldPhoneNumber
          ? _value.oldPhoneNumber
          : oldPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      onOtpScreen: null == onOtpScreen
          ? _value.onOtpScreen
          : onOtpScreen // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {String nameCountry,
      String codeCountry,
      String currentPhoneNumber,
      String oldPhoneNumber,
      bool onOtpScreen});
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
    Object? nameCountry = null,
    Object? codeCountry = null,
    Object? currentPhoneNumber = null,
    Object? oldPhoneNumber = null,
    Object? onOtpScreen = null,
  }) {
    return _then(_$_PhoneAuthState(
      nameCountry: null == nameCountry
          ? _value.nameCountry
          : nameCountry // ignore: cast_nullable_to_non_nullable
              as String,
      codeCountry: null == codeCountry
          ? _value.codeCountry
          : codeCountry // ignore: cast_nullable_to_non_nullable
              as String,
      currentPhoneNumber: null == currentPhoneNumber
          ? _value.currentPhoneNumber
          : currentPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      oldPhoneNumber: null == oldPhoneNumber
          ? _value.oldPhoneNumber
          : oldPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      onOtpScreen: null == onOtpScreen
          ? _value.onOtpScreen
          : onOtpScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PhoneAuthState implements _PhoneAuthState {
  _$_PhoneAuthState(
      {required this.nameCountry,
      required this.codeCountry,
      required this.currentPhoneNumber,
      required this.oldPhoneNumber,
      required this.onOtpScreen});

  @override
  final String nameCountry;
  @override
  final String codeCountry;
  @override
  final String currentPhoneNumber;
  @override
  final String oldPhoneNumber;
  @override
  final bool onOtpScreen;

  @override
  String toString() {
    return 'PhoneAuthState(nameCountry: $nameCountry, codeCountry: $codeCountry, currentPhoneNumber: $currentPhoneNumber, oldPhoneNumber: $oldPhoneNumber, onOtpScreen: $onOtpScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhoneAuthState &&
            (identical(other.nameCountry, nameCountry) ||
                other.nameCountry == nameCountry) &&
            (identical(other.codeCountry, codeCountry) ||
                other.codeCountry == codeCountry) &&
            (identical(other.currentPhoneNumber, currentPhoneNumber) ||
                other.currentPhoneNumber == currentPhoneNumber) &&
            (identical(other.oldPhoneNumber, oldPhoneNumber) ||
                other.oldPhoneNumber == oldPhoneNumber) &&
            (identical(other.onOtpScreen, onOtpScreen) ||
                other.onOtpScreen == onOtpScreen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nameCountry, codeCountry,
      currentPhoneNumber, oldPhoneNumber, onOtpScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneAuthStateCopyWith<_$_PhoneAuthState> get copyWith =>
      __$$_PhoneAuthStateCopyWithImpl<_$_PhoneAuthState>(this, _$identity);
}

abstract class _PhoneAuthState implements PhoneAuthState {
  factory _PhoneAuthState(
      {required final String nameCountry,
      required final String codeCountry,
      required final String currentPhoneNumber,
      required final String oldPhoneNumber,
      required final bool onOtpScreen}) = _$_PhoneAuthState;

  @override
  String get nameCountry;
  @override
  String get codeCountry;
  @override
  String get currentPhoneNumber;
  @override
  String get oldPhoneNumber;
  @override
  bool get onOtpScreen;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneAuthStateCopyWith<_$_PhoneAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
