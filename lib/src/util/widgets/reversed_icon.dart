import 'dart:math';

import 'package:flutter/widgets.dart';

@immutable
class ReversedIcon extends StatelessWidget {
  final IconData icon;

  const ReversedIcon({
    super.key,
    required this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(pi),
      child: Icon(icon),
    );
  }
}
