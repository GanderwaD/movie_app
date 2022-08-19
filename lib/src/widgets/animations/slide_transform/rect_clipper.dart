/*
 * ---------------------------
 * File : rect_clipper.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';
class RectClipper extends CustomClipper<Rect> {
  final double leftClip;

  const RectClipper(this.leftClip);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(leftClip, 0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}