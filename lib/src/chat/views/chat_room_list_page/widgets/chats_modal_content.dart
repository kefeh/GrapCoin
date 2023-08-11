import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/add_chat_room_notifier.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/widgets/chat_room_list_tile.dart';
import 'package:grapcoin/src/chat/widgets/add_chat_room_dialog.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/models/user.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class ChatsModalContent extends ConsumerStatefulWidget {
  const ChatsModalContent({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatsModalContent> createState() => _ChatsModalContentState();
}

class _ChatsModalContentState extends ConsumerState<ChatsModalContent> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final chatRooms = ref.watch(allChatRoomListStreamProvider);
    final User user = UserService.instance.currentUser!;
    return chatRooms.when(
      data: (chatRooms) {
        return Column(
          children: [
            const Text(
              'Start New Chat',
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ChatRoomListTile(
                  key: Key(chatRooms[index].key + chatRooms[index].name),
                  chatRoom: chatRooms[index],
                  dense: true,
                  popBeforeNavigate: true,
                ),
                itemCount: chatRooms.length,
              ),
            ),
            if (user.email == 'admin@grapcoin.com')
              ChatButton.primary(
                  text: 'create chat group',
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AddRoomDialog(
                          hintText: 'Type group subject here ...',
                          isLoading: ref.watch(
                            addChatRoomProvider.select(
                              (value) => value.isLoading,
                            ),
                          ),
                          onChanged: ref
                              .watch(
                                addChatRoomProvider.notifier,
                              )
                              .getName,
                          onPressed: (_) {
                            ref
                                .watch(
                                  addChatRoomProvider.notifier,
                                )
                                .addChatRoom();
                          },
                        );
                      },
                    );
                  }),
          ],
        );
      },
      error: (error, stack) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 80,
              color: red,
            ),
            const Text(
              'Could not load chatrooms',
              style: TextStyle(
                color: red,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 80,
              child: ChatButton.primary(
                text: "Reload",
                onPressed: () {
                  final _ = ref.refresh(chatRoomListStreamProvider);
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(color: purpleLighter),
          ),
        ],
      ),
    );
  }
}
