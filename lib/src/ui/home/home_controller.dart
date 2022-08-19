/*
 * ---------------------------
 * File : home_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeController();
});

class HomeController extends ChangeNotifier {
  HomeController() {
    init();
  }

  void init(){}
}
