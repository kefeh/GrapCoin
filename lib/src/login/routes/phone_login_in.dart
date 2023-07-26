import 'package:flutter/material.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/core/widgets/custom_form_fields.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';
import 'package:grapcoin/src/login/services/firebase_authentication_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider<AuthenticationService>((ref) {
  final firebaseAuth = FirebaseAuthenticationService();
  ref.onDispose(() async {
    await firebaseAuth.cleanUp();
  });
  return firebaseAuth;
});

final authStateStreamProvider =
    StreamProvider.autoDispose<AuthenticationState>((ref) {
  return ref.watch(authServiceProvider).authState;
});

class EmailAndPasswordLogin extends StatefulHookConsumerWidget {
  const EmailAndPasswordLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends ConsumerState<EmailAndPasswordLogin> {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // precacheImage(Image.asset(grapcoinLogo).image, context);
  }

  ///phone number variable holding the phone number used in the first step
  @override
  Widget build(BuildContext context) {
    const hintText = 'Enter your email';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          leading: BackButton(
            onPressed: () {},
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Form(
                      key: formKey,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            CustomFormField(
                              controller: emailController,
                              focusNode: emailFocusNode,
                              hintText: hintText,
                              labelText: 'Email',
                            ),
                            const SizedBox(height: 20),
                            CustomFormField(
                              isPassword: true,
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              hintText: 'Enter password',
                              labelText: 'Password',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ChatButton.primary(text: "signin"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
