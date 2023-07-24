import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:grapcoin/src/login/models/user.dart';
import 'package:grapcoin/src/util/helpers.dart';
import 'package:grapcoin/src/util/typedefs.dart';

class UserService {
  static final UserService instance = UserService();

  final users = FirebaseFirestore.instance.collection('users');

  // final realtimeDbUsers = FirebaseDatabase.instance.ref('users');

  User? currentUser;

  User toUser(DocumentSnapshot ref) {
    return User.fromJson(ref.data() as Json).copyWith(uid: ref.id);
  }

  bool newUser = false;

  ///checks whether authentication user exists based on the provided [uid]
  Future<bool> exists(String uid) async {
    return (await users.doc(uid).get()).exists;
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

  // static Future<void> addUserNotificationData({String? freshToken}) async {
  //   try {
  //     final user = UserService.instance.currentUser;
  //     if (user != null) {
  //       //generating and setting up the token
  //       final token =
  //           freshToken ?? await FirebaseNotificationService.getToken();

  //       if (token?.isNotEmpty ?? false) {
  //         final docRef =
  //             FirebaseFirestore.instance.collection('fcm_tokens').doc(token);
  //         final doc = await docRef.get();

  //         if (!doc.exists) {
  //           // create the entry
  //           await docRef.set({
  //             'user_id': user.uid,
  //             'name': user.userNameSensitiveCase ?? user.name,
  //           });
  //         }
  //       } else {
  //         debugPrint('Failed to generate the token');
  //       }
  //     }
  //   } catch (e, stk) {
  //     logger
  //       ..d('An error occured while setting up the fcm token')
  //       ..d(e)
  //       ..d(stk);
  //   }
  // }

  Future<User> add(
      String userId, String displayName, String phoneNumber) async {
    final user = User(
      uid: userId,
      name: displayName.toLowerCase(),
      userNameSensitiveCase: displayName,
      registeredAt: DateTime.now(),
      phoneNumber: phoneNumber,
    );
    await users.doc(user.uid).set(user.toJson());
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
