import 'package:grapcoin/src/login/models/phone_auth_state.dart';
import 'package:grapcoin/src/login/models/phone_auth_state_notifier.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';
import 'package:grapcoin/src/login/services/firebase_authentication_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final phoneAuthProvider =
    StateNotifierProvider<PhoneAuthNotifier, PhoneAuthState>(
  (ref) => PhoneAuthNotifier(),
);
final authServiceProvider = Provider<AuthenticationService>((ref) {
  final firebaseAuth = FirebaseAuthenticationService();
  ref.onDispose(() async {
    await firebaseAuth.cleanUp();
  });
  return firebaseAuth;
});
