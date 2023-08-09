// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/util/json_converters.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    required String key,
    required String name,
    @Default([]) List<String> members,
    @JsonKey(name: 'muted_members') @Default([]) List<String> mutedMembers,
    @JsonKey(name: 'profile_pic') @Default('') String profilePic,
    @JsonKey(
        fromJson: fromJsonDateTime, toJson: toJsonDateTime, name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'creator_uid') required String creatorUID,
    @JsonKey(name: 'recent_message') @Default('') String recentMessage,
    @JsonKey(
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable,
      name: 'recent_message_time',
    )
    DateTime? recentMessageTime,
    @JsonKey(name: 'recent_message_sender')
    @Default('')
    String recentMessageSender,
    String? activeCallId,
  }) = _ChatRoom;
  const ChatRoom._();

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  factory ChatRoom.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final chatRoomSnapshotJson = snapshot.data();
    final chatRoomObject =
        ChatRoom.fromJson(chatRoomSnapshotJson!).copyWith(key: snapshot.id);
    return chatRoomObject.copyWith(
      recentMessageTime:
          chatRoomObject.recentMessageTime ?? chatRoomObject.createdAt,
    );
  }

  bool get inCalling => activeCallId != null;

  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
