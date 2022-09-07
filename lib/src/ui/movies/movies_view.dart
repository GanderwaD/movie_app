/*
 * ---------------------------
 * File : movies_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/router/router_helper.dart';
import 'package:movie_app/src/ui/account/account_view.dart';
import 'package:movie_app/src/ui/movie_detail/movie_details_view.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../home/home_controller.dart';
import '../widgets/animations/slide_transform/default_transform.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/drawer.dart';
import '../widgets/movie_box.dart';
import '../widgets/page/page_slider.dart';
import '../widgets/paginated_list/indicator/classic_indicator.dart';
import '../widgets/paginated_list/paginated_list.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';
import '../widgets/theme/colors.dart';
import 'movie_controller.dart';

class MoviesView extends ConsumerWidget with RouterObject {
  const MoviesView({Key? key}) : super(key: key);

  @override
  String get routeKey => moviesKey;

  @override
  String get routePath => moviesPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewController = ref.watch(homeProvider);
    final movieController = ref.watch(movieControllerProvider);
    return BaseScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _getMovieSlider(context, homeViewController, movieController),
        ],
        body: _getBody(context, homeViewController, movieController),
      ),
      drawer: const Drawer(
        child: GetDrawer(),
      ),
    );
  }

  _getMovieSlider(BuildContext context, HomeController homeViewController,
      MovieController movieController) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 255,
      pinned: true,
      leading: IconButton(
        onPressed: () => R.instance.add(object: AccountView()),
        icon: const Icon(Icons.account_circle_outlined,
            size: 30.0, color: brushedSilver),
      ),
      backgroundColor: blueYonder,
      title: const TextWidget(
        'Movie',
        color: brushedSilver,
        maxLines: 1,
        fontFamily: 'FoxCavalier',
        textSize: TextSize.xxlLarge,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: deepMetalAppBarGradient,
        ),
        child: FlexibleSpaceBar(
          background: Container(
            margin: const EdgeInsets.only(top: 80, bottom: 10),
            child: movieController.loadingTopMovies
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  )
                : PageSlider(
                    viewportFraction: 0.4,
                    controller: homeViewController.homeSliderController,
                    infiniteScroll: true,
                    onPageChanged: (index) =>
                        homeViewController.updatePageIndex(index),
                    //enableAutoSlider: homeViewController.isAutoPlay,
                    enableAutoSlider: true,
                    slideTransform: const DefaultTransform(),
                    pageBuilder: (index) {
                      var movie = movieController.topMovies[index];
                      return GestureDetector(
                        onTap: () {
                          R.instance.add(object: MovieDetailsView(movie.id));
                          log("slider ${movie.id}");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: MovieBox(movie: movie),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
          ),
        ),
      ),
    );
  }

  _getBody(BuildContext context, HomeController homeViewController,
      MovieController movieController) {
    return Container(
      decoration: const BoxDecoration(gradient: deepMetalGradient),
      child: PaginatedList(
        controller: movieController.moviePaginatedController,
        onRefresh: () => movieController.onRefresh(),
        header: const ClassicHeader(),
        child: movieController.loadingPopularMovies
            ? const Center(
                child: CircularProgressIndicator(color: Colors.red),
              )
            : CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200.0,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: 6.0,
                            crossAxisSpacing: 6.0),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var movie = movieController.popularMovies[index];
                        return GestureDetector(
                          onTap: () {
                            R.instance.add(object: MovieDetailsView(movie.id));
                            log("box ${movie.id}");
                          },
                          child: MovieBox(movie: movie),
                        );
                      },
                      //number of items in movie_view page
                      childCount: 20,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
