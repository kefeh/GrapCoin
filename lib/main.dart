import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/login/routes/verify_email_page.dart';
import 'package:grapcoin/src/login/routes/welcome_page.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:grapcoin/src/pin/routes/passcode_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final firebaseAuth = FirebaseAuth.instance;

  Future<void> loginAndRedirect(BuildContext context) async {
    // final user = await firebaseAuth.authStateChanges().first;
    final user = firebaseAuth.currentUser;

    if (user != null) {
      await UserService.instance.logIn(user);
    }
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(),
        ),
      );
      return;
    }

    if (user.emailVerified) {
      Future.microtask(
        () async {
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const PasscodePage(),
            ),
          );
          return null;
        },
      );
    }
    if (!user.emailVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyEmailPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    loginAndRedirect(context);

    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.rocket_launch_outlined,
                      size: 100,
                      color: purple,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to \ngrapcoin!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: purple,
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Your Ultimate hub for seemless connections',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
