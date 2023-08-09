import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grapcoin/src/chat/utils/constants.dart';

const String urlPattern1 = r'https?:/\/\\S+';
const String urlPattern2 = r'^(.*?)((?:https?:\/\/|www\.)[^\s/$.?#].[^\s]*)';
const String urlPattern3 =
    r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?';
const String emailPattern1 = r'\S+@\S+';
const String emailPattern2 =
    r'^(.*?)((mailto:)?[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z][A-Z]+)';

const String phonePattern = r'[\d-]{9,}';

final linkRegex = RegExp(
  '($urlPattern3)|($emailPattern1)',
  caseSensitive: false,
  dotAll: true,
);

bool isInternalLink(String link) {
  final uri = Uri.parse(link);
  if (internalHosts.contains(uri.host)) {
    return true;
  }
  return false;
}

void internalLinkOpen(
  String link,
  void Function(String url)? linkOpen,
  void Function(String url)? internalLinkOpen,
) {
  if (linkOpen == null && internalLinkOpen == null) return;
  final uri = Uri.parse(link);
  if (uri.hasFragment && internalLinkOpen != null) {
    internalLinkOpen(uri.fragment);
  } else {
    if (linkOpen == null) return;
    linkOpen(link);
  }
}

class LinkSpan extends WidgetSpan {
  LinkSpan({
    MouseCursor mouseCursor = SystemMouseCursors.click,
    TextStyle? linkStyle,
    Function(String url)? onOpen,
    required String url,
  }) : super(
          child: MouseRegion(
            cursor: mouseCursor,
            child: Text.rich(
              TextSpan(
                text: url,
                style: linkStyle,
                recognizer: onOpen != null
                    ? (TapGestureRecognizer()..onTap = () => onOpen(url))
                    : null,
              ),
            ),
          ),
        );
}

List<InlineSpan> linkify(
  String text, {
  TextStyle? textStyle,
  TextStyle? linkStyle,
  TextStyle? internalLinkStyle,
  void Function(String url)? onLinkOpen,
  void Function(String url)? onInternalLinkOpen,
}) {
  final list = <InlineSpan>[];
  final match = linkRegex.firstMatch(text);

  if (match == null) {
    if (text.isNotEmpty) {
      list.add(
        TextSpan(
          text: text,
          style: textStyle,
        ),
      );
    }
    return list;
  }
  if (match.start > 0) {
    final secondText = text.substring(0, match.start);
    if (secondText.isNotEmpty) {
      list.add(
        TextSpan(
          text: secondText,
          style: textStyle,
        ),
      );
    }
  }

  final linkText = match.group(0);
  if (linkText == null) return list;
  if (linkText.contains(linkRegex)) {
    if (isInternalLink(linkText)) {
      list.add(
        LinkSpan(
          url: linkText,
          linkStyle: internalLinkStyle,
          onOpen: (String link) {
            internalLinkOpen(link, onLinkOpen, onInternalLinkOpen);
          },
        ),
      );
    } else {
      list.add(
        LinkSpan(
          url: linkText,
          linkStyle: linkStyle,
          onOpen: onLinkOpen,
        ),
      );
    }
  } else {
    throw 'Unexpected match: $linkText';
  }

  list.addAll(
    linkify(
      text.substring(match.start + linkText.length),
      textStyle: textStyle,
      linkStyle: linkStyle,
      onLinkOpen: onLinkOpen,
    ),
  );

  return list;
}
