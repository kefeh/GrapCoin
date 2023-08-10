import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/views/chat_room_settings_page/general_settings_page.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/core/widgets/custom_form_fields.dart';
import 'package:grapcoin/src/login/helpers/providers.dart';
import 'package:grapcoin/src/login/models/authentication_state.dart';
import 'package:grapcoin/src/login/models/email_address.dart';
import 'package:grapcoin/src/login/models/name.dart';
import 'package:grapcoin/src/login/models/password.dart';
import 'package:grapcoin/src/login/models/user.dart' as model;
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersonalInfoUpdatePage extends ConsumerStatefulWidget {
  const PersonalInfoUpdatePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends ConsumerState<PersonalInfoUpdatePage> {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  bool shouldValidate = false;
  bool isLoading = false;
  bool userExists = false;
  model.User? user;

  @override
  void initState() {
    user = UserService.instance.currentUser;
    nameController = TextEditingController(text: user?.nameToDisplay);
    emailController = TextEditingController(text: user?.email);
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();

    Future.microtask(() {
      ref
          .read(phoneAuthProvider.notifier)
          .onNameChange(user?.nameToDisplay ?? '');
      ref.read(phoneAuthProvider.notifier).onEmailChange(user?.email ?? '');
      ref.read(authServiceProvider).authState.listen(
        (event) {
          event.maybeMap(
            orElse: () {
              setState(() {
                isLoading = false;
              });
            },
            connected: (_) {
              setState(() {
                isLoading = false;
              });
              Navigator.pop(context);
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
    ref.read(phoneAuthProvider.notifier).dispose();
    super.dispose();
  }

  void update() async {
    setState(() {
      shouldValidate = true;
    });
    final phoneAuthState = ref.watch(phoneAuthProvider);
    final user = UserService.instance.currentUser;
    if (user == null) return;

    userExists = await UserService.instance
        .existsWithUsername(phoneAuthState.name.getOrEmpty());
    if (userExists) return;

    await ref.watch(authServiceProvider).updateUserData(
          user.uid,
          phoneAuthState.name.getOrEmpty(),
          phoneAuthState.email.getOrEmpty(),
        );
  }

  submit() {
    emailFocusNode.unfocus();
    nameFocusNode.unfocus();
    return update();
  }

  @override
  Widget build(BuildContext context) {
    const buttonText = 'Update';
    final someUser = FirebaseAuth.instance.currentUser;

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
          title: const Text('Personal Information'),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: purple,
                      backgroundImage: someUser?.photoURL == null
                          ? null
                          : NetworkImage(someUser!.photoURL ?? ''),
                      child: someUser?.photoURL == null
                          ? DisplayName(name: user?.nameToDisplay ?? '')
                          : Image.network(
                              someUser!.photoURL!,
                              fit: BoxFit.fitWidth,
                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) =>
                                  DisplayName(
                                name: user?.nameToDisplay ?? '',
                              ),
                            ),
                    ),
                  ),
                ),
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
                              readOnly: true,
                              onChanged: ref
                                  .watch(phoneAuthProvider.notifier)
                                  .onEmailChange,
                              validator: getEmailErrorStringOrNull,
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
                            ref.watch(phoneAuthProvider);
                        final isNameValid = phoneNumberNotifier.name.isValid();
                        final notSameName =
                            UserService.instance.currentUser?.nameToDisplay !=
                                phoneNumberNotifier.name.getOrEmpty();

                        final isValid = isNameValid && notSameName;
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
