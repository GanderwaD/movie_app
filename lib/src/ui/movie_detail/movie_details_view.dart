/*
 * ---------------------------
 * File : movie_details_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/movie_detail/movie_details_controller.dart';
import 'package:movie_app/src/ui/widgets/base_scaffold.dart';
import 'package:movie_app/src/ui/widgets/image/cached_network_image.dart';
import 'package:movie_app/src/ui/widgets/theme/colors.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../widgets/paginated_list/paginated_list.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';

class MovieDetailsView extends ConsumerWidget with RouterObject {
  const MovieDetailsView(
    this.movieId, {
    Key? key,
  }) : super(key: key);

  final int movieId;

  @override
  String get routeKey => movieDetailsKey;

  @override
  String get routePath => movieDetailsPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailsController = ref.watch(movieDetailsProvider(movieId));
    return BaseScaffold(
      body: _getBody(context, movieDetailsController),
    );
  }

  _getBody(BuildContext context, MovieDetailsController controller) {
    return Container(
      color: beige,
      child: PaginatedList(
        controller: controller.movieDetailsPaginatedController,
        onRefresh: () => controller.onRefresh(),
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
              title: const TextWidget(
                'MovieDetails',
                color: Colors.blue,
                maxLines: 1,
                textSize: TextSize.uLarge,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CNImage(imgUrl: controller.movieDetail.fullImageUrl),
                  TextWidget(controller.movieDetail.title ?? '')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
