import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    this.isWarning = false,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final Function()? onTap;
  final IconData icon;
  final String title;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    final color = isWarning ? red : blackish;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: color,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: purple,
            ),
          ],
        ),
      ),
    );
  }
}
