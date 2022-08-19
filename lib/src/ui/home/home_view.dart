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
import 'package:movie_app/src/ui/shared/base_scaffold.dart';
import 'package:movie_app/src/widgets/animations/slide_transform/default_transform.dart';
import 'package:movie_app/src/widgets/page/page_slider.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/animations/slide_transform/cube_transform.dart';
import 'home_controller.dart';
import 'home_slider_card.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //const Spacer(),
          PageSlider(
            controller: homeViewController.homeSliderController,
            onPageChanged: (index) => homeViewController.updatePageIndex(index),
            enableAutoSlider: homeViewController.isAutoPlay,
            slideTransform: const DefaultTransform(),
            pageBuilder: (index) {
              return HomeSliderItemCard(
                  item: homeViewController.homeSliderItems[index]);
            },
            itemCount: homeViewController.homeSliderItems.length,
          ),

        ],
      ),
    );
  }
}
