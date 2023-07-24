import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState.disconnected() = _AuthenticationStateDisconnected;
  factory AuthenticationState.loading() = _AuthenticationStateLoading;
  factory AuthenticationState.connected() = _AuthenticationStateConnected;
}
