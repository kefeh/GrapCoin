import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/chat/services/firebase_message_service.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_text_field.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ContentPreviewPage extends ConsumerStatefulWidget {
  const ContentPreviewPage({
    super.key,
    required this.type,
    required this.file,
    required this.chatroomID,
  });
  final PlatformFile file;
  final MessageEnum type;
  final String chatroomID;

  @override
  ConsumerState<ContentPreviewPage> createState() => _ContentPreviewPageState();
}

class _ContentPreviewPageState extends ConsumerState<ContentPreviewPage> {
  double loadingProgress = 0;
  bool uploadStarted = false;
  bool isCanceled = false;
  String caption = '';

  List<Widget> uploadTaskSection(UploadTask? uploadTask) {
    if (uploadTask != null) {
      return [
        CircularProgressIndicator(
          value: loadingProgress,
          color: purple,
          backgroundColor: white,
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              uploadTask.cancel();
            },
            icon: const Icon(
              Icons.close,
              color: white,
            ),
          ),
        ),
      ];
    } else {
      return [Container()];
    }
  }

  Future<void> successTaskHandle(TaskSnapshot taskSnapshot) async {
    final downloadUrl = await taskSnapshot.ref.getDownloadURL();
    final messageBody =
        getSignedInUserMessage(caption, downloadUrl, widget.type);
    await ref.watch(firebaseMessageServiceProvider).add(
          messageBody,
          ref.watch(currentChatRoomProvider)?.key ?? '',
        );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final uploadTask = ref.watch(uploadTaskProvider);
    ref.listen(
      uploadTaskProvider,
      (previous, next) {
        if (next == null) return;
        next.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
          switch (taskSnapshot.state) {
            case TaskState.running:
              setState(() {
                loadingProgress =
                    taskSnapshot.bytesTransferred / taskSnapshot.totalBytes;
              });
              debugPrint('Upload is $loadingProgress% complete.');
              break;
            case TaskState.paused:
              debugPrint('Upload is paused.');
              break;
            case TaskState.canceled:
              debugPrint('Upload was canceled');
              break;
            case TaskState.error:
              // Handle unsuccessful uploads
              break;
            case TaskState.success:
              successTaskHandle(taskSnapshot);
              Navigator.of(context).pop();
              break;
          }
        });
      },
    );
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height / 8,
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (uploadTask != null) {
                          uploadTask.cancel();
                        }
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // if (widget.type == MessageEnum.video)
                  //   BetterPlayerContainer(
                  //     contentUrl: widget.file.path,
                  //     type: BetterPlayerDataSourceType.file,
                  //   )
                  // else
                  if (widget.file.bytes == null)
                    Image.file(File(widget.file.path!))
                  else
                    Image.memory(widget.file.bytes!),
                  ...uploadTaskSection(uploadTask),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: uploadStarted
                  ? Column(
                      children: [
                        Text(
                          caption,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: white, fontSize: 16),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Sending...',
                            style: TextStyle(color: purple, fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  : ChatTextField(
                      hintText: 'Add a caption...',
                      preventEmptySubmit: false,
                      submit: (message) async {
                        ref.watch(uploadTaskProvider.notifier).state =
                            uploadeFileTask(
                          widget.file,
                          widget.chatroomID,
                          widget.type.name,
                        );
                        setState(() {
                          caption = message;
                          uploadStarted = true;
                        });
                      },
                      onWhiteBackground: false,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
