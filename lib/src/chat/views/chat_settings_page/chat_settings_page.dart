import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/chat_room.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_app_bar/chat_app_bar.dart';
import 'package:grapcoin/src/chat/views/chat_settings_page/widgets/chat_setting_button.dart';
import 'package:grapcoin/src/chat/views/chat_settings_page/widgets/chat_settings_avartar.dart';
import 'package:grapcoin/src/chat/views/chat_settings_page/widgets/leave_chat_bottom_modal.dart';
import 'package:grapcoin/src/chat/views/chat_settings_page/widgets/participants_list_tile.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/login/services/user_service.dart';

class ChatSettingsPage extends ConsumerWidget {
  const ChatSettingsPage({
    super.key,
    required this.chatRoom,
  });

  final ChatRoom chatRoom;

  bool isCreator(ChatRoom chatRoom, String uID) {
    return chatRoom.creatorUID == uID;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatParticipants = ref.watch(userListProvider(chatRoom.members));
    final areChatRoomNotificationsMuted = ref.watch(
      currentChatRoomProvider.select(
        (value) =>
            value?.mutedMembers
                .contains(UserService.instance.currentUser?.uid) ??
            false,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: ChatAppBar(
          chatRoom: chatRoom,
          hideProfileAvatar: true,
          hideCallButton: true,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ChatSettingsAvatar(
              chatID: chatRoom.key,
              chatName: chatRoom.name,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChatSettingsButton(
                      icon: areChatRoomNotificationsMuted
                          ? Icons.notifications_none
                          : Icons.notifications_off_rounded,
                      text: areChatRoomNotificationsMuted ? 'unmute' : 'mute',
                      onTap: () {
                        if (areChatRoomNotificationsMuted) {
                          ref
                              .read(firebaseChatRoomServiceProvider)
                              .unmuteMemberNotification(
                                chatRoom.key,
                                UserService.instance.currentUser!.uid,
                              );
                          return;
                        }
                        ref
                            .read(firebaseChatRoomServiceProvider)
                            .muteMemberNotification(
                              chatRoom.key,
                              UserService.instance.currentUser!.uid,
                            );
                      },
                    ),
                    ChatSettingsButton(
                      icon: CupertinoIcons.person_add,
                      text: 'invite',
                      onTap: () {},
                    ),
                    ChatSettingsButton(
                      icon: Icons.logout,
                      text: 'leave',
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) =>
                              const LeaveChatModalBottomSheet(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Participants',
              style: TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            chatParticipants.map(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data.value.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: ParticipantsListTile(
                        user: data.value[index],
                        isCreator: isCreator(chatRoom, data.value[index].uid),
                      ),
                    ),
                  ),
                );
              },
              error: (error) => const Center(
                child: Text('An error occured'),
              ),
              loading: (loading) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
