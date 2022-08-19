/*
 * ---------------------------
 * File : background_to_foreground_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import 'slide_transform.dart';

class BackgroundToForegroundTransform implements SlideTransform {
  final double startScale;

  const BackgroundToForegroundTransform({
    this.startScale = 0.4,
  });

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage! + 1) {
      final double scale = startScale + (1 - startScale) * pageDelta;
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale, scale),
        child: page,
      );
    } else {
      return page;
    }
  }
}
