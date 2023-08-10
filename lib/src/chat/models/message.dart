// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/util/json_converters.dart';
part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    @Default('') String key,
    required String content,
    @JsonKey(name: 'content_url') @Default('') String contentUrl,
    required String from,
    @JsonKey(name: 'sender_name') required String? senderName,
    @JsonKey(fromJson: fromJsonDateTime, toJson: toJsonDateTime)
    required DateTime at,
    @JsonKey(
      name: 'pinned_at',
      fromJson: fromJsonDateTimeNullable,
      toJson: toJsonDateTimeNullable,
    )
    DateTime? pinnedAt,
    required bool pinned,
    @Default(MessageEnum.text) MessageEnum type,
  }) = _Message;
  const Message._();

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  factory Message.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? _,
  ) {
    final messageSnapshotJson = snapshot.data();
    final messageObject =
        Message.fromJson(messageSnapshotJson!).copyWith(key: snapshot.id);
    return messageObject;
  }

  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
