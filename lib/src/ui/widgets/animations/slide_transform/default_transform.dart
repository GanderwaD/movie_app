/*
 * ---------------------------
 * File : default_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import 'slide_transform.dart';
class DefaultTransform implements SlideTransform {
  @override
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount) {
    return page;
  }

  const DefaultTransform();
}