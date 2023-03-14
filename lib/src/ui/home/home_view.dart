/*
 * ---------------------------
 * File : home_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/shared/widgets/theme/colors.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../discover_movies/discover_movies.dart';
import '../movies/movies_view.dart';
import '../search/search_view.dart';
import '../shared/widgets/bases/base_scaffold.dart';
import '../shared/widgets/navbar/bottom_navbar.dart';
import 'home_controller.dart';

class HomeView extends ConsumerWidget with RouterObject {
  const HomeView({super.key});

  @override
  String get routeKey => homeKey;

  @override
  String get routePath => homePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewController = ref.watch(homeProvider);
    return BaseScaffold(
      body: homeViewController.currentNavBarIndex == 0
          ? const MoviesView()
          : homeViewController.currentNavBarIndex == 1
              ? const AllMovies()
              : const SearchView(),
      navbar: BottomNavbar(
        backgroundColor: gunMetal,
        items: homeViewController.navbarItems,
        selectedIndex: homeViewController.currentNavBarIndex,
        onItemSelected: (index) => homeViewController.navbarSelected(index),
      ),
    );
  }
}
