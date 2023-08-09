import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/constants/colors.dart';

class JoinChat extends ConsumerStatefulWidget {
  const JoinChat({
    super.key,
    required this.chatRoomID,
  });

  final String chatRoomID;

  @override
  ConsumerState<JoinChat> createState() => _JoinChatState();
}

class _JoinChatState extends ConsumerState<JoinChat> {
  bool isSubmitting = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final user = FirebaseAuth.instance.currentUser;
        setState(() {
          isSubmitting = true;
        });
        await ref
            .watch(firebaseChatRoomServiceProvider)
            .addMember(widget.chatRoomID, user?.uid ?? '');
        ref.watch(chatRoomProvider(widget.chatRoomID)).maybeWhen(
          orElse: () {
            print('Error adding you to the chat room');
            // TODO: add a snack bar
          },
          data: (snapshot) {
            final chatRoom = ChatRoom.fromFirestore(snapshot, null);
            ref.watch(currentChatRoomProvider.notifier).state = chatRoom;
          },
        );
        setState(() {
          isSubmitting = false;
        });
      },
      child: ColoredBox(
        color: purple,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: isSubmitting
                ? const CircularProgressIndicator(
                    color: white,
                  )
                : const Text(
                    'Join Group',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
