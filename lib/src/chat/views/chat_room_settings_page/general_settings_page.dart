import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/pages/personal_info_page.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/pages/settings_page.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/widgets/settings_item.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/widgets/signout_modal_content.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/bottom_sheet.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class GeneralSettingsPage extends ConsumerStatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  ConsumerState<GeneralSettingsPage> createState() =>
      _ChatRoomSettingsPageState();
}

class _ChatRoomSettingsPageState extends ConsumerState<GeneralSettingsPage> {
  bool isLoading = false;
  User? user = FirebaseAuth.instance.currentUser;
  String userDisplayName =
      UserService.instance.currentUser?.nameToDisplay ?? '';
  @override
  Widget build(BuildContext context) {
    const IconData icon = Icons.person_outline;
    const String title = 'Personal information';
    onTap() {}
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: user != null
            ? Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Account',
                          style: TextStyle(
                            color: blackish,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'View and Manage your account details here, and get a general perspective of your information',
                          style: TextStyle(
                            color: black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Profile(user: user!, userDisplayName: userDisplayName),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'General Settings',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: black,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            SettingsItem(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalInfoUpdatePage(),
                                  ),
                                );

                                setState(() {
                                  userDisplayName = UserService.instance
                                          .currentUser?.nameToDisplay ??
                                      '';
                                });
                              },
                              icon: icon,
                              title: title,
                            ),
                            SettingsItem(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingsPage(),
                                  ),
                                );
                              },
                              icon:
                                  CupertinoIcons.person_crop_circle_badge_xmark,
                              title: 'Settings',
                            ),
                            SettingsItem(
                              onTap: onTap,
                              icon: Icons.business_rounded,
                              title: 'Privacy Policy',
                            ),
                            SettingsItem(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  barrierColor:
                                      const Color.fromARGB(80, 0, 0, 0),
                                  backgroundColor:
                                      const Color.fromARGB(0, 250, 250, 250),
                                  builder: (context) {
                                    return const BottomSheetModal(
                                      height: 280,
                                      child: SignoutModalContent(),
                                    );
                                  },
                                );
                              },
                              icon: Icons.logout_rounded,
                              title: 'Sign out',
                              isWarning: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const Center(
                child: Text('Signed Out'),
              ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.user,
    required this.userDisplayName,
  });

  final User user;
  final String userDisplayName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 48),
        InkWell(
          customBorder: const CircleBorder(),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: purple,
            backgroundImage:
                user.photoURL == null ? null : NetworkImage(user.photoURL!),
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
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userDisplayName,
                style: const TextStyle(
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                user.email ?? '',
                style: const TextStyle(
                  color: black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
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
