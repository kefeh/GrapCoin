import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/add_chat_room_notifier.dart';
import 'package:grapcoin/src/chat/widgets/add_chat_room_dialog.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';

class ChatRoomAppBar extends ConsumerWidget {
  const ChatRoomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      collapsedHeight: 100,
      expandedHeight: 100,
      flexibleSpace: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ChatButton.primary(
            text: 'Create a Group',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddRoomDialog(
                    hintText: 'Type group subject here ...',
                    onChanged: ref.watch(addChatRoomProvider.notifier).getName,
                    onPressed: (_) {
                      ref.watch(addChatRoomProvider.notifier).addChatRoom();
                    },
                    isLoading: ref.watch(
                      addChatRoomProvider.select((value) => value.isLoading),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
