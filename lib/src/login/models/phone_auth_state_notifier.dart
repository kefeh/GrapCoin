import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/login/models/phone_auth_state.dart';

class PhoneAuthNotifier extends StateNotifier<PhoneAuthState> {
  PhoneAuthNotifier() : super(PhoneAuthState(email: '', password: ''));

  onEmailChange(String emailText) {
    state = state.copyWith(email: emailText);
  }

  onPasswordChange(String passwordString) {
    state = state.copyWith(password: passwordString);
  }
}
