import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';

class LeaveChatModalBottomSheet extends ConsumerWidget {
  const LeaveChatModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: white,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Are you sure you want to leave?',
                    style: TextStyle(
                      color: blackLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ChatButton.outlinedCaution(
                  text: 'Leave',
                  onPressed: () async {
                    final chatRoom = ref.watch(currentChatRoomProvider);
                    final user = FirebaseAuth.instance.currentUser;
                    await ref
                        .watch(firebaseChatRoomServiceProvider)
                        .removeMember(chatRoom!.key, user?.uid ?? '');

                    ref.watch(chatRoomProvider(chatRoom.key)).maybeWhen(
                      orElse: () {
                        // print('Error adding you to the chat room');
                        // TODO: add a snack bar
                      },
                      data: (snapshot) {
                        final chatRoom = ChatRoom.fromFirestore(snapshot, null);
                        ref.watch(currentChatRoomProvider.notifier).state =
                            chatRoom;
                      },
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ChatButton.secondary(
            text: 'Cancel',
            onPressed: Navigator.of(context).pop,
          )
        ],
      ),
    );
  }
}
