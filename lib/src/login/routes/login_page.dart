import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/login/routes/phone_login_in.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    super.key,
    this.successRouteUri,
    this.loggedOut = false,
    this.namePage = false,
  });

  final String? successRouteUri;
  final bool loggedOut;
  //if we should display the name page or login page
  final bool namePage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final firebaseAuth = FirebaseAuth.instance;
  bool isLoggedOut = false;

  @override
  void initState() {
    super.initState();
    isLoggedOut = widget.loggedOut;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loginAndWelcome(
        Navigator.of(context),
        widget.successRouteUri,
        isLoggedOut: isLoggedOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const EmailAndPasswordLogin();
  }
}

Future<void> loginAndWelcome(
  NavigatorState navigator,
  String? successRouteUri, {
  required bool isLoggedOut,
}) async {
  final user = await FirebaseAuth.instance.authStateChanges().first;
  if (isLoggedOut) return;
  if (user == null) {
    return;
  } else {
    await UserService.instance.logIn(user);

    // await navigator.pushNamedAndRemoveUntil(
    //   successRouteUri ?? Routes.mainMenu,
    //   (route) => false,
    // );
  }
}
