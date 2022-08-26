/*
 * ---------------------------
 * File : accordion_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'slide_transform.dart';
class AccordionTransform implements SlideTransform {
  final bool transformRight;
  final bool transformLeft;

  const AccordionTransform({
    this.transformRight = true,
    this.transformLeft = true,
  });

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage && transformLeft) {
      return Transform(
        alignment: Alignment.centerRight,
        transform: Matrix4.identity()..rotateY(math.pi / 2 * pageDelta),
        child: page,
      );
    }
    if (index == currentPage! + 1 && transformRight) {
      return Transform(
        alignment: Alignment.centerLeft,
        transform: Matrix4.identity()..rotateY(-math.pi / 2 * (1 - pageDelta)),
        child: page,
      );
    } else {
      return page;
    }
  }
}