/*
 * ---------------------------
 * File : parallax_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import 'rect_clipper.dart';
import 'slide_transform.dart';
class ParallaxTransform implements SlideTransform {
  final double clipAmount;

  const ParallaxTransform({
    this.clipAmount = 200,
  });

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage! + 1) {
      return Transform.translate(
        offset: Offset(-clipAmount * (1 - pageDelta), 0),
        child: ClipRect(
          clipper: RectClipper(clipAmount * (1 - pageDelta)),
          child: page,
        ),
      );
    } else {
      return page;
    }
  }
}