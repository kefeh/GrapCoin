import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/constants/colors.dart';

class MainMenuBottonAppBar extends ConsumerWidget {
  const MainMenuBottonAppBar({
    required this.setIndex,
    required this.index,
    required this.onTapFAB,
    super.key,
  });
  final int index;
  final Function(int)? setIndex;
  final void Function()? onTapFAB;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: Material(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: Colors.transparent,
                currentIndex: index,
                onTap: setIndex,
                selectedIconTheme: const IconThemeData(color: purple),
                unselectedIconTheme: const IconThemeData(color: purpleLighter),
                unselectedFontSize: 11,
                selectedFontSize: 12,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                    label: 'chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.place,
                      color: Colors.transparent,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'profile',
                  ),
                ],
              ),
            ),
          ),
          if (index != 2)
            Positioned(
              top: -4,
              child: FloatingActionButton.small(
                onPressed: onTapFAB,
                foregroundColor: white,
                backgroundColor: purple,
                child: const Icon(Icons.groups_3),
              ),
            ),
        ],
      ),
    );
  }
}
