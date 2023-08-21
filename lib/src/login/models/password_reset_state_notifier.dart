import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/login/models/password.dart';
import 'package:grapcoin/src/login/models/password_reset_state.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';

class PasswordResetNotifier extends StateNotifier<PasswordResetState> {
  final AuthenticationService _authenticationService;
  PasswordResetNotifier(this._authenticationService)
      : super(
          PasswordResetState(
            currentPassword: Password(''),
            newPassword: Password(''),
            confirmNewPassword: Password(''),
          ),
        );

  onNewPasswordChange(String passwordString) {
    state = state.copyWith(newPassword: Password(passwordString));
  }

  onCurrentPasswordChange(String passwordString) {
    state = state.copyWith(currentPassword: Password(passwordString));
  }

  onConfirmNewPasswordChange(String passwordString) {
    state = state.copyWith(confirmNewPassword: Password(passwordString));
  }

  bool confirmPassword() {
    final newPassword = state.newPassword;
    final confirmPassword = state.confirmNewPassword;

    bool isValid = newPassword.isValid() && confirmPassword.isValid();
    if (isValid && newPassword == confirmPassword) return true;
    return false;
  }

  Future<void> resetPassword() async {
    await _authenticationService.resetPassword(
      state.currentPassword.getOrEmpty(),
      state.newPassword.getOrEmpty(),
    );
  }
}
