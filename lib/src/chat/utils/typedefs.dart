import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/utils/firebase_failure.dart';

/// global type for a future for Either failure or unit
typedef FailureOrUnit = Future<Either<FirebaseFailure, Unit>>;

/// global type for the query snapshot stream map
typedef QuerySnapShotStream = Stream<QuerySnapshot<Map<String, dynamic>>>;

/// global type for the document snapshot stream map
typedef DocumentSnapShotStream = Stream<DocumentSnapshot<Map<String, dynamic>>>;

///global type for a future for either some or none in fpdart
typedef FpSomeOrNone = Future<Either<FirebaseFailure, Unit>>;

typedef FailureOrChatRoomStream
    = Either<FirebaseFailure, Stream<List<ChatRoom>>>;

///map<string, dynamic> typedef that is used for casting firebase document
///snapshots when needed
typedef Json = Map<String, dynamic>;
