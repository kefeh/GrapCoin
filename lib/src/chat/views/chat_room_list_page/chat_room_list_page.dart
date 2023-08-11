import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/widgets/chat_room_list_tile.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';

class ChatRoomList extends ConsumerWidget {
  const ChatRoomList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRooms = ref.watch(chatRoomListStreamProvider);
    return Center(
      child: CustomScrollView(
        slivers: [
          // const ChatRoomAppBar(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          chatRooms.when(
            data: (chatRooms) {
              if (chatRooms.isEmpty) {
                return const SliverFillRemaining(
                  key: ValueKey('Empty List'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message_rounded,
                        size: 70,
                        color: red,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "You have not joined any chat yet, click the groups icon on the bottom to join",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: red),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ChatRoomListTile(
                      key: Key(chatRooms[index].key + chatRooms[index].name),
                      chatRoom: chatRooms[index],
                    ),
                    childCount: chatRooms.length,
                  ),
                );
              }
            },
            error: (error, stack) {
              return const ErrorChatRoomSliver();
            },
            loading: () => const SliverFillRemaining(
              key: ValueKey('circular_progress_indicator'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(color: purpleLighter),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorChatRoomSliver extends ConsumerWidget {
  const ErrorChatRoomSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverFillRemaining(
      child: Column(
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
      ),
    );
  }
}
