import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({
    super.key,
    this.height = 220,
    required this.child,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 20.0,
      ),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
