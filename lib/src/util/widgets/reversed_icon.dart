import 'dart:math';

import 'package:flutter/widgets.dart';

@immutable
class ReversedIcon extends StatelessWidget {
  final IconData icon;

  const ReversedIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(pi),
      child: Icon(icon),
    );
  }
}
