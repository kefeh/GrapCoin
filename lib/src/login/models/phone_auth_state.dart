import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_auth_state.freezed.dart';

@freezed
class PhoneAuthState with _$PhoneAuthState {
  factory PhoneAuthState({
    required String nameCountry,
    required String codeCountry,
    required String currentPhoneNumber,
    required String oldPhoneNumber,
    required bool onOtpScreen,
  }) = _PhoneAuthState;
}
