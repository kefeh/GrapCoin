import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final firebaseAuth = FirebaseAuth.instance;

  Future<void> loginAndRedirect(BuildContext context) async {
    final user = await firebaseAuth.authStateChanges().first;

    if (user != null) {
      await UserService.instance.logIn(user);
    }

    // String redirect;
    // if (user != null) {
    //   redirect = Routes.mainMenu;
    //   if (testEnv) {}
    // } else {
    //   redirect = Routes.login;
    // }

    // If this route `isCurrent` then we actually loaded '/', redirect.
    // Otherwise, this is just the result of first build but we're about
    // to navigate to a different page -- don't mess with things.
    // if (!Navigator.of(context).canPop()) {
    //   await Navigator.of(context).pushNamed(redirect);
    //   return;
    // }
    // await Navigator.of(context).pushReplacementNamed(redirect);
  }

  @override
  Widget build(BuildContext context) {
    loginAndRedirect(context);

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to grapcoin!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
            ),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
