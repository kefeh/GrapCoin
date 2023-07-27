import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/routes/login_page.dart';
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: MediaQuery.maybeOf(context)!.size.width / 3),
              const Text(
                'Welcome to \ngrapcoin!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
              ),
              const Text(
                'Your Ultimate hub for seemless connections',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Column(
                children: [
                  ChatButton.primary(
                    text: 'Login',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  ChatButton.outlined(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(
                            isSignUp: true,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
