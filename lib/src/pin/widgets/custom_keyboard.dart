import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';
import 'package:grapcoin/src/pin/widgets/keyboard_keys.dart';
import 'package:grapcoin/src/pin/widgets/ok_button.dart';

class CustomKeyboard extends StatelessWidget {
  final bool alreadySet;
  final void Function(String) onTap;
  final void Function() onBackspacePress;
  final void Function() onConfirm;
  const CustomKeyboard({
    super.key,
    this.alreadySet = false,
    required this.onTap,
    required this.onBackspacePress,
    required this.onConfirm,
  });

  renderKeyboard() {
    List<List<dynamic>> labels = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      alreadySet
          ? [
              '.',
              '0',
              const BackspaceIcon(),
            ]
          : [
              '0',
              const BackspaceIcon(),
              OkButton(
                onTap: onConfirm,
              ),
            ],
    ];
    return labels
        .map(
          (e) => Row(
            children: e.map(
              (e) {
                return KeyboardKey(
                  label: e,
                  value: e,
                  onTap: onTap,
                  onBackspacePress: onBackspacePress,
                  onConfirm: onConfirm,
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: renderKeyboard(),
      ),
    );
  }
}

class BackspaceIcon extends StatelessWidget {
  const BackspaceIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.backspace,
      size: 20,
      color: black,
    );
  }
}
