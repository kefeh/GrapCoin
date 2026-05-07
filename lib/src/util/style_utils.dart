import 'dart:math' as math;

import 'package:flutter/material.dart';

Color randomColorGenerator() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withValues(alpha: 1);
}

String colorToString(Color color) {
  return color.toARGB32().toRadixString(16);

}
