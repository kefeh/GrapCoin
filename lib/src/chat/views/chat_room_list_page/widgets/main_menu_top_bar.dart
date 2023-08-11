import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grapcoin/src/constants/colors.dart';

class MainMenuTopBar extends ConsumerWidget {
  const MainMenuTopBar({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        return const Padding(
          padding: EdgeInsets.only(left: 20, top: 4, bottom: 4, right: 10),
          child: Row(
            children: [
              Text(
                'GrapCoin',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: purple,
                  letterSpacing: 1.2,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainMenuButton(
                      key: ValueKey('search_bar'),
                      icon: Icons.search,
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
