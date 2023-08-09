import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/attachment_button.dart';
import 'package:grapcoin/src/constants/colors.dart';

class AttachmentDialog extends StatelessWidget {
  const AttachmentDialog({
    super.key,
    required this.visibilityHandler,
    required this.chatroomID,
  });

  final void Function() visibilityHandler;
  final String chatroomID;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: whiteBlueLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // AttachmentButton(
          //   text: 'video',
          //   color: purple,
          //   icon: Icons.video_collection,
          //   onPressed: () async {
          //     final file = await getFileFromType(MessageEnum.video);
          //     visibilityHandler();
          //     if (file == null) return;
          //     await navigatorKey.currentState!.push(
          //       MaterialPageRoute(
          //         builder: (context) => ContentPreviewPage(
          //           initialCaption: '',
          //           type: MessageEnum.video,
          //           file: File(file.path),
          //           chatroomID: chatroomID,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          AttachmentButton(
            text: 'image',
            color: blue,
            icon: Icons.image,
            onPressed: () async {
              final file = await getFileFromType(MessageEnum.image);
              visibilityHandler();
              if (file == null) return;
              // await mainRouteNavigatorKey.currentState!.push(
              //   MaterialPageRoute(
              //     builder: (context) => ContentPreviewPage(
              //       type: MessageEnum.image,
              //       file: file,
              //       chatroomID: chatroomID,
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
