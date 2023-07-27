import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/core/widgets/custom_form_fields.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailAndPasswordLogin extends StatefulHookConsumerWidget {
  const EmailAndPasswordLogin({
    super.key,
    this.isSignUp = false,
  });

  final bool isSignUp;

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

  void signIn() async {
    final phoneAuthState = ref.watch(phoneAuthProvider);
    await ref.watch(authServiceProvider).signInWithEmail(
          phoneAuthState.email,
          phoneAuthState.password,
        );
    final user = FirebaseAuth.instance.currentUser;
    final serviceUser = UserService.instance.currentUser;
    print(user);
    print(serviceUser);
  }

  void signUp() async {
    final phoneAuthState = ref.watch(phoneAuthProvider);
    await ref.watch(authServiceProvider).signUpWithEmail(
          phoneAuthState.email,
          phoneAuthState.password,
        );
    final user = FirebaseAuth.instance.currentUser;
    final serviceUser = UserService.instance.currentUser;
    print(user);
    print(serviceUser);
  }

  ///phone number variable holding the phone number used in the first step
  @override
  Widget build(BuildContext context) {
    final welcomeTitle = widget.isSignUp ? 'Welcome back' : "Hello there 👋";
    final welcomeMessage = widget.isSignUp
        ? "Welcome to you, with your email and password create your account"
        : 'Log in to your account to continue';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(widget.isSignUp ? 'Create account' : 'Login'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                welcomeTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                welcomeMessage,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: blackLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        CustomFormField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          hintText: 'Enter your email',
                          labelText: 'Email',
                          onChanged: ref
                              .watch(phoneAuthProvider.notifier)
                              .onEmailChange,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomFormField(
                              isPassword: true,
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              hintText: 'Enter password',
                              labelText: 'Password',
                              onChanged: ref
                                  .watch(phoneAuthProvider.notifier)
                                  .onPasswordChange,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot password",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: purple,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.maybeOf(context)!.size.height / 8),
                ChatButton.primary(
                    text: widget.isSignUp ? 'Sign Up' : 'Login',
                    onPressed: widget.isSignUp ? signUp : signIn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
