/*
 * ---------------------------
 * File : rotate_dawn_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'slide_transform.dart';
class RotateDownTransform implements SlideTransform {
  final double rotationAngle;

  const RotateDownTransform({
    double rotationAngle = 45,
  }) : rotationAngle = math.pi / 180 * rotationAngle;

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage) {
      return Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.identity()..rotateZ(-rotationAngle * pageDelta),
        child: page,
      );
    } else if (index == currentPage! + 1) {
      return Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.identity()..rotateZ(rotationAngle * (1 - pageDelta)),
        child: page,
      );
    } else {
      return page;
    }
  }
}