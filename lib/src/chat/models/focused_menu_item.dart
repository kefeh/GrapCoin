import 'package:flutter/material.dart';

class FocusedMenuItem {
  FocusedMenuItem({
    this.backgroundColor,
    required this.title,
    this.trailingIcon,
    required this.onPressed,
  });
  Color? backgroundColor;
  Widget title;
  Icon? trailingIcon;
  Function onPressed;
}
