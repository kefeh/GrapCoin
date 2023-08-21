import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late Timer _timer;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainMenu(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser?.email ?? '';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.maybeOf(context)!.size.width / 3,
                child: Center(
                  child: Icon(
                    Icons.mark_email_unread_rounded,
                    color: red,
                    size: MediaQuery.maybeOf(context)!.size.width / 4,
                  ),
                ),
              ),
              const Text(
                'Verify your email address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'An Email has been sent to your email address $userEmail, please check your email and click the link to confirm the email. If you have not received the email, click below to resend',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Column(
                children: [
                  ChatButton.primary(
                    text: 'Resend code',
                    isLoading: isLoading,
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null && !user.emailVerified) {
                        user.sendEmailVerification();
                      }
                      setState(() {
                        isLoading = false;
                      });
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
