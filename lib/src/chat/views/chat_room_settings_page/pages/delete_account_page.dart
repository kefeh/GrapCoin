import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/models/user.dart' as model;
import 'package:grapcoin/src/login/routes/welcome_page.dart';
import 'package:grapcoin/src/util/helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteAccountPage extends ConsumerStatefulWidget {
  const DeleteAccountPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeleteAccountPageState();
}

class _DeleteAccountPageState extends ConsumerState<DeleteAccountPage> {
  bool isLoading = false;
  bool userExists = false;
  model.User? user;

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
          title: const Text('Delete Account'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.auto_delete_rounded,
                        color: red,
                        size: 120,
                      ),
                    ),
                    Text(
                      "Delete your GrapCoin Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: black,
                      ),
                    ),
                    Text(
                      "Are you sure you want to delete your account? This action can not be undone.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              ChatButton.primaryDanger(
                text: "Delete Account",
                isLoading: isLoading,
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await ref.watch(authServiceProvider).deleteAccount();
                    setState(() {
                      isLoading = false;
                    });
                    // ignore: use_build_context_synchronously
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(),
                      ),
                      ModalRoute.withName('/'),
                    );
                  } catch (e, stk) {
                    setState(() {
                      isLoading = false;
                    });
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error deleting account. Try again.'),
                        ),
                      );
                    }
                    logger
                      ..e(e)
                      ..e(stk);
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
