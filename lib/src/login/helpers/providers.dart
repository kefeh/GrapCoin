import 'package:grapcoin/src/login/models/password_reset_state.dart';
import 'package:grapcoin/src/login/models/password_reset_state_notifier.dart';
import 'package:grapcoin/src/login/models/phone_auth_state.dart';
import 'package:grapcoin/src/login/models/phone_auth_state_notifier.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';
import 'package:grapcoin/src/login/services/firebase_authentication_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

final passwordResetProvider = StateNotifierProvider.autoDispose<
    PasswordResetNotifier, PasswordResetState>(
  (ref) {
    final firebaseAuthService = ref.watch(authServiceProvider);
    return PasswordResetNotifier(firebaseAuthService);
  },
);
