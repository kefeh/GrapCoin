import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/models/message.dart';
import 'package:grapcoin/src/chat/models/message_type.dart';
import 'package:grapcoin/src/chat/utils/date_formatter.dart';
import 'package:grapcoin/src/chat/utils/helpers.dart';
import 'package:grapcoin/src/chat/utils/url.dart';
import 'package:grapcoin/src/chat/views/image_preview_page/content_postview_page.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/login/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:linkify/linkify.dart' show linkify;

class ChatContent extends ConsumerStatefulWidget {
  const ChatContent({
    super.key,
    this.highlight = false,
    required this.mine,
    required this.message,
    required this.prevMessageFrom,
  });

  final bool mine;
  final Message message;
  final bool highlight;
  final String prevMessageFrom;

  @override
  ConsumerState<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends ConsumerState<ChatContent> {
  late Color nameColor;
  Color? bgColor = purpleLight;
  late bool prevMessageIsMine;
  @override
  void initState() {
    nameColor = ref.read(colorProvider(widget.message.from));
    prevMessageIsMine = widget.prevMessageFrom == widget.message.from;
    if (widget.highlight) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 3)).then((value) {
          setState(() {
            bgColor = null;
          });
        });
        return;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider(widget.message.from));
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        top: prevMessageIsMine ? 3 : 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      foregroundDecoration: BoxDecoration(
        color: widget.highlight ? bgColor : null,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      onEnd: () {
        setState(() {
          bgColor = null;
        });
      },
      child: Align(
        alignment: widget.mine ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
              widget.mine ? MainAxisAlignment.end : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // if (!widget.mine)
            //   SizedBox(
            //     width: 35,
            //     child: !prevMessageIsMine
            //         ? ProfileCircleAvatar(userID: widget.message.from)
            //         : null,
            //   ),
            Flexible(
              child: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints.tightFor(),
                  margin: EdgeInsets.only(
                    left: widget.mine ? 36 : 4,
                    right: widget.mine ? 4 : 36,
                  ),
                  decoration: BoxDecoration(
                    color: widget.mine ? purple : white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: -3,
                        child: Text(
                          DateFormatter()
                              .getTimeRepresentation(widget.message.at),
                          style: TextStyle(
                            letterSpacing: -1,
                            color: widget.mine ? lightBlue : blackLight,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: widget.mine
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (!prevMessageIsMine || widget.message.pinned)
                            ChatContentHeader(
                              widget: widget,
                              user: user,
                              nameColor: nameColor,
                            ),

                          if (widget.message.type == MessageEnum.image)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ContentPostViewPage(
                                        type: MessageEnum.image,
                                        fileUrl: widget.message.contentUrl,
                                        caption: widget.message.content,
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Hero(
                                    tag: widget.message.contentUrl,
                                    child: CachedNetworkImage(
                                      imageUrl: widget.message.contentUrl,
                                      width: 200,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              SizedBox(
                                        height: 80,
                                        width: 400,
                                        child: Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // if (widget.message.type == MessageEnum.video)
                          //   BetterPlayerContainer(
                          //     contentUrl: widget.message.contentUrl,
                          //     type: BetterPlayerDataSourceType.network,
                          //   ),
                          SizedBox(
                            width: (widget.message.type == MessageEnum.image)
                                ? 200
                                : null,
                            child: RichText(
                              // textWidthBasis: TextWidthBasis.longestLine,
                              // softWrap: false,
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  ...linkify(
                                    widget.message.content,
                                    textStyle: TextStyle(
                                      color: widget.mine ? white : black,
                                      fontSize: 12,
                                    ),
                                    linkStyle: TextStyle(
                                      color: widget.mine ? blueCyan : blue,
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                    ),
                                    internalLinkStyle: TextStyle(
                                      color: widget.mine
                                          ? blueCyanGreen
                                          : purpleDeep,
                                      fontWeight: FontWeight.w200,
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                    ),
                                    onInternalLinkOpen: (link) async {
                                      // final processedUri = link.replaceAll(
                                      //   RegExp(r'^\/#?'),
                                      //   '',
                                      // );
                                      // final pageName = Uri.parse(processedUri);
                                      // final parameters =
                                      //     pageName.queryParameters;
                                      // if (link.contains(Routes.sessionBase)) {
                                      //   ref
                                      //           .watch(splitTypeProvider.notifier)
                                      //           .state =
                                      //       SplitViewType.initialSplitView;
                                      //   // ref
                                      //   //     .watch(sessionIDProvider.notifier)
                                      //   //     .state = parameters['id'] ?? '';
                                      //   await Future.delayed(
                                      //     const Duration(seconds: 1),
                                      //   ).then((value) {
                                      //     sessionRouteNavigatorKey.currentState!
                                      //         .pushNamedAndRemoveUntil(
                                      //       processedUri,
                                      //       (_) => false,
                                      //       arguments: {
                                      //         'sessionId': parameters['id'],
                                      //         'branchId':
                                      //             parameters['branchId'],
                                      //         'preview':
                                      //             parameters['preview'] == '1',
                                      //       },
                                      //     );
                                      //     return null;
                                      //   });
                                      // } else {
                                      //   if (link
                                      //       .contains(Routes.chatRoomBase)) {
                                      //     ref
                                      //         .watch(
                                      //           selectedSplitScreenChatRoomID
                                      //               .notifier,
                                      //         )
                                      //         .state = parameters['id'] ?? '';
                                      //     await chatRoomRouteNavigatorKey
                                      //         .currentState!
                                      //         .pushNamedAndRemoveUntil(
                                      //       Routes.chat(
                                      //         parameters['id'] ?? '',
                                      //       ),
                                      //       (_) => false,
                                      //     );

                                      //     // Navigator.pushReplacementNamed(
                                      //     //   context,
                                      //     //   link,
                                      //     // );
                                      //   }
                                      // }
                                    },
                                    onLinkOpen: (link) async {
                                      try {
                                        await launchUrl(
                                          Uri.parse(link),
                                          // mode: LaunchMode.externalApplication,
                                        );
                                      } catch (e) {
                                        throw 'Could not launch $link';
                                      }
                                    },
                                  ),
                                  const WidgetSpan(
                                    child: Text(
                                      '100:00',
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatContentHeader extends StatelessWidget {
  const ChatContentHeader({
    super.key,
    required this.widget,
    required this.user,
    required this.nameColor,
  });

  final ChatContent widget;
  final AsyncValue<User> user;
  final Color nameColor;

  @override
  Widget build(BuildContext context) {
    final prevMessageIsMine = widget.prevMessageFrom == widget.message.from;
    return (!widget.mine || widget.message.pinned)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: (!widget.mine && !prevMessageIsMine)
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          user.map(
                            data: (data) => data.value.nameToDisplay,
                            error: (_) => 'name get error',
                            loading: (_) => 'loading',
                          ),
                          style: TextStyle(
                            color: nameColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(
                width: 8,
              ),
              if (widget.message.pinned)
                Transform.rotate(
                  angle: pi / 4,
                  child: Icon(
                    CupertinoIcons.pin,
                    color: widget.mine ? white : black,
                    size: 15,
                  ),
                )
            ],
          )
        : Container();
  }
}
