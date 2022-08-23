/*
 * ---------------------------
 * File : home_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/home/home_slider_card.dart';
import 'package:movie_app/src/ui/profile/profile_view.dart';
import 'package:movie_app/src/ui/search/search_view.dart';
import 'package:movie_app/src/ui/shared/base_scaffold.dart';
import 'package:movie_app/src/ui/shared/drawer.dart';
import 'package:movie_app/src/widgets/animations/slide_transform/default_transform.dart';
import 'package:movie_app/src/widgets/navbar/bottom_navbar.dart';
import 'package:movie_app/src/widgets/text_widget/text_size.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/page/page_slider.dart';
import '../../widgets/text_widget/text_widget.dart';
import '../../widgets/theme/colors.dart';
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
    final size = MediaQuery.of(context).size;
    return BaseScaffold(
      body: homeViewController.currentNavBarIndex == 0
          ? NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                _getMovieSlider(context, homeViewController),
              ],
              body: _getBody(context, homeViewController),
            )
          : homeViewController.currentNavBarIndex == 1
              ? SearchView()
              : ProfileView(),
      drawer: const Drawer(
        child: GetDrawer(),
      ),
      navbar: BottomNavbar(
        backgroundColor: black,
        items: homeViewController.navbarItems,
        selectedIndex: homeViewController.currentNavBarIndex,
        onItemSelected: (index) => homeViewController.navbarSelected(index),
      ),
    );
  }

  _getMovieSlider(BuildContext context, homeViewController) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 250,
      pinned: true,
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu, size: 30.0),
      ),
      backgroundColor: blueYonder,
      title: const TextWidget('Movie',
          color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: const EdgeInsets.only(top: 70, bottom: 10),
          child: PageSlider(
            viewportFraction: 0.4,
            controller: homeViewController.homeSliderController,
            infiniteScroll: true,
            onPageChanged: (index) => homeViewController.updatePageIndex(index),
            //enableAutoSlider: homeViewController.isAutoPlay,
            enableAutoSlider: true,
            slideTransform: const DefaultTransform(),
            pageBuilder: (index) {
              return GestureDetector(
                onTap: () => log("$index"),
                child: HomeSliderItemCard(
                  item: homeViewController.homeSliderItems[index],
                ),
              );
            },
            itemCount: homeViewController.homeSliderItems.length,
          ),
        ),
      ),
    );
  }

  _getBody(BuildContext context, HomeController homeViewController) {
    return Container(
      color: blueYonder,
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => log("$index"),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.teal,
                    child: Text('Movie Banner $index'),
                  ),
                );
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
