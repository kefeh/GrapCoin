import 'package:flutter/material.dart';

class SignInScreenSkeleton extends StatelessWidget {
  const SignInScreenSkeleton(
      {super.key, required this.child, this.message, this.secondMessage});

  final Widget child;
  final String? message;
  final String? secondMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(),
              ),
              const SizedBox(height: 40),
              if (message != null)
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 20),
              if (secondMessage != null)
                Text(
                  secondMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
            ],
          ),
        ),
        child
      ],
    );
  }
}
