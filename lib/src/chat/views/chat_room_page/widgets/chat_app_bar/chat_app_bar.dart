import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/views/chat_settings_page/chat_settings_page.dart';
import 'package:grapcoin/src/chat/widgets/chatroom_circle_avatar.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatAppBar extends ConsumerWidget {
  const ChatAppBar({
    super.key,
    this.hideProfileAvatar = false,
    required this.chatRoom,
    this.hideCallButton = false,
  });

  ///name of the group we're in
  ///needed to be displayed in the app bar
  final ChatRoom chatRoom;

  final bool hideProfileAvatar;

  ///hides the call button, for pages like page settings
  final bool hideCallButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: ColoredBox(
        color: white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: BackButton(
                      onPressed: Navigator.of(context).pop,
                    ),
                  ),
                  Expanded(
                    child: hideProfileAvatar
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChatSettingsPage(chatRoom: chatRoom),
                                ),
                              );
                            },
                            child: Hero(
                              tag: chatRoom.key + chatRoom.name,
                              child: SizedBox(
                                height: 80,
                                child: Row(
                                  children: [
                                    ChatRoomCircleAvatar(
                                        chatRoomName: chatRoom.name),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(
                                          Characters(chatRoom.name)
                                              .replaceAll(
                                                Characters(''),
                                                Characters('\u{200B}'),
                                              )
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          // overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: const TextStyle(
                                            color: black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
