import 'dart:math';

import 'package:flutter/widgets.dart';

@immutable
class MirroredIcon extends StatelessWidget {
  final IconData icon;

  const MirroredIcon(
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Icon(icon),
    );
  }
}
