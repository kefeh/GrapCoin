import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/models/message_content_item.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/chat/services/firebase_chat_room_service.dart';
import 'package:grapcoin/src/login/models/user.dart';
import 'package:grapcoin/src/login/services/user_service.dart';
import 'package:logger/logger.dart';

/// Unimplemented upload to firebaseStorage
Future<String> uploadFile(PlatformFile? profileImageFile) async {
  // var fileBytes = profileImageFile.bytes!;
  // var fileName = profileImageFile.name;

  // // Upload file
  // final fileUrl = await FirebaseStorage.instance
  //     .ref('uploads/$fileName')
  //     .putData(fileBytes);

  // return fileUrl;
  return '';
}

bool isMyMessage(Message message) {
  final user = UserService.instance.currentUser;
  final validUser = user != null;
  final isMine = (user?.uid ?? '') == message.from;
  return validUser && isMine;
}

final chatRoomUIDProvider = StateProvider<String>((ref) => '');
final currentChatRoomProvider = StateProvider<ChatRoom?>((ref) => null);

///provides an instance of firebase firestore
///this is meant to be used with all services requiring it, sent to the
///constructor
///and thus preventing the creation of new instance for each one
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

///provides an access to the firebase chatroom service
final firebaseChatRoomServiceProvider =
    Provider<FirebaseChatRoomService>((ref) {
  return FirebaseChatRoomService(ref.watch(firebaseFirestoreProvider));
});

final chatRoomProvider =
    StreamProvider.family<DocumentSnapshot<Map<String, dynamic>>, String>(
        (ref, chatRoomID) {
  return ref.watch(firebaseChatRoomServiceProvider).getChatRoomByID(chatRoomID);
});

final userListProvider =
    FutureProvider.family<List<User>, List<String>>((ref, members) async {
  final userService = UserService.instance;
  final currentUser = userService.currentUser;
  final userList = <User>[];
  for (final member in members) {
    if (member != (currentUser?.uid ?? '')) {
      final someuser = await userService.get(member);
      userList.add(someuser);
    }
  }
  userList.add(currentUser!);
  return userList.toList();
});

/// If the requested userID's data is not in 'cache' we fetch it and put in
/// cache for future use and then return the fetched user data, else we return
///  the results from cache. AutoDispose when no longer needed.
final userProvider = FutureProvider.autoDispose.family<User, String>(
  (ref, userID) async {
    var user = ref.watch(chatRoomMembersProvider.notifier).getUser(userID);
    if (user == null) {
      user = await UserService.instance.get(userID);
      await ref
          .watch(chatRoomMembersProvider.notifier)
          .setMembersInfo(userID, user);
    }
    return user;
  },
);
final colorProvider = StateProvider.family<Color, String>(
  (ref, userID) {
    final chatRoom = ref.watch(currentChatRoomProvider);
    final members = chatRoom?.members ?? [];
    var index = members.indexOf(userID);
    index = index % Colors.primaries.length;
    return Colors.primaries[index];
  },
);

final chatRoomPageIndex = StateProvider((ref) => 0);

final currentUserProvider = StateProvider<auth.User?>(
  (ref) => null,
);

///logger used to display errors, warnings, etc...
final logger = Logger();
final messageContentItemProvider = StateProvider<MessageContentItem>(
  (ref) => MessageContentItem.init(),
);

final uploadTaskProvider =
    StateProvider.autoDispose<UploadTask?>((ref) => null);

UploadTask uploadeFileTask(PlatformFile file, String chatroomID, String type) {
  final name = kIsWeb
      ? file.name.replaceAll(' ', '_')
      : Uri.file(file.path!).pathSegments.last;
  return FirebaseStorage.instance
      .ref('')
      .child('$type/$chatroomID/$name')
      .putData(file.bytes!);
}

Future<PlatformFile?> getFileFromType(MessageEnum type) async {
  FilePickerResult? pickedFile;
  if (type == MessageEnum.image) {
    final pickedFiles = kIsWeb
        ? await FilePicker.platform.pickFiles(type: FileType.image)
        : await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['jpeg', 'jpg', 'png'],
            withData: true,
          );
    pickedFile = pickedFiles;
  }
  if (type == MessageEnum.video) {
    pickedFile = await FilePicker.platform.pickFiles(type: FileType.video);
  }

  if (pickedFile != null) {
    return pickedFile.files.first;
  }
  return null;
}

/// statenotifier to serve as temporary cache for all members of a particular
/// chatroom, holds the accessory functions for manipulating the state
class ChatRoomMembersNotifier extends StateNotifier<Map<String, User>> {
  ChatRoomMembersNotifier(super.state);

  /// adds a new member to the state
  Future<void> setMembersInfo(String memberID, User user) async {
    final newState = state;
    newState[memberID] = user;
    state = newState;
  }

  /// return a particular user from ID
  User? getUser(String memberID) {
    return state[memberID];
  }
}

/// provides the chat room members data to the userProvider,  disposed when no
/// longer needed so as to be refreshed for a new chatroom
final chatRoomMembersProvider = StateNotifierProvider.autoDispose<
    ChatRoomMembersNotifier, Map<String, User>>(
  (ref) => ChatRoomMembersNotifier({}),
);
