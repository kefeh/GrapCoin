import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_form_field.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/join_chat.dart';

class ChatBottomBar extends ConsumerWidget {
  const ChatBottomBar({
    super.key,
    required this.chatRoom,
  });
  final bool isVisible = true;
  final ChatRoom chatRoom;

  bool showJoin() {
    final user = FirebaseAuth.instance.currentUser;
    if (chatRoom.members.contains(user?.uid ?? '')) return false;
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      child: showJoin()
          ? JoinChat(
              chatRoomID: chatRoom.key,
            )
          : ChatFormField(
              chatroomID: chatRoom.key,
            ),
    );
  }
}
