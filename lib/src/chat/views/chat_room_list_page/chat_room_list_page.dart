import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/routes/main_menu.dart';
import 'package:grapcoin/src/chat/views/chat_room_list_page/widgets/chat_room_list_tile.dart';

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
            data: (chatRooms) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ChatRoomListTile(
                  key: Key(chatRooms[index].key + chatRooms[index].name),
                  chatRoom: chatRooms[index],
                ),
                childCount: chatRooms.length,
              ),
            ),
            error: (error, stack) {
              return const ErrorChatRoomSliver();
            },
            loading: () => const SliverFillRemaining(
              key: ValueKey('circular_progress_indicator'),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorChatRoomSliver extends StatelessWidget {
  const ErrorChatRoomSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: const Text(
          'oh no no',
          style: TextStyle(
            color: red,
          ),
        ),
      ),
    );
  }
}
