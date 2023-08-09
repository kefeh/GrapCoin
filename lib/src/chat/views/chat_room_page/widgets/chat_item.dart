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
  });

  final Message message;
  final bool showChatItemOverlay;
  final bool highlight;
  final String prevMessageFrom;
  final double parentHeight;

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
    return FocusedMenuHolder(
      onPressed: () {},
      showOverlay: widget.showChatItemOverlay,
      //TODO: handle parentKey
      parentKey: GlobalKey(),
      // parentKey: ref.watch(inSplitViewRouteProvider)
      //     ? chatRoomListKey
      //     : chatRoomMainMenuKey,
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
        FocusedMenuItem(
          title: Text(
            widget.message.pinned ? 'Unpin' : 'Pin',
            style: const TextStyle(
              color: white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: black,
          trailingIcon: Icon(
            widget.message.pinned
                ? CupertinoIcons.pin_slash
                : CupertinoIcons.pin,
            color: white,
          ),
          onPressed: () async {
            await ref
                .watch(firebaseMessageServiceProvider)
                .changeMessagePinStatus(
                  ref.watch(currentChatRoomProvider)?.key ?? '',
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
