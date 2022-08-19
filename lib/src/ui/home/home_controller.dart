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

import '../../models/home_slider_item.dart';
import '../../widgets/page/page_slider_controller.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeController();
});

class HomeController extends ChangeNotifier {
  HomeController() {
    init();
  }
  List<HomeSliderItem> homeSliderItems = [];
  PageSliderController homeSliderController = PageSliderController();
  int currentLandingPageIndex = 0;
  bool isAutoPlay = true;

  void init(){
    homeSliderItems = [
      HomeSliderItem(description: '1', title: "1"),
      HomeSliderItem(description: '2', title: "2"),
      HomeSliderItem(description: '3', title: "3"),
    ];
    notifyListeners();
  }
  
  setAutoPlay(bool val) {
    isAutoPlay = val;
    notifyListeners();
  }

  updatePageIndex(int index) {
    currentLandingPageIndex = index;
    if (currentLandingPageIndex == 2) {
      setAutoPlay(false);
    } else {
      setAutoPlay(true);
    }
    notifyListeners();
  }

}
