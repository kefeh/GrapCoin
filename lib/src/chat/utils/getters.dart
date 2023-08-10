import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/login/models/user.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

CollectionReference<Map<String, dynamic>> getChatRoomCollection(
  FirebaseFirestore db,
) {
  return db.collection('chat_rooms');
}

CollectionReference<Map<String, dynamic>> getMessageCollection(
  FirebaseFirestore db,
  String chatRoomUID,
) {
  final chatRoomCollection = getChatRoomCollection(db);
  return chatRoomCollection.doc(chatRoomUID).collection('messages');
}

DocumentReference<Map<String, dynamic>> getChatRoomDocRef(
  FirebaseFirestore db,
  String chatRoomUID,
) {
  final chatRoomCollection = getChatRoomCollection(db);
  final docRef = chatRoomCollection.doc(chatRoomUID);
  return docRef;
}

Map<String, dynamic> getChatRoomRecentMessageMap(Message message) {
  final messageJson = message.toFirestore();
  return {
    'recent_message': messageJson['content'],
    'recent_message_time': messageJson['at'],
    'recent_message_sender': messageJson['from'],
  };
}

Map<String, dynamic> getPinnedUpdateMap(Message message) {
  message = message.copyWith(
    pinnedAt: DateTime.now().toUtc(),
    pinned: !message.pinned,
  );
  final messageJson = message.toFirestore();
  return {
    'pinned': messageJson['pinned'],
    'pinned_at': messageJson['pinned_at'],
  };
}

Stream<List<Message>> getMessagesFromSnapshot(
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshot,
) {
  return snapshot.map(
    (event) => event.docs.map((e) => Message.fromFirestore(e, null)).toList(),
  );
}

Stream<List<ChatRoom>> getChatRoomFromSnapshot(
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshot,
) {
  final someChatRooms = <ChatRoom>[];
  final snapshotList = snapshot.map(
    (event) => event.docs.map((e) {
      final chatRoom = ChatRoom.fromFirestore(e, null);
      someChatRooms.add(chatRoom);
      return chatRoom;
    }).toList(),
  );
  return snapshotList;
}

ChatRoom getSignedInUserChatRoom(String name, String profileURL) {
  final user = firebase_auth.FirebaseAuth.instance.currentUser;
  final userUID = user!.uid;
  final chatRoom = ChatRoom(
    key: '',
    name: name,
    members: [userUID],
    profilePic: profileURL,
    createdAt: DateTime.now().toUtc(),
    recentMessageTime: DateTime.now().toUtc(),
    creatorUID: userUID,
  );

  return chatRoom;
}

Message getSignedInUserMessage(
  String content,
  String contentUrl,
  MessageEnum type,
) {
  final user = firebase_auth.FirebaseAuth.instance.currentUser;
  final userService = UserService.instance.currentUser;
  final userUID = user!.uid;
  final userName = userService!.nameToDisplay;
  final message = Message(
    key: '',
    content: content,
    from: userUID,
    at: DateTime.now().toUtc(),
    pinned: false,
    type: type,
    contentUrl: contentUrl,
    senderName: userName,
  );

  return message;
}

String getInitials(String name) {
  final nameList = name.split(' ');
  //in case neither the first name or last name are full
  if (nameList.isEmpty || nameList.every((element) => element.isEmpty)) {
    return 'JD';
  }
  if (nameList.length == 1) {
    return nameList.last.characters.first.toUpperCase();
  }
  return nameList.first.characters.first.toUpperCase() +
      nameList[1].characters.first.toUpperCase();
}

String getName(User user) {
  final currentUser = UserService.instance.currentUser;
  if (currentUser == null) return user.name;
  if (user.uid == currentUser.uid) return 'You';
  return user.nameToDisplay;
}
