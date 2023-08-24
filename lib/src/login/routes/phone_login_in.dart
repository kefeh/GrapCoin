import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/bottom_sheet.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/core/widgets/custom_form_fields.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/models/email_address.dart';
import 'package:grapcoin/src/login/models/name.dart';
import 'package:grapcoin/src/login/models/password.dart';
import 'package:grapcoin/src/login/routes/verify_email_page.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:grapcoin/src/login/widgets/phone_reset_modal.dart';
import 'package:grapcoin/src/pin/routes/passcode_page.dart';
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
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool shouldValidate = false;
  bool isLoading = false;
  bool userExists = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    Future.microtask(() {
      ref.read(authServiceProvider).authState.listen(
        (event) {
          event.maybeMap(
            orElse: () {
              setState(() {
                isLoading = false;
              });
            },
            connected: (_) async {
              setState(() {
                isLoading = false;
              });
              final user = FirebaseAuth.instance.currentUser;
              if (user == null) return;
              if (!user.emailVerified) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyEmailPage(),
                    ));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasscodePage(),
                    ));
              }
            },
            failed: (value) {
              setState(() {
                isLoading = false;
              });
              switch (value.error) {
                case AuthErrorUnknown():
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('An unknown error occured, please try again'),
                    ),
                  );
                  break;
                case AuthErrorProjectNotFound():
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'This project does not seem to exist, please contact your administrator'),
                    ),
                  );
                  break;
                case AuthErrorUserNotFound():
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'You dont seem to have an account, please sign up'),
                    ),
                  );
                  break;
                case AuthErrorEmailInUse():
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'An account associated to this email already exist, please log in'),
                    ),
                  );
                  break;
                case AuthErrorWrongCredentials():
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('The password is not correct, try again'),
                    ),
                  );
                  break;
                case AuthErrorTooManyRequests():
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Too many attempts at accessing the account, please try again after 5 minutes',
                      ),
                    ),
                  );
                  break;
              }
            },
            loading: (_) {
              setState(() {
                isLoading = true;
              });
            },
          );
        },
      );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // precacheImage(Image.asset(grapcoinLogo).image, context);
  }

  @override
  void dispose() {
    ref.read(authServiceProvider).authState.listen((event) {}).cancel();
    super.dispose();
  }

  void signIn() async {
    final phoneAuthState = ref.watch(phoneAuthProvider);
    await ref.watch(authServiceProvider).signInWithEmail(
          phoneAuthState.email.getOrEmpty(),
          phoneAuthState.password.getOrEmpty(),
        );
  }

  void signUp() async {
    setState(() {
      shouldValidate = true;
    });
    final phoneAuthState = ref.watch(phoneAuthProvider);

    userExists = await UserService.instance
        .existsWithUsername(phoneAuthState.name.getOrEmpty());
    if (userExists) return;

    await ref.watch(authServiceProvider).signUpWithEmail(
          phoneAuthState.name.getOrEmpty(),
          phoneAuthState.email.getOrEmpty(),
          phoneAuthState.password.getOrEmpty(),
        );
  }

  void resetPasswordWithEmail() async {
    final phoneAuthState = ref.watch(phoneAuthProvider);
    setState(() {
      isLoading = true;
    });
    if (phoneAuthState.email.isValid()) {
      try {
        await ref.watch(authServiceProvider).resetPasswordFromEmail(
              phoneAuthState.email.getOrEmpty(),
            );
        // ignore: use_build_context_synchronously
        showModalBottomSheet(
          context: context,
          barrierColor: const Color.fromARGB(80, 0, 0, 0),
          backgroundColor: const Color.fromARGB(0, 250, 250, 250),
          builder: (context) {
            return const BottomSheetModal(
              height: 280,
              child: PhoneResetModal(),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        final error = AuthError.from(e);
        switch (error) {
          case AuthErrorUnknown():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('An unknown error occured, please try again'),
              ),
            );
            break;
          case AuthErrorProjectNotFound():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'This project does not seem to exist, please contact your administrator'),
              ),
            );
            break;
          case AuthErrorUserNotFound():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('You dont seem to have an account, please sign up'),
              ),
            );
            break;
          case AuthErrorEmailInUse():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'An account associated to this email already exist, please log in'),
              ),
            );
            break;
          case AuthErrorWrongCredentials():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('The current password is not correct, try again'),
              ),
            );
            break;
          case AuthErrorTooManyRequests():
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'Too many attempts at ressetting password, try again after 5 minutes'),
              ),
            );
            break;
        }
      } on Exception {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something unexpected happened'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'You must enter your email to reset your password',
          ),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  submit() {
    emailFocusNode.unfocus();
    nameFocusNode.unfocus();
    passwordFocusNode.unfocus();
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
                Expanded(
                  child: Form(
                    key: formKey,
                    autovalidateMode: shouldValidate
                        ? AutovalidateMode.onUserInteraction
                        : null,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: SingleChildScrollView(
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
                            if (widget.isSignUp) const SizedBox(height: 16),
                            if (widget.isSignUp)
                              CustomFormField(
                                controller: nameController,
                                focusNode: nameFocusNode,
                                hintText: 'Enter your username',
                                labelText: 'Username',
                                onChanged: ref
                                    .watch(phoneAuthProvider.notifier)
                                    .onNameChange,
                                validator: getNameErrorStringOrNull,
                              ),
                            const SizedBox(height: 16),
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
                            const SizedBox(height: 16),
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
                                isLoading
                                    ? const SizedBox.shrink()
                                    : TextButton(
                                        onPressed: resetPasswordWithEmail,
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
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer(builder: (context, ref, _) {
                      final phoneNumberNotifier = ref.watch(phoneAuthProvider);
                      final isEmailValid = phoneNumberNotifier.email.isValid();
                      final isPasswordValid =
                          phoneNumberNotifier.password.isValid();
                      final isNameValid = phoneNumberNotifier.name.isValid();

                      final isValid = isEmailValid &&
                          isPasswordValid &&
                          (widget.isSignUp ? isNameValid : true);
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isValid
                            ? ChatButton.primary(
                                text: buttonText,
                                onPressed: submit,
                                isLoading: isLoading,
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
                      );
                    }),
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

  String? getNameErrorStringOrNull(String? nameString) {
    final nameValue = Name(nameString ?? '').value;
    return nameValue.fold(
      (l) => l.maybeMap(
        invalidOrLongName: (_) =>
            "Name should contain only characters and numbers",
        empty: (_) => "username is required",
        orElse: () => '',
      ),
      (r) {
        if (userExists) {
          return "Username already exists, please try updating name or login";
        }
        return null;
      },
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
