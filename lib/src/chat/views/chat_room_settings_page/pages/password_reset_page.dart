import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/core/widgets/custom_form_fields.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/models/password.dart';
import 'package:grapcoin/src/login/routes/welcome_page.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordResetPage extends ConsumerStatefulWidget {
  const PasswordResetPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      PasswordResetPageState();
}

class PasswordResetPageState extends ConsumerState<PasswordResetPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late FocusNode currentPasswordFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmPasswordFocusNode;
  bool shouldValidate = false;
  bool isLoading = false;
  bool userExists = false;

  @override
  void initState() {
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    currentPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

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

  submit() async {
    setState(() {
      isLoading = true;
    });
    newPasswordFocusNode.unfocus();
    currentPasswordFocusNode.unfocus();
    confirmPasswordFocusNode.unfocus();
    try {
      await ref.watch(passwordResetProvider.notifier).resetPassword();

      await UserService.instance.signOut(context: context);

      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
        (route) => false,
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
              content: Text('You dont seem to have an account, please sign up'),
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
  }

  ///phone number variable holding the phone number used in the first step
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
          title: const Text('Reset Password'),
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
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Reset your password',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Create a new password to secure your account',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: blackLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomFormField(
                              isPassword: true,
                              controller: currentPasswordController,
                              focusNode: currentPasswordFocusNode,
                              hintText: 'Password',
                              labelText: 'Password',
                              onChanged: ref
                                  .watch(passwordResetProvider.notifier)
                                  .onCurrentPasswordChange,
                              validator: getPasswordErrorStringOrNull,
                            ),
                            const SizedBox(height: 16),
                            CustomFormField(
                              isPassword: true,
                              controller: newPasswordController,
                              focusNode: newPasswordFocusNode,
                              hintText: 'New Password',
                              labelText: 'New Password',
                              onChanged: ref
                                  .watch(passwordResetProvider.notifier)
                                  .onNewPasswordChange,
                              validator: getPasswordErrorStringOrNull,
                            ),
                            const SizedBox(height: 16),
                            CustomFormField(
                              isPassword: true,
                              controller: confirmPasswordController,
                              focusNode: confirmPasswordFocusNode,
                              hintText: 'Confirm Password',
                              labelText: 'Confirm Password',
                              validator: getConfirmPasswordErrorStringOrNull,
                              onChanged: ref
                                  .watch(passwordResetProvider.notifier)
                                  .onConfirmNewPasswordChange,
                            ),
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
                    Consumer(
                      builder: (context, ref, _) {
                        final phoneNumberNotifier =
                            ref.watch(passwordResetProvider);
                        final isValidCurrentPassword =
                            phoneNumberNotifier.currentPassword.isValid();
                        final isNewPasswordValidAndConfirmed = ref
                            .watch(passwordResetProvider.notifier)
                            .confirmPassword();

                        final isValid = isValidCurrentPassword &&
                            isNewPasswordValidAndConfirmed;
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isValid
                              ? ChatButton.primary(
                                  text: "Continue",
                                  onPressed: submit,
                                  isLoading: isLoading,
                                )
                              : ChatButton.outlined(
                                  text: "Continue",
                                  isTransparent: true,
                                  onPressed: () {
                                    setState(() {
                                      shouldValidate = true;
                                    });
                                    formKey.currentState!.validate();
                                  },
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? getConfirmPasswordErrorStringOrNull(String? passwordString) {
    final passwordValue = Password(passwordString ?? '').value;
    final isConfirmed =
        ref.watch(passwordResetProvider.notifier).confirmPassword();
    return passwordValue.fold(
      (l) => l.maybeMap(
        weakPassword: (_) =>
            "Password should include a character, number, symbol and at least 8 letters long",
        empty: (_) => "Password is required",
        orElse: () => '',
      ),
      (r) {
        if (isConfirmed) {
          return null;
        } else {
          return "Your new password and confirmed password dont match";
        }
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
