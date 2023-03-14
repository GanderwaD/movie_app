/*
 * ---------------------------
 * File : slide_transform.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

abstract class SlideTransform {
  Widget transform(BuildContext context, Widget page, int index, int? currentPage, double pageDelta, int itemCount);
}
