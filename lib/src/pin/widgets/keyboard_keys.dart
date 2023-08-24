import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/pin/widgets/custom_keyboard.dart';
import 'package:grapcoin/src/pin/widgets/ok_button.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final void Function(String) onTap;
  final void Function() onBackspacePress;
  final void Function() onConfirm;
  const KeyboardKey({
    super.key,
    required this.label,
    this.value,
    required this.onTap,
    required this.onBackspacePress,
    required this.onConfirm,
  });

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  Widget renderLabel() {
    if (widget.label is Widget) return widget.label;
    return Text(
      widget.label,
      style: const TextStyle(
        color: black,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  onTapChoice(val) {
    if (widget.label is String) widget.onTap(val);
    if (widget.label is BackspaceIcon) widget.onBackspacePress();
    if (widget.label is TextButton) widget.onConfirm();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.label is OkButton
          ? OkButton(onTap: widget.onConfirm)
          : InkWell(
              splashColor: purple.withOpacity(0.2),
              onTap: () {
                onTapChoice(widget.label);
              },
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Center(
                  child: renderLabel(),
                ),
              ),
            ),
    );
  }
}
