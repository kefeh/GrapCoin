import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/routes/welcome_page.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class SignoutModalContent extends ConsumerStatefulWidget {
  const SignoutModalContent({Key? key}) : super(key: key);

  @override
  ConsumerState<SignoutModalContent> createState() =>
      _SignoutModalContentState();
}

class _SignoutModalContentState extends ConsumerState<SignoutModalContent> {
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
                child: Icon(Icons.logout_rounded, color: red, size: 60),
              ),
              Text(
                "Are you sure you want to sign out?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: black,
                ),
              ),
              Text(
                "This action will log you out and you will need to sign in again to access your account.",
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
          child: Row(
            children: [
              Expanded(
                  child: ChatButton.outlined(
                text: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
              const SizedBox(width: 10),
              Expanded(
                child: ChatButton.primaryDanger(
                  text: "Sign me out",
                  isLoading: isLoading,
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    ref.watch(authServiceProvider).logOut();
                    ref.invalidate(chatRoomListStreamProvider);
                    await UserService.instance.signOut(context: context);
                    setState(() {
                      isLoading = false;
                    });
                    // ignore: use_build_context_synchronously
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
