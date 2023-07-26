import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_auth_state.freezed.dart';

@freezed
class PhoneAuthState with _$PhoneAuthState {
  factory PhoneAuthState({
    required String email,
    required String password,
  }) = _PhoneAuthState;
}
