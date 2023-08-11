import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/login/models/user.dart';
import 'package:grapcoin/src/util/helpers.dart';
import 'package:grapcoin/src/util/typedefs.dart';

class UserService {
  static final UserService instance = UserService();

  final users = FirebaseFirestore.instance.collection('users');

  final realtimeDbUsers = FirebaseDatabase.instance.ref('users');

  User? currentUser;

  User toUser(DocumentSnapshot ref) {
    return User.fromJson(ref.data() as Json).copyWith(uid: ref.id);
  }

  bool newUser = false;

  ///checks whether authentication user exists based on the provided [uid]
  Future<bool> exists(String uid) async {
    return (await users.doc(uid).get()).exists;
  }

  ///Delete a user that exists based on the provided [uid]
  Future<void> deleteCurrentUserAccount() async {
    final user = auth.FirebaseAuth.instance.currentUser;
    await users.doc(user!.uid).delete();
    await auth.FirebaseAuth.instance.currentUser!.delete();
    currentUser = null;
  }

  ///checks whether [username] exists or not based on the returned count
  Future<bool> existsWithUsername(String username) async {
    //user name is now case sensitive so we need to check with lower case
    return (await users
                .where('name', isEqualTo: username.toLowerCase())
                .count()
                .get())
            .count >=
        1;
  }

  Future<User?> tryGet(String uid) async {
    final snapshot = await users.doc(uid).get();
    if (!snapshot.exists) {
      return null;
    }
    return User.fromJson(snapshot.data() as Json);
  }

  Future<User> get(String uid) async {
    final snapshot = await users.doc(uid).get();
    return User.fromJson(snapshot.data() as Json);
  }

  Future<bool> userExistsInDb(auth.User auth) async {
    final userRef = await users.doc(auth.uid).get();
    return userRef.exists;
  }

  Future<User?> logIn(auth.User auth) async {
    final userRef = await users.doc(auth.uid).get();
    User user;
    if (!userRef.exists) {
      return null;
    } else {
      user = toUser(userRef);
    }
    currentUser = user;

    return user;
  }

  Future<User> add(
    String userId,
    String displayName,
    String email, {
    bool isUpdate = false,
  }) async {
    final user = User(
      uid: userId,
      name: displayName.toLowerCase(),
      userNameSensitiveCase: displayName,
      registeredAt: (isUpdate && currentUser != null)
          ? currentUser!.registeredAt
          : DateTime.now(),
      email: email,
    );
    await users.doc(user.uid).set(user.toJson());

    await logIn(auth.FirebaseAuth.instance.currentUser!);
    return user;
  }

  Future<void> signOut({required BuildContext context}) async {
    try {
      await auth.FirebaseAuth.instance.signOut();
      currentUser = null;
    } catch (e, stk) {
      ScaffoldMessenger.of(context).showSnackBar(
        // Authentication.customSnackBar(
        //   content: 'Error signing out. Try again.',
        // ),
        const SnackBar(content: Text('Error signing out. Try again.')),
      );
      logger
        ..e(e)
        ..e(stk);
    }
  }
}
