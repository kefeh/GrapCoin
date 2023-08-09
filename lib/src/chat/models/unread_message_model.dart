import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_message_model.freezed.dart';

@freezed
class UnreadMessageModel with _$UnreadMessageModel {
  factory UnreadMessageModel({
    required int userLastSeenMessageTime,
    required bool read,
    required int lastMessageTime,
    required int unreadMessageCount,
  }) = _UnreadMessageModel;
}
