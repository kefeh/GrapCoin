import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/services/firebase_chat_room_service.dart';
import 'package:grapcoin/src/chat/utils/firebase_failure.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/utils/typedefs.dart';

/// Provides the message service
final firebaseMessageServiceProvider = Provider(
  (ref) => FirebaseMessageService(
    FirebaseFirestore.instance,
    ref.read(firebaseChatRoomServiceProvider),
  ),
);

/// Firebase service for handling all requests to the messages collection
class FirebaseMessageService {
  /// initialises the service
  FirebaseMessageService(this.db, this.chatRoomService);

  /// the firebasefirestore instance
  final FirebaseFirestore db;

  /// instance of the chatRoomService
  final FirebaseChatRoomService chatRoomService;

  /// adds a new message and updates the chatroom's recent message
  FailureOrUnit add(Message message, String chatRoomUID) async {
    // final message = getSignedInUserMessage(content);

    final messageCollection = getMessageCollection(db, chatRoomUID);
    try {
      await messageCollection
          .withConverter(
            fromFirestore: Message.fromFirestore,
            toFirestore: (Message message, options) => message.toFirestore(),
          )
          .doc()
          .set(message);

      /// update chatRoom recent messages
      await chatRoomService.updateRecentMessages(chatRoomUID, message);

      return right(unit);
    } catch (error) {
      return left(FirebaseFailure.add(error.toString()));
    }
  }

  FailureOrUnit changeMessagePinStatus(
    String chatRoomID,
    Message message,
  ) async {
    final docRef = getMessageCollection(db, chatRoomID).doc(message.key);
    final pinnedUpdateJson = getPinnedUpdateMap(message);
    try {
      await docRef.update(pinnedUpdateJson);

      return right(unit);
    } catch (error) {
      return left(FirebaseFailure.add(error.toString()));
    }
  }

  FailureOrUnit deleteMessage(
    String chatRoomID,
    Message message,
  ) async {
    final docRef = getMessageCollection(db, chatRoomID).doc(message.key);
    try {
      await docRef.delete();

      return right(unit);
    } catch (error) {
      return left(FirebaseFailure.add(error.toString()));
    }
  }

  /// gets the snapshot for all messages for listening for changes
  Either<FirebaseFailure, QuerySnapShotStream> getAllSnapshots(
    String chatRoomUID,
  ) {
    final docRef = getMessageCollection(db, chatRoomUID).orderBy('at');
    try {
      return right(docRef.snapshots());
    } catch (error) {
      return left(FirebaseFailure.snapshot(error.toString()));
    }
  }

  /// gets all messages for the chatroom as a stream
  Stream<List<Message>> getMessageStream(
    String chatRoomID,
  ) {
    final docSnapshot =
        getMessageCollection(db, chatRoomID).orderBy('at').snapshots();
    final streamMessages = getMessagesFromSnapshot(docSnapshot);

    return streamMessages;
  }

  /// gets all messages for the chatroom as a stream
  Stream<List<Message>> getPinnedMessageStream(
    String chatRoomID,
  ) {
    final docSnapshot = getMessageCollection(db, chatRoomID)
        .where('pinned', isEqualTo: true)
        .orderBy('pinned_at')
        .snapshots();
    final streamMessages = getMessagesFromSnapshot(docSnapshot);

    return streamMessages;
  }
}
