import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';

class FirebaseAuthenticationService extends AuthenticationService {
  final auth = FirebaseAuth.instance;

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> cleanUp() async {
    // await _connectedSubscription.cancel();
    // await _authSubscription.cancel();
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    try {
      authStreamSink.add(AuthenticationState.loading());
      await auth.signInWithEmailAndPassword(email: email, password: password);
      authStreamSink.add(AuthenticationState.connected());
    } on FirebaseAuthException catch (error) {
      authStreamSink
          .add(AuthenticationState.failed(error: AuthError.from(error)));
    } on Exception {
      AuthenticationState.failed(error: const AuthErrorUnknown());
    }
  }

  @override
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      authStreamSink.add(AuthenticationState.loading());
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      authStreamSink.add(AuthenticationState.connected());
    } on FirebaseAuthException catch (error) {
      authStreamSink
          .add(AuthenticationState.failed(error: AuthError.from(error)));
    } on Exception {
      AuthenticationState.failed(error: const AuthErrorUnknown());
    }
  }
}
