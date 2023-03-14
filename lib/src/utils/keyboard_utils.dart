/*
 * ---------------------------
 * File : keyboard_utils.dart.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * ---------------------------
 */


import 'package:flutter/cupertino.dart';


void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

