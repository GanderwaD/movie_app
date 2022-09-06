/*
 * ---------------------------
 * File : all_movies.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/account/account_view.dart';

import '../../router/router_constants.dart';
import '../../router/router_helper.dart';
import '../../router/router_object.dart';
import '../movie_detail/movie_details_view.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/movie_box.dart';
import '../widgets/paginated_list/indicator/classic_indicator.dart';
import '../widgets/paginated_list/paginated_list.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';
import '../widgets/theme/colors.dart';
import 'discover_movies_controller.dart';

class AllMovies extends ConsumerWidget with RouterObject {
  const AllMovies({Key? key}) : super(key: key);

  @override
  String get routeKey => allMovieKey;

  @override
  String get routePath => allMoviePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allMoviesController = ref.watch(allMoviesProvider);
    return BaseScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _getAppbar(context, allMoviesController),
        ],
        body: _getBody(context, allMoviesController),
      ),
    );
  }

  _getAppbar(BuildContext context, AllMoviesController controller) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 0,
      pinned: true,
      leading: IconButton(
        onPressed: () => R.instance.add(object: AccountView()),
        icon: const Icon(Icons.account_circle_outlined, size: 30.0),
      ),
      title: const TextWidget('Browse',
          color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [royalOrange, americanBlue],
          ),
        ),
      ),
    );
  }

  _getBody(BuildContext context, AllMoviesController controller) {
    return Container(
      decoration: const BoxDecoration(
        gradient: primaryGradient
      ),
      child: PaginatedList(
        controller: controller.allMoviesPaginatedController,
        onRefresh: () => controller.onRefresh(),
        enablePullUp: true,
        onLoading: () => controller.setLoadMore(),
        footer: const ClassicFooter(),
        header: const ClassicHeader(),
        child: controller.loadingPopularMovies
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
                        var movie = controller.popularMovies[index];
                        return GestureDetector(
                          onTap: () {
                            R.instance.add(
                              object: MovieDetailsView(movie.id),
                            );
                            log("box ${movie.id}");
                          },
                          child: MovieBox(movie: movie),
                        );
                      },
                      childCount: controller.popularMovies.length,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
