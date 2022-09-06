/*
 * ---------------------------
 * File : home_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/widgets/theme/colors.dart';

import '../widgets/navbar/navbar_item.dart';
import '../widgets/page/page_slider_controller.dart';
import '../widgets/paginated_list/paginated_list.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeController();
});

class HomeController extends ChangeNotifier {
  HomeController() {
    init();
  }
  PageController homePageController = PageController();
  PageSliderController homeSliderController = PageSliderController();
  PaginatedController homePaginatedController = PaginatedController();
  int currentHomePageIndex = 0;
  int currentNavBarIndex = 0;
  bool isAutoPlay = true;

  ///for Navbar
  List<NavbarItem> navbarItems = [
    const NavbarItem(
      title: TextWidget(
        "Home",
        textSize: TextSize.medium,
        color: brushedSilver,
      ),
      icon: Icon(Icons.home),
      inactiveColor: brushedSilver,
      activeColor: brushedSilver,
    ),
    const NavbarItem(
      title: TextWidget(
        "Browse",
        textSize: TextSize.medium,
        color: brushedSilver,
      ),
      icon: Icon(Icons.browse_gallery_outlined),
      inactiveColor: brushedSilver,
      activeColor: brushedSilver,
    ),
    const NavbarItem(
      title: TextWidget(
        "Search",
        textSize: TextSize.medium,
        color: brushedSilver,
      ),
      icon: Icon(Icons.search_outlined),
      inactiveColor: brushedSilver,
      activeColor: brushedSilver,
    ),
  ];

  void init() {}

  setAutoPlay(bool val) {
    isAutoPlay = val;
    notifyListeners();
  }

  updatePageIndex(int index) {
    currentHomePageIndex = index;
    setAutoPlay(true);
    notifyListeners();
  }

  navbarSelected(int index) {
    currentNavBarIndex = index;
    notifyListeners();
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    homePaginatedController.refreshCompleted();
    notifyListeners();
  }
}
