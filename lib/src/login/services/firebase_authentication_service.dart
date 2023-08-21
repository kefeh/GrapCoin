import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class FirebaseAuthenticationService extends AuthenticationService {
  final auth = FirebaseAuth.instance;

  @override
  Future<void> signInWithGoogle() {
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
      final currentUser = auth.currentUser;
      if (currentUser != null) {
        await UserService.instance.logIn(currentUser);
      }
      authStreamSink.add(AuthenticationState.connected());
    } on FirebaseAuthException catch (error) {
      authStreamSink
          .add(AuthenticationState.failed(error: AuthError.from(error)));
    } on Exception {
      AuthenticationState.failed(error: const AuthErrorUnknown());
    }
  }

  @override
  Future<void> updateUserData(String uID, String name, String email) async {
    try {
      authStreamSink.add(AuthenticationState.loading());
      await UserService.instance.add(uID, name, email, isUpdate: true);

      authStreamSink.add(AuthenticationState.connected());
    } on FirebaseAuthException catch (error) {
      authStreamSink
          .add(AuthenticationState.failed(error: AuthError.from(error)));
    } on Exception {
      AuthenticationState.failed(error: const AuthErrorUnknown());
    }
  }

  @override
  Future<void> signUpWithEmail(
      String name, String email, String password) async {
    try {
      authStreamSink.add(AuthenticationState.loading());
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final currentUser = auth.currentUser;
      if (currentUser != null) {
        await UserService.instance.add(currentUser.uid, name, email);
        await UserService.instance.logIn(currentUser);
      }
      authStreamSink.add(AuthenticationState.connected());
    } on FirebaseAuthException catch (error) {
      authStreamSink
          .add(AuthenticationState.failed(error: AuthError.from(error)));
    } on Exception {
      AuthenticationState.failed(error: const AuthErrorUnknown());
    }
  }

  @override
  Future<void> resetPassword(String currentPassword, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    await reauthenticate(user!, currentPassword);
    await user.updatePassword(newPassword);
  }

  Future<UserCredential> reauthenticate(
      User user, String currentPassword) async {
    final credentials = EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);
    return user.reauthenticateWithCredential(credentials);
  }

  @override
  Future<void> deleteAccount() async {
    await UserService.instance.deleteCurrentUserAccount();
  }
}
