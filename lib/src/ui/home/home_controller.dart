import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewProvider = ChangeNotifierProvider((ref) {
  return HomePageController();
});

class HomePageController extends ChangeNotifier {
  HomePageController() {
    init();
  }

  void init(){}
}
