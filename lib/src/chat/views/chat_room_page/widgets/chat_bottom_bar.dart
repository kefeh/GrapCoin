import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_form_field.dart';

class ChatBottomBar extends ConsumerWidget {
  const ChatBottomBar({
    super.key,
    required this.chatRoom,
  });
  final ChatRoom chatRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: ChatFormField(chatroomID: chatRoom.key),
    );
  }
}
