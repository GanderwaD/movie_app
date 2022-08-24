import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/drawers/all_movies_controller.dart';
import 'package:movie_app/src/ui/shared/base_scaffold.dart';
import 'package:movie_app/src/widgets/paginated_list/paginated_list.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/text_widget/text_size.dart';

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
