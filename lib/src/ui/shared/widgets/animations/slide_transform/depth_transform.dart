/*
 * ---------------------------
 * File : depth_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import 'slide_transform.dart';
class DepthTransform implements SlideTransform {
  final double startScale;

  const DepthTransform({
    this.startScale = 0.4,
  });

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage) {
      final double scale = startScale + (1 - startScale) * (1 - pageDelta);
      double width = MediaQuery.of(context).size.width;
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(width * pageDelta)
          ..scale(scale, scale),
        child: Opacity(
          opacity: (1 - pageDelta),
          child: page,
        ),
      );
    } else {
      return page;
    }
  }
}