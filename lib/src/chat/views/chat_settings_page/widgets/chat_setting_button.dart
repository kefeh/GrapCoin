import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class ChatSettingsButton extends StatelessWidget {
  const ChatSettingsButton({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          color: onTap == null ? purpleLighterer : purpleLighter,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: onTap == null ? blackLight : purple,
              size: 18,
            ),
            Text(
              text,
              style: TextStyle(
                color: onTap == null ? blackLight : purple,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
