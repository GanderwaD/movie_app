/*
 * ---------------------------
 * File : zoom_out_slide_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import 'slide_transform.dart';
class ZoomOutSlideTransform implements SlideTransform {
  final double zoomOutScale;
  final bool enableOpacity;

  const ZoomOutSlideTransform({
    this.zoomOutScale = 0.8,
    this.enableOpacity = true,
  });

  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    if (index == currentPage) {
      double scale = 1 - pageDelta < zoomOutScale ? zoomOutScale : zoomOutScale + ((1 - pageDelta) - zoomOutScale);
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale, scale),
        child: enableOpacity ? Opacity(opacity: scale, child: page) : page,
      );
    } else if (index == currentPage! + 1) {
      double scale = pageDelta < zoomOutScale ? zoomOutScale : zoomOutScale + (pageDelta - zoomOutScale);
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale, scale),
        child: enableOpacity ? Opacity(opacity: scale, child: page) : page,
      );
    } else {
      return page;
    }
  }
}