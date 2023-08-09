import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/add_chat_room_notifier.dart';

class ImagePickerAvatar extends ConsumerWidget {
  const ImagePickerAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(addChatRoomProvider).profileImage;
    return GestureDetector(
      onTap: () async {
        await ref.read(addChatRoomProvider.notifier).getProfileImage();
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blueGrey.shade300,
        backgroundImage:
            imageFile == null ? null : Image.memory(imageFile.bytes!).image,
        child: const Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
