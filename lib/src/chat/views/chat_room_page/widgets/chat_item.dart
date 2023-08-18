import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/focused_menu_item.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/services/firebase_message_service.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_item_content.dart';
import 'package:grapcoin/src/chat/widgets/focused_menu_holder.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatItem extends ConsumerStatefulWidget {
  const ChatItem({
    super.key,
    this.highlight = false,
    required this.showChatItemOverlay,
    required this.message,
    required this.prevMessageFrom,
    required this.parentHeight,
    required this.chatroomID,
  });

  final Message message;
  final bool showChatItemOverlay;
  final bool highlight;
  final String prevMessageFrom;
  final double parentHeight;
  final String chatroomID;

  @override
  ConsumerState<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends ConsumerState<ChatItem> {
  late bool mine;

  @override
  void initState() {
    mine = isMyMessage(widget.message);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserID = FirebaseAuth.instance.currentUser?.uid ?? '';
    return FocusedMenuHolder(
      onPressed: () {},
      showOverlay: widget.showChatItemOverlay,
      mine: mine,
      menuWidth: 200,
      blurSize: 5,
      menuBoxDecoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      duration: const Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.black54,
      menuItems: <FocusedMenuItem>[
        // Add Each FocusedMenuItem  for Menu Options
        FocusedMenuItem(
          title: const Text(
            'Copy',
            style: TextStyle(
              color: white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: black,
          trailingIcon: const Icon(
            Icons.copy_sharp,
            color: white,
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: widget.message.content));
          },
        ),
        if (currentUserID == widget.message.from)
          FocusedMenuItem(
            title: const Text(
              'Delete',
              style: TextStyle(
                color: white,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            backgroundColor: black,
            trailingIcon: const Icon(
              CupertinoIcons.delete,
              color: white,
            ),
            onPressed: () async {
              await ref.watch(firebaseMessageServiceProvider).deleteMessage(
                    widget.chatroomID,
                    widget.message,
                  );
            },
          )
      ],
      child: ChatContent(
        mine: mine,
        message: widget.message,
        highlight: widget.highlight,
        prevMessageFrom: widget.prevMessageFrom,
      ),
    );
  }
}
