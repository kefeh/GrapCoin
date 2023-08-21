import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';

class PhoneResetModal extends ConsumerStatefulWidget {
  const PhoneResetModal({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneResetModal> createState() => _PhoneResetModalState();
}

class _PhoneResetModalState extends ConsumerState<PhoneResetModal> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  Icons.mark_email_read_rounded,
                  color: purple,
                  size: 50,
                ),
              ),
              Text(
                "Password Reset",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: black,
                ),
              ),
              Text(
                "A mail has been sent to your email with a link that when you follow will help reset your password, follow the instructions and come back here to proceed with your login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ChatButton.outlined(
            text: "Understood",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
