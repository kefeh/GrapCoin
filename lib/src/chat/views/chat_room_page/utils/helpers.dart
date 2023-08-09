import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollDirectionProvider =
    StateProvider.autoDispose<ScrollDirection?>((ref) => null);

const minFormFieldHeight = 40.0;
const bottomFormFieldPadding = 10.0;
const scrollDelayPixels = 200.0;
const verticalFormFieldPadding = bottomFormFieldPadding * 3;
final fromBottom = StateProvider.autoDispose<double>((ref) => 0.0);

Offset getPositionTop(GlobalKey parentKey, GlobalKey childKey) {
  final parentBox = parentKey.currentContext!.findRenderObject() as RenderBox;
  final parentPosition = parentBox.localToGlobal(Offset.zero);

  final childBox = childKey.currentContext!.findRenderObject() as RenderBox;
  final childPosition = childBox.localToGlobal(Offset.zero);

  final x = childPosition.dx - parentPosition.dx;
  final y = (childPosition.dy - parentPosition.dy).abs();

  return Offset(x, y);
}
