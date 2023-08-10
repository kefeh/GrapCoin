import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/routes/phone_login_in.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final firebaseAuth = FirebaseAuth.instance;

  Future<void> loginAndRedirect(BuildContext context) async {
    // final user = await firebaseAuth.authStateChanges().first;
    final user = firebaseAuth.currentUser;

    if (user != null) {
      await UserService.instance.logIn(user);
    }

    if (user != null) {
      Future.microtask(
        () async {
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainMenu(),
            ),
          );
          return null;
        },
      );
    }
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
                          builder: (context) => const EmailAndPasswordLogin(),
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
                          builder: (context) => const EmailAndPasswordLogin(
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
