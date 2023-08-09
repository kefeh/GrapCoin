import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/utils/firebase_failure.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/utils/typedefs.dart';

///provides a stream provider for the currently used chat room
///to monitor changes such as whether there is an ongoing call or not
final realTimeCurrentChatRoomProvider =
    StreamProvider.autoDispose.family<ChatRoom?, String>((ref, chatRoomId) {
  return ref
      .read(firebaseChatRoomServiceProvider)
      .streamChatRoom(groupId: chatRoomId)
      .getOrElse(() => Stream<ChatRoom?>.error(Null));
});

/// Firebase service for handling all requests to the chatroom collection
class FirebaseChatRoomService {
  /// initialise the service
  FirebaseChatRoomService(this.db);

  /// the firebasefirestore instance
  final FirebaseFirestore db;

  ///chat room collection reference
  final chatRoomCollection =
      FirebaseFirestore.instance.collection('chat_rooms');

  /// used to add a new chatroom
  FailureOrUnit add(String name, PlatformFile? profileImageFile) async {
    final profileUrl = await uploadFile(profileImageFile);

    final chatRoom = getSignedInUserChatRoom(name, profileUrl);

    final chatRoomCollection = getChatRoomCollection(db);
    try {
      await chatRoomCollection
          .withConverter(
            fromFirestore: ChatRoom.fromFirestore,
            toFirestore: (ChatRoom chatRoom, options) => chatRoom.toFirestore(),
          )
          .doc()
          .set(chatRoom);
      return right(unit);
    } catch (error) {
      final errorString = error.toString();
      return left(FirebaseFailure.add(errorString));
    }
  }

  /// removes  a chatroom given the chatroom id. We want to delete a chatroom
  /// when the initiator owns or created the chatRoom else remove yourself from
  ///  the group
  FailureOrUnit remove(String chatRoomUID, String userUID) async {
    final docRef = getChatRoomDocRef(db, chatRoomUID);
    ChatRoom? chatRoom;
    var fail = false;
    try {
      final listener = docRef.snapshots().listen((event) async {
        chatRoom = ChatRoom.fromFirestore(event, null);
        if (chatRoom == null) {
          fail = true;
        }

        await _handleDelete(chatRoom!, userUID);
      });

      await listener.cancel();
      if (fail) {
        return left(const FirebaseFailure.delete('Chatroom does not exist'));
      }
      return right(unit);
    } catch (error) {
      final errorString = error.toString();
      return left(FirebaseFailure.delete(errorString));
    }
  }

  Future<void> _handleDelete(ChatRoom chatRoom, String userUID) async {
    final docRef = getChatRoomDocRef(db, chatRoom.key);
    if (chatRoom.creatorUID == userUID) {
      await docRef.delete();
    } else {
      await removeMember(chatRoom.key, userUID);
    }
  }

  /// used when a message is created to update the chatroom's recent message
  FailureOrUnit updateRecentMessages(
    String chatRoomUID,
    Message message,
  ) async {
    final docRef = getChatRoomDocRef(db, chatRoomUID);
    final recentMessageMap = getChatRoomRecentMessageMap(message);

    try {
      await docRef.update(recentMessageMap);

      return right(unit);
    } catch (error) {
      return left(FirebaseFailure.add(error.toString()));
    }
  }

  /// adds a member to the chatroom
  Future<void> addMember(String chatRoomUID, String userUID) async {
    await getChatRoomDocRef(db, chatRoomUID).update({
      'members': FieldValue.arrayUnion([userUID]),
    });
  }

  /// removes a member
  Future<void> removeMember(String chatRoomUID, String userUID) async {
    await getChatRoomDocRef(db, chatRoomUID).update({
      'members': FieldValue.arrayRemove([userUID]),
    });
  }

  /// adds a member to the chatroom muted list, aka they won't receive
  /// notifications
  Future<void> muteMemberNotification(
    String chatRoomUID,
    String userUID,
  ) async {
    await getChatRoomDocRef(db, chatRoomUID).update({
      'muted_members': FieldValue.arrayUnion([userUID]),
    });
  }

