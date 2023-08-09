import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:grapcoin/src/chat/utils/url.dart';
import 'package:grapcoin/src/chat/views/chat_room_page/widgets/chat_form_field.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tagContentProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

const Map<String, dynamic> chatCommands = {'/help': 'Use to call an admin'};

///displays a list of commands above the textfield
///
class CommandsList extends HookConsumerWidget {
  const CommandsList({
    super.key,
    required this.controller,
  });

  final SocialTextEditingController controller;
  final String tagRegex = r'(?<mention>\/)(?<item>\w*)$';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldContent = ref.watch(tagContentProvider);

    useEffect(
      () {
        controller
          ..setRegexp(
            DetectedType.mention,
            RegExp(chatCommands.keys.join('|')),
          )
          ..setTextStyle(
            DetectedType.mention,
            const TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
          ..setRegexp(
            DetectedType.hashtag,
            RegExp('($emailPattern1)|($emailPattern2)'),
          )
          ..setTextStyle(
            DetectedType.hashtag,
            const TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
          ..addListener(() {
            final regexText = RegExp(tagRegex);
            //trimming cause the social textfield package adds a trailing space
            final trimmedText = stringWithoutLastCharacter();
            final match1 =
                regexText.firstMatch(trimmedText)?.namedGroup('item');
            if (regexText.hasMatch(trimmedText) && match1 != null) {
              //TODO: change this later to take into account hashtags
              ref.read(tagContentProvider.notifier).state = '/$match1';
            } else {
              ref.read(tagContentProvider.notifier).state = '';
            }
          });
        return null;
      },
      const [],
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 150,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: purpleLighter,
        child: textFieldContent.isEmpty
            ? const SizedBox.shrink()
            : ListView(
                shrinkWrap: true,
                children: chatCommands.entries.where(
                  (element) {
                    return RegExp(textFieldContent).hasMatch(element.key);
                  },
                ).map(
                  (e) {
                    return InkWell(
                      onTap: () {
                        final newText =
                            '${stringWithoutLastCharacter().replaceAll(
                          RegExp(tagRegex),
                          '${e.key} ',
                        )} ';
                        controller.value = controller.value.copyWith(
                          text: newText,
                          selection: TextSelection.collapsed(
                            offset: newText.length - 1,
                          ),
                        );

                        ref.read(textFieldContentProvider.notifier).state =
                            newText;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              e.key,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Text(
                                e.value,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
      ),
    );
  }

  String stringWithoutLastCharacter() {
    return controller.text.replaceFirst(RegExp(r'\s$'), '');
  }
}
