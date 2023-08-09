import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/chat/services/firebase_message_service.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_text_field.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatFloatingButton extends ConsumerStatefulWidget {
  const ChatFloatingButton({super.key, required this.chatRoomID});
  final String chatRoomID;

  @override
  ChatFloatingButtonState createState() => ChatFloatingButtonState();
}

class ChatFloatingButtonState extends ConsumerState<ChatFloatingButton> {
  bool isExtended = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton.extended(
        backgroundColor: isExtended ? purpleLighter : blue,
        onPressed: () {
          setState(() {
            isExtended = !isExtended;
          });
        },
        label: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axis: Axis.horizontal,
              child: child,
            ),
          ),
          child: isExtended
              ? Container(
                  width: width - 5,
                  height: 60,
                  color: white,
                  margin: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isExtended)
                        Expanded(
                          child: ChatTextField(
                            hintText: 'message ...',
                            onChanged: (content) {},
                            submit: (message) async {
                              final messageBody = getSignedInUserMessage(
                                message,
                                '',
                                MessageEnum.text,
                              );
                              await ref
                                  .watch(firebaseMessageServiceProvider)
                                  .add(
                                    messageBody,
                                    ref.watch(currentChatRoomProvider)?.key ??
                                        '',
                                  );
                            },
                          ),
                        ),
                      const SizedBox(
                        width: 40,
                        child: Icon(
                          Icons.keyboard_hide_outlined,
                          color: black,
                        ),
                      )
                    ],
                  ),
                )
              : const Icon(Icons.keyboard),
        ),
      ),
    );
  }
}
