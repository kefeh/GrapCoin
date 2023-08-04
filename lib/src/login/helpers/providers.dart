import 'package:firebase_auth/firebase_auth.dart';
import 'package:grapcoin/src/login/models/phone_auth_state.dart';
import 'package:grapcoin/src/login/models/phone_auth_state_notifier.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';
import 'package:grapcoin/src/login/services/firebase_authentication_service.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

final phoneAuthProvider =
    StateNotifierProvider.autoDispose<PhoneAuthNotifier, PhoneAuthState>(
  (ref) => PhoneAuthNotifier(),
);
final authServiceProvider = Provider<AuthenticationService>((ref) {
  final firebaseAuth = FirebaseAuthenticationService();
  ref.onDispose(() async {
    await firebaseAuth.cleanUp();
  });
  return firebaseAuth;
});

@riverpod
Future<void> signUp(SignUpRef ref) async {
  final phoneAuthState = ref.watch(phoneAuthProvider);
  await ref.watch(authServiceProvider).signUpWithEmail(
        phoneAuthState.email.getOrEmpty(),
        phoneAuthState.password.getOrEmpty(),
      );
  final user = FirebaseAuth.instance.currentUser;
  final serviceUser = UserService.instance.currentUser;
  print(user);
  print(serviceUser);
}
