// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnected,
    required TResult Function() loading,
    required TResult Function() connected,
    required TResult Function(AuthError error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnected,
    TResult? Function()? loading,
    TResult? Function()? connected,
    TResult? Function(AuthError error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnected,
    TResult Function()? loading,
    TResult Function()? connected,
    TResult Function(AuthError error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateDisconnected value)
        disconnected,
    required TResult Function(_AuthenticationStateLoading value) loading,
    required TResult Function(_AuthenticationStateConnected value) connected,
    required TResult Function(_AuthenticationStateFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult? Function(_AuthenticationStateLoading value)? loading,
    TResult? Function(_AuthenticationStateConnected value)? connected,
    TResult? Function(_AuthenticationStateFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult Function(_AuthenticationStateLoading value)? loading,
    TResult Function(_AuthenticationStateConnected value)? connected,
    TResult Function(_AuthenticationStateFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthenticationStateDisconnectedCopyWith<$Res> {
  factory _$$_AuthenticationStateDisconnectedCopyWith(
          _$_AuthenticationStateDisconnected value,
          $Res Function(_$_AuthenticationStateDisconnected) then) =
      __$$_AuthenticationStateDisconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticationStateDisconnectedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$_AuthenticationStateDisconnected>
    implements _$$_AuthenticationStateDisconnectedCopyWith<$Res> {
  __$$_AuthenticationStateDisconnectedCopyWithImpl(
      _$_AuthenticationStateDisconnected _value,
      $Res Function(_$_AuthenticationStateDisconnected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthenticationStateDisconnected
    implements _AuthenticationStateDisconnected {
  _$_AuthenticationStateDisconnected();

  @override
  String toString() {
    return 'AuthenticationState.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationStateDisconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnected,
    required TResult Function() loading,
    required TResult Function() connected,
    required TResult Function(AuthError error) failed,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnected,
    TResult? Function()? loading,
    TResult? Function()? connected,
    TResult? Function(AuthError error)? failed,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnected,
    TResult Function()? loading,
    TResult Function()? connected,
    TResult Function(AuthError error)? failed,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateDisconnected value)
        disconnected,
    required TResult Function(_AuthenticationStateLoading value) loading,
    required TResult Function(_AuthenticationStateConnected value) connected,
    required TResult Function(_AuthenticationStateFailed value) failed,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult? Function(_AuthenticationStateLoading value)? loading,
    TResult? Function(_AuthenticationStateConnected value)? connected,
    TResult? Function(_AuthenticationStateFailed value)? failed,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult Function(_AuthenticationStateLoading value)? loading,
    TResult Function(_AuthenticationStateConnected value)? connected,
    TResult Function(_AuthenticationStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationStateDisconnected implements AuthenticationState {
  factory _AuthenticationStateDisconnected() =
      _$_AuthenticationStateDisconnected;
}

/// @nodoc
abstract class _$$_AuthenticationStateLoadingCopyWith<$Res> {
  factory _$$_AuthenticationStateLoadingCopyWith(
          _$_AuthenticationStateLoading value,
          $Res Function(_$_AuthenticationStateLoading) then) =
      __$$_AuthenticationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticationStateLoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$_AuthenticationStateLoading>
    implements _$$_AuthenticationStateLoadingCopyWith<$Res> {
  __$$_AuthenticationStateLoadingCopyWithImpl(
      _$_AuthenticationStateLoading _value,
      $Res Function(_$_AuthenticationStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthenticationStateLoading implements _AuthenticationStateLoading {
  _$_AuthenticationStateLoading();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnected,
    required TResult Function() loading,
    required TResult Function() connected,
    required TResult Function(AuthError error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnected,
    TResult? Function()? loading,
    TResult? Function()? connected,
    TResult? Function(AuthError error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnected,
    TResult Function()? loading,
    TResult Function()? connected,
    TResult Function(AuthError error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateDisconnected value)
        disconnected,
    required TResult Function(_AuthenticationStateLoading value) loading,
    required TResult Function(_AuthenticationStateConnected value) connected,
    required TResult Function(_AuthenticationStateFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult? Function(_AuthenticationStateLoading value)? loading,
    TResult? Function(_AuthenticationStateConnected value)? connected,
    TResult? Function(_AuthenticationStateFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult Function(_AuthenticationStateLoading value)? loading,
    TResult Function(_AuthenticationStateConnected value)? connected,
    TResult Function(_AuthenticationStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationStateLoading implements AuthenticationState {
  factory _AuthenticationStateLoading() = _$_AuthenticationStateLoading;
}

/// @nodoc
abstract class _$$_AuthenticationStateConnectedCopyWith<$Res> {
  factory _$$_AuthenticationStateConnectedCopyWith(
          _$_AuthenticationStateConnected value,
          $Res Function(_$_AuthenticationStateConnected) then) =
      __$$_AuthenticationStateConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthenticationStateConnectedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$_AuthenticationStateConnected>
    implements _$$_AuthenticationStateConnectedCopyWith<$Res> {
  __$$_AuthenticationStateConnectedCopyWithImpl(
      _$_AuthenticationStateConnected _value,
      $Res Function(_$_AuthenticationStateConnected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthenticationStateConnected implements _AuthenticationStateConnected {
  _$_AuthenticationStateConnected();

  @override
  String toString() {
    return 'AuthenticationState.connected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationStateConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnected,
    required TResult Function() loading,
    required TResult Function() connected,
    required TResult Function(AuthError error) failed,
  }) {
    return connected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnected,
    TResult? Function()? loading,
    TResult? Function()? connected,
    TResult? Function(AuthError error)? failed,
  }) {
    return connected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnected,
    TResult Function()? loading,
    TResult Function()? connected,
    TResult Function(AuthError error)? failed,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateDisconnected value)
        disconnected,
    required TResult Function(_AuthenticationStateLoading value) loading,
    required TResult Function(_AuthenticationStateConnected value) connected,
    required TResult Function(_AuthenticationStateFailed value) failed,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult? Function(_AuthenticationStateLoading value)? loading,
    TResult? Function(_AuthenticationStateConnected value)? connected,
    TResult? Function(_AuthenticationStateFailed value)? failed,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult Function(_AuthenticationStateLoading value)? loading,
    TResult Function(_AuthenticationStateConnected value)? connected,
    TResult Function(_AuthenticationStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationStateConnected implements AuthenticationState {
  factory _AuthenticationStateConnected() = _$_AuthenticationStateConnected;
}

/// @nodoc
abstract class _$$_AuthenticationStateFailedCopyWith<$Res> {
  factory _$$_AuthenticationStateFailedCopyWith(
          _$_AuthenticationStateFailed value,
          $Res Function(_$_AuthenticationStateFailed) then) =
      __$$_AuthenticationStateFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthError error});
}

/// @nodoc
class __$$_AuthenticationStateFailedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$_AuthenticationStateFailed>
    implements _$$_AuthenticationStateFailedCopyWith<$Res> {
  __$$_AuthenticationStateFailedCopyWithImpl(
      _$_AuthenticationStateFailed _value,
      $Res Function(_$_AuthenticationStateFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_AuthenticationStateFailed(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthError,
    ));
  }
}

/// @nodoc

class _$_AuthenticationStateFailed implements _AuthenticationStateFailed {
  _$_AuthenticationStateFailed({required this.error});

  @override
  final AuthError error;

  @override
  String toString() {
    return 'AuthenticationState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationStateFailed &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationStateFailedCopyWith<_$_AuthenticationStateFailed>
      get copyWith => __$$_AuthenticationStateFailedCopyWithImpl<
          _$_AuthenticationStateFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() disconnected,
    required TResult Function() loading,
    required TResult Function() connected,
    required TResult Function(AuthError error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? disconnected,
    TResult? Function()? loading,
    TResult? Function()? connected,
    TResult? Function(AuthError error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? disconnected,
    TResult Function()? loading,
    TResult Function()? connected,
    TResult Function(AuthError error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticationStateDisconnected value)
        disconnected,
    required TResult Function(_AuthenticationStateLoading value) loading,
    required TResult Function(_AuthenticationStateConnected value) connected,
    required TResult Function(_AuthenticationStateFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult? Function(_AuthenticationStateLoading value)? loading,
    TResult? Function(_AuthenticationStateConnected value)? connected,
    TResult? Function(_AuthenticationStateFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticationStateDisconnected value)? disconnected,
    TResult Function(_AuthenticationStateLoading value)? loading,
    TResult Function(_AuthenticationStateConnected value)? connected,
    TResult Function(_AuthenticationStateFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationStateFailed implements AuthenticationState {
  factory _AuthenticationStateFailed({required final AuthError error}) =
      _$_AuthenticationStateFailed;

  AuthError get error;
  @JsonKey(ignore: true)
  _$$_AuthenticationStateFailedCopyWith<_$_AuthenticationStateFailed>
      get copyWith => throw _privateConstructorUsedError;
}
