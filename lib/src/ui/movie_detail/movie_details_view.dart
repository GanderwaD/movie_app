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
import '../widgets/paginated_list/indicator/classic_indicator.dart';
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _getBackdropImage(context, movieDetailsController),
        ],
        body: movieDetailsController.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : _getBody(context, movieDetailsController),
      ),
    );
  }

  _getBackdropImage(BuildContext context, MovieDetailsController controller) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 250,
      pinned: true,
      leading: IconButton(
        onPressed: () => controller.goBack(context),
        icon: const Icon(Icons.arrow_back, size: 30.0),
      ),
      backgroundColor: blueYonder,
      title: const TextWidget('Movie Details',
          color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: const EdgeInsets.only(top: 70, bottom: 0),
          child: CNImage(
              imgUrl: controller.movieDetail.backdropImageUrl,
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }

  _getBody(BuildContext context, MovieDetailsController controller) {
    return Container(
      color: beige,
      child: PaginatedList(
        controller: controller.movieDetailsPaginatedController,
        onRefresh: () => controller.onRefresh(),
        header: const ClassicHeader(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    controller.movieDetail.title ?? '',
                    textSize: TextSize.xLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CNImage(imgUrl: controller.movieDetail.posterImageUrl),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        //color: Colors.amber,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Status: \n${controller.movieDetail.status}",
                              textSize: TextSize.large,
                            ),
                            TextWidget(
                              "Release Date: \n${controller.movieDetail.releaseDate}",
                              textSize: TextSize.large,
                            ),
                            // TextWidget(
                            //   "Original Language: \n${controller.movieDetail.originalLanguage}",
                            //   textSize: TextSize.large,
                            // ),
                            TextWidget(
                              "Budget: \n${controller.movieDetail.budget}",
                              textSize: TextSize.large,
                            ),
                            TextWidget(
                              "Revenue: \n${controller.movieDetail.revenue}",
                              textSize: TextSize.large,
                            ),
                            TextWidget(
                              "Runtime: \n${controller.movieDetail.runtime} Minutes",
                              textSize: TextSize.large,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const TextWidget("Original Title:"),
                        TextWidget(
                          controller.movieDetail.originalTitle ?? '',
                          textSize: TextSize.large,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: TextWidget(
                            controller.movieDetail.tagLine ?? '',
                            textSize: TextSize.large,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        const TextWidget(
                          "Overview",
                          textSize: TextSize.large,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextWidget(
                            controller.movieDetail.overview ?? '',
                            textSize: TextSize.large,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        const TextWidget(
                          "Genres",
                          textSize: TextSize.large,
                        ),
                        TextWidget("${controller.movieDetail.genres}")
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
