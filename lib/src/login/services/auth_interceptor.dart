import 'package:dio/dio.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_interceptor.g.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._userService);
  final UserService _userService;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _userService.currentUser?.uid;
    final modifiedOptions = options
      ..headers.addAll(
        token == null ? {} : {'Authorization': 'Bearer $token'},
      );

    handler.next(modifiedOptions);
  }
}

@riverpod
AuthInterceptor authInterceptor(AuthInterceptorRef ref) {
  final userService = UserService.instance;
  return AuthInterceptor(userService);
}
