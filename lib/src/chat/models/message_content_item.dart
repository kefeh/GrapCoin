import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
part 'message_content_item.freezed.dart';

@freezed
class MessageContentItem with _$MessageContentItem {
  const factory MessageContentItem({
    File? contentFile,
    required MessageEnum type,
    required String contentUrl,
  }) = _MessageContentItem;
  const MessageContentItem._();

  factory MessageContentItem.init() => const MessageContentItem(
        type: MessageEnum.text,
        contentUrl: '',
      );
}
