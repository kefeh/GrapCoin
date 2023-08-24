import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/general_settings_page.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:grapcoin/src/pin/widgets/custom_keyboard.dart';
import 'package:grapcoin/src/pin/widgets/custom_title.dart';
import 'package:grapcoin/src/pin/widgets/disconnect_modal.dart';

class PasscodePage extends ConsumerStatefulWidget {
  const PasscodePage({
    super.key,
    this.inApp = false,
    this.isReset = false,
  });
  final bool inApp;
  final bool isReset;

  @override
  ConsumerState<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends ConsumerState<PasscodePage> {
  late String code;
  late String welcomeNoteTop;
  late String welcomeNoteTitle;
  bool wrong = false;
  bool isSet = false;

  @override
  void initState() {
    super.initState();

    code = '';
    final user = UserService.instance.currentUser;
    String? pin = user?.pin;
    isSet = (user != null) && (pin != null && pin.isNotEmpty);
    String userName = '';
    if (user == null) {
      userName = 'Welcome';
    } else {
      userName = user.nameToDisplay;
    }

    if (isSet) {
      welcomeNoteTitle = "Hello, $userName";
      welcomeNoteTop = widget.isReset
          ? "Enter your current pin"
          : "Sign in with your security pin";
    } else {
      welcomeNoteTitle = "Hello, $userName";
      welcomeNoteTop = "Enter a PIN to secure your account";
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onKeyTap(value) async {
    if (code.length < 4) {
      String codeValue = code + value;
      setCodeValueAndNotifyWidgets(codeValue);
    }

    if (code.length == 4) {
      if (isSet) {
        final user = UserService.instance.currentUser;
        if (user != null && user.pin == code) {
          if (widget.inApp) {
            if (widget.isReset) {
              await UserService.instance.setPin('');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PasscodePage(inApp: true),
                ),
              );
            } else {
              Navigator.of(context).pop();
            }
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainMenu(),
              ),
            );
          }
        } else {
          handleWrongPin();
        }
      }
    }
  }

  void setCodeValueAndNotifyWidgets(String value) {
    setState(() {
      code = value;
    });
  }

  onBackspacePressed() {
    if (code.isNotEmpty) {
      final String updatedCodeValue = code.substring(0, code.length - 1);
      setCodeValueAndNotifyWidgets(updatedCodeValue);
    }
  }

  onOkayPressed() async {
    if (code.isNotEmpty && code.length == 4) {
      final user = await UserService.instance.setPin(code);
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not set PIN'),
          ),
        );
      } else {
        if (widget.inApp) {
          Navigator.of(context).pop();
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainMenu(),
            ),
          );
        }
      }
    }
  }

  showColor(index) {
    final colorScheme = Theme.of(context).colorScheme;
    if (code.length >= (index + 1)) {
      return wrong ? Colors.red : colorScheme.secondary;
    }
    return colorScheme.primary.withOpacity(0.1);
  }

  int retries = 0;
  void handleWrongPin() {
    setCodeValueAndNotifyWidgets('');
    if (retries >= 3) {
      if (widget.isReset) {
        Navigator.pop(context);
      } else {
        showDisconnect(context, login: true);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PIN is incorrect please try again'),
        ),
      );
    }
    retries = retries + 1;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final user = UserService.instance.currentUser;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: (30.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (user != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: purple,
                              child: DisplayName(name: user.nameToDisplay),
                            ),
                          ),
                        ),
                      Text(
                        welcomeNoteTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'Muli',
                          fontSize: (18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: (4),
                      ),
                      Text(
                        welcomeNoteTop,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: (16),
                          width: (16),
                          decoration: BoxDecoration(
                            color: showColor(i),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, _) {
                  return CustomKeyboard(
                    alreadySet: isSet,
                    onBackspacePress: onBackspacePressed,
                    onConfirm: onOkayPressed,
                    onTap: onKeyTap,
                  );
                },
              ),
              isSet && !widget.isReset
                  ? GestureDetector(
                      onTap: () {
                        showDisconnect(context, login: true);
                      },
                      child: const CustomTitleText(
                        text: "Forgot pin",
                        fontSize: (14),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
