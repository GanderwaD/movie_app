/*
 * ---------------------------
 * File : flip_horizontal_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'slide_transform.dart';
class FlipHorizontalTransform implements SlideTransform {
  final double perspectiveScale;

  const FlipHorizontalTransform({
    this.perspectiveScale = 0.002,
  });

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    final double width = MediaQuery.of(context).size.width;
    if (index == currentPage! + 1 && pageDelta > 0.5) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, perspectiveScale)
          ..rotateY(math.pi * (pageDelta - 1))
          ..leftTranslate(-width * (1 - pageDelta)),
        child: page,
      );
    } else if (index == currentPage && pageDelta <= 0.5) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, perspectiveScale)
          ..rotateY(math.pi * pageDelta)
          ..leftTranslate(width * pageDelta),
        child: page,
      );
    } else if (pageDelta == 0) {
      return page;
    } else {
      return Container();
    }
  }
}