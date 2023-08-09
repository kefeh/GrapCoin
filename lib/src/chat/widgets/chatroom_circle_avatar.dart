import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatRoomCircleAvatar extends StatelessWidget {
  const ChatRoomCircleAvatar({
    super.key,
    this.radius = 20,
    required this.chatRoomName,
  });

  final String chatRoomName;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: purple,
      radius: radius,
      child: Text(
        getInitials(chatRoomName),
        style: TextStyle(
          color: white,
          fontSize: 12 * (radius / 20),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
