import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/routes/welcome_page.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class GeneralSettingsPage extends ConsumerStatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  ConsumerState<GeneralSettingsPage> createState() =>
      _ChatRoomSettingsPageState();
}

class _ChatRoomSettingsPageState extends ConsumerState<GeneralSettingsPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userDisplayName =
        UserService.instance.currentUser?.nameToDisplay ?? '';

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 48,
                  left: 25,
                  right: 25,
                ),
                child: user != null
                    ? Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(height: 48),
                                InkWell(
                                  customBorder: const CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: purple,
                                      backgroundImage: user.photoURL == null
                                          ? null
                                          : NetworkImage(user.photoURL!),
                                      child: user.photoURL == null
                                          ? DisplayName(name: userDisplayName)
                                          : Image.network(
                                              user.photoURL!,
                                              fit: BoxFit.fitWidth,
                                              errorBuilder: (
                                                context,
                                                error,
                                                stackTrace,
                                              ) =>
                                                  DisplayName(
                                                name: userDisplayName,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  userDisplayName,
                                  style: const TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ChatButton.outlinedCaution(
                            text: 'Logout',
                            isLoading: isLoading,
                            isTransparent: true,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });

                              ref.watch(authServiceProvider).logOut();
                              ref.invalidate(chatRoomListStreamProvider);
                              await UserService.instance
                                  .signOut(context: context);
                              //add firebase token deletion here if it becomes
                              //necessary, this prevents user from receiving
                              //notifications when logged out
                              setState(() {
                                isLoading = false;
                              });
                              ref.watch(chatRoomPageIndex.notifier).state = 0;
                              ref.watch(authServiceProvider).logOut();
                              // ignore: use_build_context_synchronously
                              await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WelcomePage(),
                                ),
                                (route) => false,
                              );
                            },
                          )
                        ],
                      )
                    : const Center(
                        child: Text('Signed Out'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayName extends StatelessWidget {
  const DisplayName({
    super.key,
    required this.name,
  });

  final String? name;
  @override
  Widget build(BuildContext context) {
    return Text(
      getInitials(
        name ?? '',
      ),
      style: const TextStyle(color: white),
    );
  }
}
