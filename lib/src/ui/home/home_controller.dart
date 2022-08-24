/*
 * ---------------------------
 * File : home_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/widgets/navbar/navbar_item.dart';
import 'package:movie_app/src/widgets/paginated_list/paginated_list.dart';
import 'package:movie_app/src/widgets/text_widget/text_size.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

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
  PaginatedController homePaginatedController = PaginatedController();
  int currentHomePageIndex = 0;
  int currentNavBarIndex = 0;
  bool isAutoPlay = true;
  List<NavbarItem> navbarItems = [
    const NavbarItem(
      title: TextWidget(
        "Home",
        textSize: TextSize.medium,
        color: Colors.blue,
      ),
    ),
    const NavbarItem(
      title: TextWidget(
        "Search",
        textSize: TextSize.medium,
        color: Colors.blue,
      ),
      icon: Icon(Icons.search_outlined),
    ),
    const NavbarItem(
      title: TextWidget(
        "Account",
        textSize: TextSize.medium,
        color: Colors.blue,
      ),
      icon: Icon(Icons.account_box),
    ),
  ];

  void init() {
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
    currentHomePageIndex = index;
    setAutoPlay(true);
    // if (currentHomePageIndex == 2) {
    //   setAutoPlay(true);
    // } else {
    //   setAutoPlay(true);
    // }
    notifyListeners();
  }

  navbarSelected(int index) {
    currentNavBarIndex = index;
    // switch (index) {
    //   case 1:
    //     R.instance.add(object: SearchView());
    //     break;
    //   default:
    // }
    notifyListeners();
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    homePaginatedController.refreshCompleted();
    notifyListeners();
  }
}
