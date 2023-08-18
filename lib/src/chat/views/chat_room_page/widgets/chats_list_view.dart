import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/utils/date_formatter.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_item.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ChatsListView extends ConsumerStatefulWidget {
  const ChatsListView({
    super.key,
    this.showChatItemOverlay = true,
    this.currentMessageID = '',
    required this.messageStream,
    required this.chatroomID,
  });
  final AsyncValue<List<Message>> messageStream;
  final bool showChatItemOverlay;
  final String currentMessageID;
  final String chatroomID;

  @override
  ConsumerState<ChatsListView> createState() => _ChatsListViewState();
}

class _ChatsListViewState extends ConsumerState<ChatsListView> {
  late ItemScrollController itemScrollController;
  late AutoScrollController controller;

  late ItemPositionsListener itemPositionsListener;
  int currentItemIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // controller.addListener(() {
      //   final direction = controller.position.userScrollDirection;
      //   final prevDirection = ref.read(scrollDirectionProvider);
      //   if (prevDirection != direction) {
      //     ref.read(scrollDirectionProvider.notifier).state = direction;
      //     setState(() {});
      //   }
      // });
      if (currentItemIndex == -1) return;
      await controller.scrollToIndex(
        currentItemIndex,
        preferPosition: AutoScrollPosition.begin,
        duration: const Duration(seconds: 2),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.messageStream.when(
      data: (messages) {
        if (messages.isEmpty) {
          return const Center(child: ErrorChatWidget());
        }
        final reversedMessages = messages.reversed.toList();
        currentItemIndex = reversedMessages.lastIndexWhere(
          (element) => element.key == widget.currentMessageID,
        );
        return LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
              reverse: true,
              controller: controller,
              itemBuilder: (context, index) {
                final messageItem = reversedMessages[index];
                final prevMessage = index < reversedMessages.length - 1
                    ? reversedMessages[index + 1]
                    : null;
                final prevMessageFrom = prevMessage?.from ?? '';
                final shouldHighlight =
                    messageItem.key == widget.currentMessageID;
                final shouldShowDate = DateFormat.yMd()
                        .format(messageItem.at) !=
                    DateFormat.yMd().format(prevMessage?.at ?? DateTime.now());

                return Column(
                  children: [
                    if (shouldShowDate)
                      DateContentItem(messageItem: messageItem),
                    AutoScrollTag(
                      controller: controller,
                      key: Key(messageItem.key),
                      index: index,
                      highlightColor: const Color.fromARGB(80, 33, 149, 243),
                      child: ChatItem(
                        key: Key(messageItem.key),
                        message: messageItem,
                        parentHeight: constraints.maxHeight,
                        prevMessageFrom: prevMessageFrom,
                        showChatItemOverlay: widget.showChatItemOverlay,
                        highlight: shouldHighlight,
                        chatroomID: widget.chatroomID,
                      ),
                    ),
                  ],
                );
              },
              itemCount: messages.length,
            );
          },
        );
      },
      error: (error, stack) {
        return const Center(child: ErrorChatWidget());
      },
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: purple,
        ),
      ),
    );
  }
}

class DateContentItem extends StatelessWidget {
  const DateContentItem({
    super.key,
    required this.messageItem,
  });

  final Message messageItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        DateFormatter().getDateRepresentation(messageItem.at),
        style: const TextStyle(
          color: white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ErrorChatWidget extends StatelessWidget {
  const ErrorChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No messages yet',
        style: TextStyle(color: red),
      ),
    );
  }
}
