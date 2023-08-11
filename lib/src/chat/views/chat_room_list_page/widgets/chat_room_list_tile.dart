import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/utils/date_formatter.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/chat_room_page.dart';
import 'package:grapcoin/src/chat/widgets/chatroom_circle_avatar.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatRoomListTile extends ConsumerWidget {
  const ChatRoomListTile({
    super.key,
    this.dense = false,
    this.popBeforeNavigate = false,
    required this.chatRoom,
  });

  final ChatRoom chatRoom;
  final bool dense;
  final bool popBeforeNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentMessageTime = getRecentMessageTime(chatRoom);

    final chatRoomRecentMessage = getRecentMessage(chatRoom);

    return Hero(
      tag: chatRoom.key + chatRoom.name,
      child: GestureDetector(
        onTap: () {
          // ref.watch(currentChatRoomProvider.notifier).state = chatRoom;
          if (popBeforeNavigate) Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatRoomPage(
                chatRoomID: chatRoom.key,
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dense ? 0 : 16,
              vertical: dense ? 8 : 12,
            ),
            child: Row(
              children: [
                ChatRoomCircleAvatar(
                  chatRoomName: chatRoom.name,
                  radius: dense ? 15 : 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              Characters(chatRoom.name)
                                  .replaceAll(
                                    Characters(''),
                                    Characters('\u{200B}'),
                                  )
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          dense
                              ? const Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: purpleLight,
                                  size: 18,
                                )
                              : Text(
                                  recentMessageTime,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(136, 136, 136, 1),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ],
                      ),
                      if (!dense)
                        SizedBox(
                          height: 28,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  Characters(chatRoomRecentMessage).toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    height: 1.5,
                                    color: blackLight,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getRecentMessageTime(ChatRoom chatRoom) {
  final recentMessageDateTime = chatRoom.recentMessageTime == null
      ? chatRoom.createdAt
      : chatRoom.recentMessageTime!;
  final recentMessageTime = DateFormatter().getVerboseDateTimeRepresentation(
    recentMessageDateTime,
  );
  return recentMessageTime;
}

String getRecentMessage(ChatRoom chatRoom) {
  final chatRoomRecentMessage = chatRoom.recentMessage.isNotEmpty
      ? chatRoom.recentMessage
      : 'No messages yet';
  return chatRoomRecentMessage;
}
