import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class AttachmentButton extends StatelessWidget {
  const AttachmentButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
    required this.icon,
  });

  final String text;
  final IconData icon;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: IconButton(
                color: white,
                splashColor: blueCyan,
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: white,
                ),
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