  /// removes a member from the chatroom muted list, aka they won't receive
  /// notifications
  Future<void> unmuteMemberNotification(
    String chatRoomUID,
    String userUID,
  ) async {
    await getChatRoomDocRef(db, chatRoomUID).update({
      'muted_members': FieldValue.arrayRemove([userUID]),
    });
  }

  /// get the snapshot for all chatRooms possibly to use for listening for changes
  Either<FirebaseFailure, QuerySnapShotStream> getAllSnapshots() {
    final chatRoomCollection =
        getChatRoomCollection(db).orderBy('created_at', descending: true);

    try {
      return right(chatRoomCollection.snapshots());
    } catch (error) {
      return left(FirebaseFailure.snapshot(error.toString()));
    }
  }

  /// get the snapshot for all chatRooms possibly to use for listening for changes
  // FailureOrChatRoomStream getAllChatRoomStream() {
  Stream<List<ChatRoom>> getAllChatRoomStream(String userID) {
    // final chatRooms = <ChatRoom>[];

    // for (int i = 1; i < 10; i++) {
    //   final data = ChatRoom(
    //     createdAt: DateTime.now(),
    //     creatorUID: '',
    //     key: '$i key',
    //     name: '$i name',
    //   );
    //   chatRooms.add(data);
    // }
    // return Stream.value(chatRooms);
    return getChatRoomCollection(db)
        // .where('members', arrayContains: userID)
        .orderBy('recent_message_time', descending: true)
        .snapshots()
        .map(
      (event) {
        final chatRooms = <ChatRoom>[];

        for (final doc in event.docs) {
          final data = ChatRoom.fromFirestore(doc, null);
          chatRooms.add(data);
        }
        return chatRooms;
      },
    );
  }

  /// returning snapshots for chatRooms for a specific user because we want to
  /// notify for changes in recent messages
  Either<FirebaseFailure, QuerySnapShotStream> getChatRoomsForUser(
    String userID,
  ) {
    final chatRoomCollection = getChatRoomCollection(db);

    try {
      final chatRoomsSnapShot = chatRoomCollection
          .where('members', arrayContains: userID)
          .orderBy('recent_message_time')
          .snapshots();
      return right(chatRoomsSnapShot);
    } catch (error) {
      return left(FirebaseFailure.snapshot(error.toString()));
    }
  }

  ///returns stream for so that we can observe changes for the call
  Either<FirebaseFailure, Stream<ChatRoom?>> streamChatRoom({
    required String groupId,
  }) {
    try {
      return right(
        chatRoomCollection
            .withConverter(
              fromFirestore: ChatRoom.fromFirestore,
              toFirestore: (ChatRoom chatRoom, options) =>
                  chatRoom.toFirestore(),
            )
            .doc(groupId)
            .snapshots()
            .map(
              (event) => event.data(),
            ),
      );
    } catch (e) {
      return left(FirebaseFailure.snapshot(e.toString()));
    }
  }

  ///returns chatroom stream
  ///throws an error if the stream is empty
  Stream<DocumentSnapshot<Map<String, dynamic>>> getChatRoomByID(
    String chatRoomID,
  ) async* {
    //sometimes some chat rooms aren't available
    //for example when the wrong chat room id is passed from a deep link
    final chatRoomDocRef =
        getChatRoomCollection(db).doc(chatRoomID).snapshots();
    final docExists = await chatRoomDocRef.first;
    if (docExists.exists) {
      yield docExists;
      yield* chatRoomDocRef;
    } else {
      throw Exception('Document');
    }
  }

  // mapChatRooms(Stream<QuerySnapshot<Map<String, dynamic>>> snapshotStream) {
  //   final chatrooms = [];
  //   snapshotStream.listen((event) {
  //     for (var chatroom in event.docs) {
  //       chatrooms.add(chatroom);
  //     }
  //   });
  //   return chatrooms;
  // }
}
