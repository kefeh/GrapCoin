import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/chat/utils/add_chat_room_notifier.dart';
import 'package:grapcoin/src/chat/widgets/add_chat_room_dialog.dart';
import 'package:grapcoin/src/constants/colors.dart';

class MainMenuTopBar extends ConsumerWidget {
  const MainMenuTopBar({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 4, bottom: 4, right: 10),
          child: Row(
            children: [
              const Text(
                'GrapCoin',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: purpleLight,
                  letterSpacing: 1.2,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const MainMenuButton(
                      key: ValueKey('search_bar'),
                      icon: Icons.search,
                    ),
                    MainMenuButton(
                      key: const ValueKey('create-session-key'),
                      icon: Icons.add_circle_outline,
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AddRoomDialog(
                              hintText: 'Type group subject here ...',
                              isLoading: ref.watch(
                                addChatRoomProvider.select(
                                  (value) => value.isLoading,
                                ),
                              ),
                              onChanged: ref
                                  .watch(
                                    addChatRoomProvider.notifier,
                                  )
                                  .getName,
                              onPressed: (_) {
                                ref
                                    .watch(
                                      addChatRoomProvider.notifier,
                                    )
                                    .addChatRoom();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({
    super.key,
    this.onTap,
    required this.icon,
  });
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          key: key,
          height: 60,
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(100.0),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    icon,
                    size: 20.0,
                    color: purple,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
