/*
 * ---------------------------
 * File : scale.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Sat Jan 22 2022 9:59:08 AM
 * Copyright (c) 2022
 * ---------------------------
 */

import 'package:flutter/material.dart';

scaleAnimation({
  required Widget child,
  required Animation<double> animation,
}) {
  return Transform.scale(
    scale: animation.value,
    child: Opacity(
      opacity: animation.value,
      child: child,
    ),
  );
}
