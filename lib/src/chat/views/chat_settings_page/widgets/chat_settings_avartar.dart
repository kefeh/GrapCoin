import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/widgets/chatroom_circle_avatar.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatSettingsAvatar extends StatelessWidget {
  const ChatSettingsAvatar({
    super.key,
    required this.chatID,
    required this.chatName,
  });

  final String chatID;
  final String chatName;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: chatID + chatName,
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChatRoomCircleAvatar(radius: 50, chatRoomName: chatName),
            Text(
              chatName,
              style: const TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Participants',
              style: TextStyle(
                color: black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
