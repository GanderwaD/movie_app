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
import 'package:movie_app/src/ui/account/auth_checker.dart';

import '../../router/router_constants.dart';
import '../../router/router_helper.dart';
import '../../router/router_object.dart';
import '../movie_detail/movie_details_view.dart';
import '../shared/widgets/bases/base_scaffold.dart';
import '../shared/widgets/movie_box.dart';
import '../shared/widgets/paginated_list/indicator/classic_indicator.dart';
import '../shared/widgets/paginated_list/paginated_list.dart';
import '../shared/widgets/text_widget/text_size.dart';
import '../shared/widgets/text_widget/text_widget.dart';
import '../shared/widgets/theme/colors.dart';
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
        onPressed: () => R.instance.add(object: const AuthChecker()),
        icon: const Icon(Icons.account_circle_outlined,
            color: brushedSilver, size: 30.0),
      ),
      title: const TextWidget(
        'Browse',
        color: brushedSilver,
        maxLines: 1,
        fontFamily: 'FoxCavalier',
        textSize: TextSize.xxlLarge,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: deepMetalAppBarGradient),
      ),
    );
  }

  _getBody(BuildContext context, AllMoviesController controller) {
    return Container(
      decoration: const BoxDecoration(gradient: deepMetalAppBarGradient),
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
