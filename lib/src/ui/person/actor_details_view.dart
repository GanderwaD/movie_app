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
import 'package:movie_app/src/ui/person/actor_controller.dart';
import 'package:movie_app/src/ui/shared/widgets/bases/base_scaffold.dart';
import 'package:movie_app/src/ui/shared/widgets/image/cached_network_image.dart';
import 'package:movie_app/src/ui/shared/widgets/theme/colors.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../shared/widgets/paginated_list/indicator/classic_indicator.dart';
import '../shared/widgets/paginated_list/paginated_list.dart';
import '../shared/widgets/text_widget/text_size.dart';
import '../shared/widgets/text_widget/text_widget.dart';

class ActorDetailsView extends ConsumerWidget with RouterObject {
  const ActorDetailsView(
    this.movieId, {
    Key? key,
  }) : super(key: key);

  final int movieId;

  @override
  String get routeKey => actorDetailsKey;

  @override
  String get routePath => actorDetailsPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorController = ref.watch(actorDetailsProvider(movieId));
    //final movieDetailsController = ref.watch(movieDetailsProvider(movieId));
    final homeViewController = ref.watch(homeProvider);
    return BaseScaffold(
      body: _getBody(context, actorController, homeViewController),
    );
  }

  _getBody(BuildContext context, ActorDetailsController controller,
      HomeController homeViewController) {
    return Container(
      decoration: const BoxDecoration(gradient: royalAmericanGradient),
      child: PaginatedList(
        controller: controller.actorDetailsPaginatedController,
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
                                        controller.actorDetail.fullImageUrl),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  "Status: \n${controller.actorDetail.name} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Release Date: \n${controller.actorDetail.birthDate} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Budget: \n\$${controller.actorDetail.deathDate} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Revenue: \n\$${controller.actorDetail.gender} \n------------------",
                                  textSize: TextSize.large,
                                  fontFamily: 'SanFrancisco',
                                ),
                                TextWidget(
                                  "Runtime: \n${controller.actorDetail.knownFor} Minutes",
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
                              "Overview",
                              textSize: TextSize.large,
                              fontFamily: 'SanFrancisco',
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextWidget(
                                controller.actorDetail.bio ?? '',
                                textSize: TextSize.large,
                                fontFamily: 'SanFrancisco',
                              ),
                            ),
                            const TextWidget(
                                "-----------------------------------------------"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
