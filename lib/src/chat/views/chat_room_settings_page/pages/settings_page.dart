import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/widgets/settings_item.dart';

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
                onTap: () {},
                icon: Icons.password_rounded,
                title: 'Reset Password',
              ),
              SettingsItem(
                onTap: () {},
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
