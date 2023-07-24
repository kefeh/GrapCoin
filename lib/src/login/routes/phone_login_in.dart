import 'package:flutter/material.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/services/authentication_service.dart';
import 'package:grapcoin/src/login/services/firebase_authentication_service.dart';
import 'package:grapcoin/src/login/widgets/sign_in_screen_skeleton.dart';
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

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                SignInScreenSkeleton(
                  child: Form(
                    key: formKey,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      padding: const EdgeInsets.all(8),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              validator: (_) {
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              decoration: const InputDecoration(
                                hintText: 'Type your email',
                                labelText: 'email',
                                border: OutlineInputBorder(),
                                errorMaxLines: 2,
                              ),
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (_) {
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.disabled,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'password',
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                                errorMaxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
