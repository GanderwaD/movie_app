import 'package:flutter/material.dart';


/*
 * ---------------------------
 * File : app_bar_back_button.dart
 * ---------------------------
 */


class AppBarBackButton extends StatelessWidget {
  final Widget? icon;
  final VoidCallback onPressed;
  final Color? color;
  const AppBarBackButton({
    Key? key,
    this.icon,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: icon ??
          Container(
            height: 12.0,
            width: 12.0,
            margin: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              border: Border.all(width: 1, color: color ?? Colors.white),
            ),
            child: Icon(
              Icons.arrow_back,
              color: color ?? Colors.white,
              size: 24.0,
            ),
          ) 
    );
  }
}
