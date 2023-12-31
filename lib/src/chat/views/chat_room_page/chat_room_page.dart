import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/services/firebase_message_service.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_app_bar/chat_app_bar.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_bottom_bar.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chats_list_view.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/core/helpers/helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final messagesStreamProvider = StreamProvider.family(
  (ref, String chatRoomID) =>
      ref.watch(firebaseMessageServiceProvider).getMessageStream(chatRoomID),
);

class ChatRoomPage extends ConsumerStatefulWidget {
  const ChatRoomPage({
    super.key,
    this.messageID = '',
    required this.chatRoomID,
  });

  final String chatRoomID;
  final String messageID;

  @override
  ConsumerState<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends ConsumerState<ChatRoomPage> {
  ChatRoom? chatroomInfo;
  @override
  void initState() {
    Future.microtask(() async {
      final user = FirebaseAuth.instance.currentUser;
      if (chatroomInfo == null) return;
      bool isMember = chatroomInfo!.members.contains(user?.uid ?? '');
      if (!isMember) {
        await ref
            .watch(firebaseChatRoomServiceProvider)
            .addMember(widget.chatRoomID, user?.uid ?? '');

        ref.watch(chatRoomProvider(widget.chatRoomID)).maybeWhen(
          orElse: () {
            // TODO: add a snack bar
          },
          data: (snapshot) {
            final chatRoom = ChatRoom.fromFirestore(snapshot, null);
            ref.watch(currentChatRoomProvider.notifier).state = chatRoom;
          },
        );
      }
      return null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatRoomFuture = ref.watch(chatRoomProvider(widget.chatRoomID));

    var fromTop = ref.watch(fromBottom);
    if (fromTop > -scrollDelayPixels) {
      fromTop = 0.0;
    } else {
      fromTop = fromTop + scrollDelayPixels;
    }
    return chatRoomFuture.when(
      data: (snapshot) {
        final chatRoom = ChatRoom.fromFirestore(snapshot, null);
        chatroomInfo = chatRoom;
        final chatroomID = chatRoom.key;

        final messageStream = ref.watch(messagesStreamProvider(chatroomID));
        return Scaffold(
          // key: chatRoomMainMenuKey,
          resizeToAvoidBottomInset: true,
          backgroundColor: whitish,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: ChatAppBar(chatRoom: chatRoom),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  key: chatRoomListKey,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: minFormFieldHeight +
                                  verticalFormFieldPadding +
                                  fromTop,
                            ),
                            child: ChatsListView(
                              messageStream: messageStream,
                              currentMessageID: widget.messageID,
                              chatroomID: chatroomID,
                            ),
                          ),
                          Positioned(
                            bottom: fromTop,
                            left: 0,
                            right: 0,
                            child: ChatBottomBar(chatRoom: chatRoom),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: (ref.watch(inSplitViewRouteProvider))
          //     ? ChatFloatingButton(chatRoomID: chatRoomID)
          //     : null,
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.miniEndFloat,
          // bottomNavigationBar: ChatBottomBar(
          //   chatRoom: chatRoom,
          // ),
        );
      },
      error: (error, _) => ChatRoomError(chatroomID: widget.chatRoomID),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

///page shown when we can't fetch a room
class ChatRoomError extends StatelessWidget {
  const ChatRoomError({super.key, required this.chatroomID});

  final String chatroomID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Unfortunately, couldn't get chat room",
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(
              builder: (context, ref, _) {
                return ElevatedButton(
                  onPressed: () {
                    // navigatBackToMainMenu(context, Routes.mainMenu);
                  },
                  child: const Text('Go back'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
