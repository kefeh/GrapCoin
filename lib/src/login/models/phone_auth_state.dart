import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/login/models/email_address.dart';
import 'package:grapcoin/src/login/models/name.dart';
import 'package:grapcoin/src/login/models/password.dart';

part 'phone_auth_state.freezed.dart';

@freezed
class PhoneAuthState with _$PhoneAuthState {
  factory PhoneAuthState({
    required Name name,
    required EmailAddress email,
    required Password password,
  }) = _PhoneAuthState;
}
