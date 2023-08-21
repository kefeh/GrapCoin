import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.disconnected() = _AuthenticationStateDisconnected;
  factory AuthenticationState.loading() = _AuthenticationStateLoading;
  factory AuthenticationState.connected() = _AuthenticationStateConnected;
  factory AuthenticationState.failed({required AuthError error}) =
      _AuthenticationStateFailed;
}

const authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'project-not-found': AuthErrorProjectNotFound(),
  'email-already-in-use': AuthErrorEmailInUse(),
  'wrong-password': AuthErrorWrongCredentials(),
  'too-many-requests': AuthErrorTooManyRequests(),
};

@immutable
sealed class AuthError {
  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown implements AuthError {
  const AuthErrorUnknown();
}

@immutable
class AuthErrorUserNotFound implements AuthError {
  const AuthErrorUserNotFound();
}

@immutable
class AuthErrorEmailInUse implements AuthError {
  const AuthErrorEmailInUse();
}

@immutable
class AuthErrorProjectNotFound implements AuthError {
  const AuthErrorProjectNotFound();
}

@immutable
class AuthErrorWrongCredentials implements AuthError {
  const AuthErrorWrongCredentials();
}

class AuthErrorTooManyRequests implements AuthError {
  const AuthErrorTooManyRequests();
}
