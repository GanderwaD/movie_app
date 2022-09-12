/*
 * ---------------------------
 * File : landing_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/landing_item.dart';
import '../../router/router_helper.dart';
import '../home/home_view.dart';
import '../shared/widgets/page/page_slider_controller.dart';

final landingProvider = ChangeNotifierProvider((ref) {
  return LandingController();
});

class LandingController extends ChangeNotifier {
  LandingController() {
    init();
  }
  List<LandingItem> landingItems = [];
  PageSliderController landingSliderController = PageSliderController();
  int currentLandingPageIndex = 0;
  bool isAutoPlay = true;

  void init() {
    landingItems = [
      LandingItem(description: '1', title: "1"),
      LandingItem(description: '2', title: "2"),
      LandingItem(description: '3', title: "3"),
    ];
    notifyListeners();
  }

  setAutoPlay(bool val) {
    isAutoPlay = val;
    notifyListeners();
  }

  btnContinue() {
    R.instance.replaceAll(object: const HomeView());
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

  skipLast() {
    currentLandingPageIndex = landingItems.length - 1;
    landingSliderController.jumpToPage(currentLandingPageIndex);
    notifyListeners();
  }
}
