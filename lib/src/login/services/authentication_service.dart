import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

abstract class AuthenticationService {
  final StreamController<AuthenticationState> _authState =
      StreamController.broadcast()
        ..add(
          UserService.instance.currentUser != null
              ? AuthenticationState.connected()
              : AuthenticationState.disconnected(),
        );

  Stream<AuthenticationState> get authState => _authState.stream;

  @protected
  StreamSink<AuthenticationState> get authStreamSink => _authState.sink;

  Future<void> signInWithGoogle();
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String name, String email, String password);
  Future<void> updateUserData(String uID, String name, String email);

  Future<void> cleanUp();

  void logOut() {
    _authState.add(AuthenticationState.disconnected());
  }

  void changeState(AuthenticationState authenticationState) {
    authStreamSink.add(authenticationState);
  }
}
