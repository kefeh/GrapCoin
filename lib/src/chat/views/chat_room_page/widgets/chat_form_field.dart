import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_social_textfield/controller/social_text_editing_controller.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/chat/services/firebase_message_service.dart';
import 'package:grapcoin/src/chat/utils/getters.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/utils/helpers.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/attachment_dialog.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_text_field.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/commands_list.dart';
import 'package:grapcoin/src/constants/colors.dart';

final textFieldContentProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

class ChatFormField extends ConsumerStatefulWidget {
  const ChatFormField({
    super.key,
    required this.chatroomID,
  });
  final String chatroomID;

  @override
  ConsumerState<ChatFormField> createState() => _ChatFormFieldState();
}

class _ChatFormFieldState extends ConsumerState<ChatFormField> {
  late FocusNode focusNode;
  bool isAttachmentPopUpShow = false;
  bool focused = false;
  late SocialTextEditingController _controller;

  @override
  void initState() {
    focusNode = FocusNode();

    //very important to keep it with this type
    //as the package needed to detect the changes needs this version
    //of the textEditingController
    _controller = SocialTextEditingController();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          focused = true;
        });
      } else {
        setState(() {
          focused = false;
        });
      }
    });

    super.initState();
  }

  void attachmendVisibilityHandler() {
    setState(() {
      isAttachmentPopUpShow = !isAttachmentPopUpShow;
    });
    SmartDialog.dismiss(status: SmartStatus.allAttach);
  }

  @override
  void dispose() {
    SmartDialog.dismiss(status: SmartStatus.allAttach);
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: white,
      child: Column(
        children: [
          CommandsList(controller: _controller),
          Consumer(
            builder: (context, ref, _) {
              // final scrollDirection = ref.watch(scrollDirectionProvider);
              // if (scrollDirection != ScrollDirection.reverse) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  minHeight: minFormFieldHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: bottomFormFieldPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // if (ref.watch(inSplitViewRouteProvider)) ...{
                      //   CircularButton(
                      //     baseIcon: Icons.arrow_back_ios_new,
                      //     size: 15,
                      //     onPressed: () {
                      //       navigateBackFromChatRoomToList(ref);
                      //     },
                      //   ),
                      //   const SizedBox(width: 5),
                      // },
                      CircularButton(
                        onPressed: () {
                          if (isAttachmentPopUpShow) {
                            setState(() {
                              isAttachmentPopUpShow = !isAttachmentPopUpShow;
                            });
                            SmartDialog.dismiss(
                              status: SmartStatus.allAttach,
                            );
                          } else {
                            setState(() {
                              isAttachmentPopUpShow = !isAttachmentPopUpShow;
                            });
                            SmartDialog.showAttach(
                              targetContext: context,
                              usePenetrate: true,
                              alignment: Alignment.topLeft,
                              clickMaskDismiss: false,
                              animationType:
                                  SmartAnimationType.centerScale_otherSlide,
                              builder: (_) => AttachmentDialog(
                                visibilityHandler: attachmendVisibilityHandler,
                                chatroomID: widget.chatroomID,
                              ),
                            );
                          }
                        },
                        baseIcon: Icons.attach_file,
                        secondaryIcon: Icons.close,
                        switchIcons: isAttachmentPopUpShow,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: ChatTextField(
                          hintText: 'Message ...',
                          controller: _controller,
                          focusNode: focusNode,
                          onChanged: (content) {},
                          submit: (message) async {
                            final messageBody = getSignedInUserMessage(
                              message,
                              '',
                              MessageEnum.text,
                            );
                            await ref.watch(firebaseMessageServiceProvider).add(
                                  messageBody,
                                  widget.chatroomID,
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            //    else {
            //     return Container();
            //   }
            // },
          ),
        ],
      ),
    );
    // } else {
    //   return Container();
    // }
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    this.onPressed,
    this.secondaryIcon,
    this.size = 20.0,
    this.switchIcons = false,
    required this.baseIcon,
  });
  final void Function()? onPressed;
  final IconData baseIcon;
  final IconData? secondaryIcon;
  final bool switchIcons;
  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // margin: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: white,
        // border: Border.all(color: purple),
      ),
      child: IconButton(
        // splashRadius: 30,
        color: purple,
        onPressed: onPressed,
        icon: Icon(
          switchIcons ? secondaryIcon ?? baseIcon : baseIcon,
          size: size,
        ),
      ),
    );
  }
}
