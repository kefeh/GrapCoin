import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/core/widgets/custom_form_fields.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/models/email_address.dart';
import 'package:grapcoin/src/login/models/password.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailAndPasswordLogin extends ConsumerStatefulWidget {
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
  bool shouldValidate = false;

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
          phoneAuthState.email.getOrEmpty(),
          phoneAuthState.password.getOrEmpty(),
        );
    final user = FirebaseAuth.instance.currentUser;
    final serviceUser = UserService.instance.currentUser;
    print(user);
    print(serviceUser);
  }

  void signUp() async {
    final phoneAuthState = ref.watch(phoneAuthProvider);
    await ref.watch(authServiceProvider).signUpWithEmail(
          phoneAuthState.email.getOrEmpty(),
          phoneAuthState.password.getOrEmpty(),
        );
    final user = FirebaseAuth.instance.currentUser;
    final serviceUser = UserService.instance.currentUser;
    print(user);
    print(serviceUser);
  }

  submit() {
    return widget.isSignUp ? signUp() : signIn();
  }

  ///phone number variable holding the phone number used in the first step
  @override
  Widget build(BuildContext context) {
    final welcomeTitle = widget.isSignUp ? 'Welcome back' : "Hello there 👋";
    final welcomeMessage = widget.isSignUp
        ? "Welcome to you, with your email and password create your account"
        : 'Log in to your account to continue';
    final buttonText = widget.isSignUp ? 'Sign Up' : 'Login';

    // ref.listen(
    //   signUpProvider,
    //   (previous, next) {
    //     next.whenOrNull(
    //       error: (error, _) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(content: Text(error.toString())),
    //         );
    //       },
    //     );
    //   },
    // );

    ref.watch(authServiceProvider).authState.listen(
      (event) {
        event.mapOrNull(
          failed: (value) {
            switch (value.error) {
              case AuthErrorUnknown():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(value.toString())),
                );
                break;
              case AuthErrorProjectNotFound():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(value.toString())),
                );
                break;
              case AuthErrorUserNotFound():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(value.toString())),
                );
                break;
              case AuthErrorEmailInUse():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(value.toString())),
                );
                break;
            }
          },
        );
      },
    );

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
                  autovalidateMode: shouldValidate
                      ? AutovalidateMode.onUserInteraction
                      : null,
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
                          validator: getEmailErrorStringOrNull,
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
                              validator: getPasswordErrorStringOrNull,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: ref
                              .watch(phoneAuthProvider.notifier)
                              .isValidPhoneAuthState()
                          ? ChatButton.primary(
                              text: buttonText,
                              onPressed: submit,
                            )
                          : ChatButton.outlined(
                              text: buttonText,
                              isTransparent: true,
                              onPressed: () {
                                setState(() {
                                  shouldValidate = true;
                                });
                                formKey.currentState!.validate();
                              },
                            ),
                    ),
                    const SizedBox(height: 16),
                    AlternativeOnboarding(isSignUp: widget.isSignUp),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? getEmailErrorStringOrNull(String? emailString) {
    final emailValue = EmailAddress(emailString ?? '').value;
    return emailValue.fold(
      (l) => l.maybeMap(
        invalidEmail: (_) => "invalid email address",
        empty: (_) => "Email is required",
        orElse: () => '',
      ),
      (r) => null,
    );
  }

  String? getPasswordErrorStringOrNull(String? passwordString) {
    final passwordValue = Password(passwordString ?? '').value;
    return passwordValue.fold(
      (l) => l.maybeMap(
        weakPassword: (_) =>
            "Password should include a character, number, symbol and at least 8 letters long",
        empty: (_) => "Password is required",
        orElse: () => '',
      ),
      (r) => null,
    );
  }
}

class AlternativeOnboarding extends StatelessWidget {
  const AlternativeOnboarding({
    super.key,
    this.isSignUp = false,
  });
  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    String message = isSignUp
        ? "Do you have an account, try "
        : "If you don't have an account, try ";
    String cta = isSignUp ? "sign in" : "sign up";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => EmailAndPasswordLogin(
                  isSignUp: !isSignUp,
                ),
              ),
            );
          },
          child: Text(cta, style: const TextStyle(color: purple)),
        )
      ],
    );
  }
}
