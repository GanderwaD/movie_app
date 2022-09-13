// ignore_for_file: depend_on_referenced_packages

/*
 * ---------------------------
 * File : rotate_animation.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Sat Jan 22 2022 10:04:10 AM
 * Copyright (c) 2022
 * ---------------------------
 */

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

rotateAnimation({
  required Widget child,
  required Animation<double> animation,
}) {
  return Transform.rotate(
    angle: math.radians(animation.value * 360),
    child: Opacity(
      opacity: animation.value,
      child: child,
    ),
  );
}
