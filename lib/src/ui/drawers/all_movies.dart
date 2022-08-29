/*
 * ---------------------------
 * File : all_movies.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/paginated_list/paginated_list.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';
import 'all_movies_controller.dart';

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
      body: _getBody(context,allMoviesController),
    );
  }

  _getBody(BuildContext context,AllMoviesController controller) {
    return PaginatedList(
      controller: controller.allMoviesPaginatedController,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            leading: IconButton(
              onPressed: () => controller.goBack(context),
              icon: const Icon(Icons.arrow_back, size: 30.0),
            ),
            backgroundColor: Colors.red,
            title: const TextWidget('All Movies',
                color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
          )
        ],
      ),
    );
  }
}
