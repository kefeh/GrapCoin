import 'package:flutter/material.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:grapcoin/src/chat/utils/url.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/commands_list.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

bool isInternalLink(String link) {
  final processedUri = link
      .replaceAll(
        RegExp(r'^\/#?'),
        '',
      )
      .replaceAll(' ', '');
  final uri = Uri.parse(processedUri);
  if (internalHosts.contains(uri.host)) {
    return true;
  }
  return false;
}

Color getUrlColor(bool mine, String link) {
  if (isInternalLink(link)) {
    return mine ? blueCyanGreen : purpleDeep;
  }
  return mine ? blueCyan : blue;
}

FontWeight? getUrlFontWeight(String link) {
  if (isInternalLink(link)) {
    return FontWeight.w200;
  }

  return null;
}

TextSpan TextChatContentRecognizer({
  required String text,
  required bool mine,
  required void Function(String) internalLinkOnTap,
}) {
  return SocialTextSpanBuilder(
    regularExpressions: {
      DetectedType.mention: RegExp(chatCommands.keys.join('|')),
      DetectedType.url: urlRegex,
      DetectedType.hashtag: RegExp(
        '($emailPattern1)|($emailPattern2)',
      ),
    },
    defaultTextStyle: TextStyle(
      color: mine ? white : black,
      fontWeight: FontWeight.w500,
    ),
    detectionTextStyles: {
      DetectedType.mention: TextStyle(
        color: mine ? blueCyan : blue,
        fontWeight: FontWeight.bold,
      ),
      DetectedType.url: TextStyle(
        color: getUrlColor(mine, text),
        fontWeight: getUrlFontWeight(text),
        decoration: TextDecoration.underline,
      ),
      DetectedType.hashtag: TextStyle(
        color: mine ? blueCyan : blue,
        fontWeight: FontWeight.bold,
      ),
    },
    onTapDetection: (detection) async {
      if (detection.type == DetectedType.url) {
        final link = detection.text;
        try {
          await launchUrl(
            Uri.parse(link),
            mode: LaunchMode.externalApplication,
          );
        } catch (e) {
          throw Exception(
            'Could not launch $link',
          );
        }
      } else if (detection.type == DetectedType.hashtag) {
        final link = detection.text;
        try {
          await launchUrl(
            Uri(
              scheme: 'mailto',
              path: link,
            ),
            mode: LaunchMode.externalApplication,
          );
        } catch (e) {
          throw Exception(
            'Could not launch $link',
          );
        }
      }
    },
  ).build(text);
}
