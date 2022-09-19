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
import 'package:movie_app/src/ui/home/home_controller.dart';
import 'package:movie_app/src/ui/movie_detail/movie_details_controller.dart';
import 'package:movie_app/src/ui/person/actor_details_view.dart';
import 'package:movie_app/src/ui/shared/widgets/bases/base_scaffold.dart';
import 'package:movie_app/src/ui/shared/widgets/image/cached_network_image.dart';
import 'package:movie_app/src/ui/shared/widgets/theme/colors.dart';

import '../../router/router_constants.dart';
import '../../router/router_helper.dart';
import '../../router/router_object.dart';
import '../shared/widgets/animations/slide_transform/default_transform.dart';
import '../shared/widgets/movie_box.dart';
import '../shared/widgets/page/page_slider.dart';
import '../shared/widgets/paginated_list/indicator/classic_indicator.dart';
import '../shared/widgets/paginated_list/paginated_list.dart';
import '../shared/widgets/text_widget/text_size.dart';
import '../shared/widgets/text_widget/text_widget.dart';
import 'movie_image_view.dart';

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
    final homeViewController = ref.watch(homeProvider);
    return BaseScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _getBackdropImage(context, movieDetailsController),
        ],
        body: _getBody(context, movieDetailsController, homeViewController),
      ),
    );
  }

  _getBackdropImage(BuildContext context, MovieDetailsController controller) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 255,
      pinned: true,
      leading: IconButton(
        onPressed: () => controller.goBack(context),
        icon: const Icon(
          Icons.arrow_back,
          size: 30.0,
          color: brushedSilver,
        ),
      ),
      title: const TextWidget('Details',
          color: brushedSilver,
          maxLines: 1,
          fontFamily: 'FoxCavalier',
          textSize: TextSize.xxlLarge),
      flexibleSpace: controller.isDetailsLoading
          ? Container(
              decoration: const BoxDecoration(gradient: royalAmericanGradient),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(gradient: royalAmericanGradient),
              child: FlexibleSpaceBar(
                background: Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 0),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        child: CNImage(
                            imgUrl: controller.movieDetail.backdropImageUrl,
                            fit: BoxFit.fitWidth),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: FrontBanner(
                            text: controller.movieDetail.title ?? ''),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  _getBody(BuildContext context, MovieDetailsController controller,
      HomeController homeViewController) {
    return Container(
      decoration: const BoxDecoration(gradient: royalAmericanGradient),
      child: PaginatedList(
        controller: controller.movieDetailsPaginatedController,
        onRefresh: () => controller.onRefresh(),
        header: const ClassicHeader(),
        child: controller.isDetailsLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CNImage(
                                    imgUrl:
                                        controller.movieDetail.posterImageUrl),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  "Status: \n${controller.movieDetail.status} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Release Date: \n${controller.movieDetail.releaseDate} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                // TextWidget(
                                //   "Original Language: \n${controller.movieDetail.originalLanguage}",
                                //   textSize: TextSize.large,
                                // ),
                                TextWidget(
                                  "Budget: \n\$${controller.movieDetail.budget} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Revenue: \n\$${controller.movieDetail.revenue} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Runtime: \n${controller.movieDetail.runtime} Minutes",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const TextWidget(
                                "-----------------------------------------------"),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextWidget(
                              "Original Title:",
                              fontFamily: 'SanFrancisco',
                            ),
                            TextWidget(
                              controller.movieDetail.originalTitle ?? '',
                              textSize: TextSize.large,
                              fontFamily: 'SanFrancisco',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: TextWidget(
                                controller.movieDetail.tagLine ?? '',
                                textSize: TextSize.large,
                                fontFamily: 'SanFrancisco',
                              ),
                            ),
                            const TextWidget(
                                "-----------------------------------------------"),
                          ],
                        ),
                        Column(
                          children: [
                            const TextWidget(
                              "Overview",
                              textSize: TextSize.large,
                              fontFamily: 'SanFrancisco',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextWidget(
                                controller.movieDetail.overview ?? '',
                                textSize: TextSize.large,
                                fontFamily: 'SanFrancisco',
                              ),
                            ),
                            const TextWidget(
                                "-----------------------------------------------"),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () => R.instance
                                    .add(object: ActorDetailsView(movieId)),
                                child: TextWidget("styledText")),
                            const TextWidget(
                              "Genres",
                              textSize: TextSize.large,
                              fontFamily: 'SanFrancisco',
                            ),
                            TextWidget(controller.getTextWidgets(
                                controller.movieDetail.genres!)),
                            const TextWidget(
                                "-----------------------------------------------"),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(Icons.arrow_back),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                            PageSlider(
                              controller:
                                  homeViewController.homeSliderController,
                              onPageChanged: (index) =>
                                  homeViewController.updatePageIndex(index),
                              slideTransform: const DefaultTransform(),
                              pageBuilder: (index) {
                                return GestureDetector(
                                  onTap: () => R.instance.add(
                                      object: MovieImageView(controller
                                          .backdropImages[index]
                                          .backdropsImageUrl)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CNImage(
                                        imgUrl: controller.backdropImages[index]
                                            .backdropsImageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: controller.backdropImages.length,
                            ),
                          ],
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
