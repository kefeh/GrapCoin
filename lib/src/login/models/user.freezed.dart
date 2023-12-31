// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get userNameSensitiveCase => throw _privateConstructorUsedError;
  @JsonKey(toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
  DateTime? get registeredAt => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String? userNameSensitiveCase,
      @JsonKey(
          toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
      DateTime? registeredAt,
      String? email,
      String? pin});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? userNameSensitiveCase = freezed,
    Object? registeredAt = freezed,
    Object? email = freezed,
    Object? pin = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userNameSensitiveCase: freezed == userNameSensitiveCase
          ? _value.userNameSensitiveCase
          : userNameSensitiveCase // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredAt: freezed == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String? userNameSensitiveCase,
      @JsonKey(
          toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
      DateTime? registeredAt,
      String? email,
      String? pin});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? userNameSensitiveCase = freezed,
    Object? registeredAt = freezed,
    Object? email = freezed,
    Object? pin = freezed,
  }) {
    return _then(_$_User(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userNameSensitiveCase: freezed == userNameSensitiveCase
          ? _value.userNameSensitiveCase
          : userNameSensitiveCase // ignore: cast_nullable_to_non_nullable
              as String?,
      registeredAt: freezed == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.uid,
      required this.name,
      this.userNameSensitiveCase,
      @JsonKey(
          toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
      required this.registeredAt,
      this.email,
      this.pin})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String? userNameSensitiveCase;
  @override
  @JsonKey(toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
  final DateTime? registeredAt;
  @override
  final String? email;
  @override
  final String? pin;

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, userNameSensitiveCase: $userNameSensitiveCase, registeredAt: $registeredAt, email: $email, pin: $pin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userNameSensitiveCase, userNameSensitiveCase) ||
                other.userNameSensitiveCase == userNameSensitiveCase) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, userNameSensitiveCase, registeredAt, email, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {required final String uid,
      required final String name,
      final String? userNameSensitiveCase,
      @JsonKey(
          toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
      required final DateTime? registeredAt,
      final String? email,
      final String? pin}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String? get userNameSensitiveCase;
  @override
  @JsonKey(toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
  DateTime? get registeredAt;
  @override
  String? get email;
  @override
  String? get pin;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
