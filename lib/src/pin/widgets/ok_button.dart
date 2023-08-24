import 'package:flutter/material.dart';
import 'package:grapcoin/src/constants/colors.dart';

class OkButton extends StatelessWidget {
  final void Function() onTap;
  const OkButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: black,
                  width: 2,
                ),
              ),
            ),
          ),
          child: const Text(
            "ok",
          ),
        ),
      ],
    );
  }
}
