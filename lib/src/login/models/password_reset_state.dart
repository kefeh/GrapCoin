import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/login/models/password.dart';

part 'password_reset_state.freezed.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  factory PasswordResetState({
    required Password currentPassword,
    required Password newPassword,
    required Password confirmNewPassword,
  }) = _PasswordResetState;
}
