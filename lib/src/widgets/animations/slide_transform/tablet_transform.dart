/*
 * ---------------------------
 * File : tablet_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'slide_transform.dart';

class TabletTransform implements SlideTransform {
  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(-math.pi / 4 * pageDelta),
        child: page,
      );
    } else if (index == currentPage! + 1) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(math.pi / 4 * (1 - pageDelta)),
        child: page,
      );
    } else {
      return page;
    }
  }

  const TabletTransform();
}