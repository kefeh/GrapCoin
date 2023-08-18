import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/widgets/chat_button.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class DeleteChatModalContent extends ConsumerStatefulWidget {
  const DeleteChatModalContent({
    Key? key,
    required this.isMine,
    required this.chatRoom,
  }) : super(key: key);
  final bool isMine;
  final ChatRoom chatRoom;

  @override
  ConsumerState<DeleteChatModalContent> createState() =>
      _DeleteChatModalContentState();
}

class _DeleteChatModalContentState
    extends ConsumerState<DeleteChatModalContent> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final currentUser = UserService.instance.currentUser;

    final deleteErrorMessage = widget.isMine
        ? 'Error deleting chatroom. Try again.'
        : 'Unable to leave chatroom. Try again.';
    final buttonText = widget.isMine ? "Delete chat" : "Leave chat";
    return Column(
      children: [
        const Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.logout_rounded, color: red, size: 60),
              ),
              Text(
                "Are you sure you want to proceed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: black,
                ),
              ),
              Text(
                "This action is not reversible and you will lose access to the chatroom.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                  child: ChatButton.outlined(
                text: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
              const SizedBox(width: 10),
              Expanded(
                child: ChatButton.primaryDanger(
                  text: buttonText,
                  isLoading: isLoading,
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await ref
                          .watch(firebaseChatRoomServiceProvider)
                          .remove(widget.chatRoom, currentUser?.uid ?? '');
                      setState(() {
                        isLoading = false;
                      });
                      // ignore: use_build_context_synchronously
                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    } catch (e, stk) {
                      setState(() {
                        isLoading = false;
                      });
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(deleteErrorMessage),
                          ),
                        );
                      }
                      logger
                        ..e(e)
                        ..e(stk);
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
