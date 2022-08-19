/*
 * ---------------------------
 * File : navbar_item.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Fri Mar 18 2022 4:51:15 PM
 * Copyright (c) 2022 
 * ---------------------------
 */

import 'package:flutter/material.dart';

class NavbarItem {
  const NavbarItem({
    this.assetPath,
    this.icon = const Icon(Icons.home),
    this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });
  final String? assetPath;
  final Widget icon;
  final Widget? title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
