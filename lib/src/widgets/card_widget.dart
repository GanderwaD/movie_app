/*
 * ---------------------------
 * File : card_widget.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Tue Mar 15 2022 2:40:49 PM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsets? margin;
  final Color? color;
  final Color? shadowColor;
  final Widget? child;
  final double radius;
  final double minHeight;
  final double fixedWidth;
  final Border? border;
  const CardWidget({
    Key? key,
    this.margin = const EdgeInsets.all(8.0),
    this.radius = 10.0,
    this.minHeight = 200.0,
    this.fixedWidth = double.infinity,
    this.color,
    this.shadowColor,
    this.child,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxWidth: fixedWidth,
        minWidth: fixedWidth,
      ),
      child: Container(
        margin: margin,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: border,
          boxShadow: shadowColor != null
              ? [
                  BoxShadow(
                    color: shadowColor!,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: const Offset(
                      5.0, // Move to right 10  horizontally
                      7.0, // Move to bottom 10 Vertically
                    ),
                  )
                ]
              : null,
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
