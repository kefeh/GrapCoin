import 'dart:math' as math;

import 'package:flutter/material.dart';

Color randomColorGenerator() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
}

String colorToString(Color color) {
  return color.value.toRadixString(16);
}
