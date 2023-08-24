import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/bottom_sheet.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/routes/welcome_page.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

Future<dynamic> showDisconnect(BuildContext context, {bool login = false}) {
  return showModalBottomSheet(
    context: context,
    barrierColor: const Color.fromARGB(80, 0, 0, 0),
    backgroundColor: const Color.fromARGB(0, 250, 250, 250),
    builder: (context) {
      return const BottomSheetModal(
        height: 280,
        child: DisconnectModal(),
      );
    },
  );
}

class DisconnectModal extends ConsumerStatefulWidget {
  const DisconnectModal({
    super.key,
  });

  @override
  ConsumerState<DisconnectModal> createState() => _DisconnectModalState();
}

class _DisconnectModalState extends ConsumerState<DisconnectModal> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.pin_invoke_outlined, color: red, size: 60),
              ),
              Text(
                "Forgot PIN ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: purple,
                  fontSize: (18),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "It seems you must have forgotten your PIN, please click on the button below to reset your PIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: black,
                  fontSize: (12),
                  fontFamily: "Muli",
                  fontWeight: FontWeight.w200,
                ),
              )
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
                child: ChatButton.primary(
                  text: "Reset PIN",
                  isLoading: isLoading,
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    ref.watch(authServiceProvider).logOut();
                    await UserService.instance.setPin('');
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
