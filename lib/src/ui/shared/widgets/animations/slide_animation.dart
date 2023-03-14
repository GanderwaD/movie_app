/*
 * ---------------------------
 * File : slide_animation.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Sat Jan 22 2022 10:07:54 AM
 * Copyright (c) 2022
 * ---------------------------
 */

import 'package:flutter/material.dart';

slideInDownAnimation({
  required Widget child,
  required Animation<double> animation,
}) {
  final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
  return Transform(
    transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
    child: Opacity(
      opacity: animation.value,
      child: child,
    ),
  );
}

slideInUpAnimation({
  required Widget child,
  required Animation<double> animation,
}) {
  final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
  return Transform(
    transform: Matrix4.translationValues(0.0, curvedValue * -200, 0.0),
    child: Opacity(
      opacity: animation.value,
      child: child,
    ),
  );
}

slideInLeftAnimation({
  required Widget child,
  required Animation<double> animation,
}) {
  final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
  return Transform(
    transform: Matrix4.translationValues(curvedValue * 200, 0.0, 0.0),
    child: Opacity(
      opacity: animation.value,
      child: child,
    ),
  );
}

slideInRightAnimation({
  required Widget child,
  required Animation animation,
}) {
  final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
  return Transform(
    transform: Matrix4.translationValues(curvedValue * -200, 0, 0),
    child: Opacity(
      opacity: animation.value,
      child: child,
    ),
  );
}
