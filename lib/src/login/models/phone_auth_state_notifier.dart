import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/login/models/email_address.dart';
import 'package:grapcoin/src/login/models/password.dart';
import 'package:grapcoin/src/login/models/phone_auth_state.dart';

class PhoneAuthNotifier extends StateNotifier<PhoneAuthState> {
  PhoneAuthNotifier()
      : super(
          PhoneAuthState(
            email: EmailAddress(''),
            password: Password(''),
          ),
        );

  onEmailChange(String emailString) {
    state = state.copyWith(email: EmailAddress(emailString));
  }

  onPasswordChange(String passwordString) {
    state = state.copyWith(password: Password(passwordString));
  }

  isValidPhoneAuthState() {
    return state.email.isValid() && state.password.isValid();
  }
}
