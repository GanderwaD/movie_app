import 'package:flutter/material.dart';

/*
 * ---------------------------
 * File : page_indicator.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Sat Jan 22 2022 7:51:42 AM
 * Copyright (c) 2022
 * ---------------------------
 */

class PageIndicator extends StatelessWidget {
  final int? currentIndex;
  final int count;
  final Color selectedColor;
  final Color unselectedColor;

  const PageIndicator({
    Key? key,
    this.currentIndex,
    required this.count,
    this.selectedColor = Colors.black,
    this.unselectedColor  = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            color: currentIndex == i
                ? selectedColor 
                : unselectedColor,
          ),
        ),
      ),
    );
  }
}
