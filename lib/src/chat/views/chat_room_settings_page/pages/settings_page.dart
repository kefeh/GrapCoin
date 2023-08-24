import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/pages/delete_account_page.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/pages/password_reset_page.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/widgets/settings_item.dart';
import 'package:grapcoin/src/pin/routes/passcode_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Settings'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SettingsItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordResetPage(),
                    ),
                  );
                },
                icon: Icons.password_rounded,
                title: 'Reset Password',
              ),
              SettingsItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasscodePage(
                        inApp: true,
                        isReset: true,
                      ),
                    ),
                  );
                },
                icon: Icons.phonelink_lock_sharp,
                title: 'Change PIN',
              ),
              SettingsItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeleteAccountPage(),
                    ),
                  );
                },
                icon: Icons.delete_forever,
                title: 'Delete account',
                isWarning: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
