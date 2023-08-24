import 'package:flutter/material.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/routes/phone_login_in.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
