/*
 * ---------------------------
 * File : search_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/router/router_helper.dart';
import 'package:movie_app/src/ui/account/auth_checker.dart';
import 'package:movie_app/src/ui/shared/widgets/movie_box.dart';
import 'package:movie_app/src/ui/shared/widgets/paginated_list/indicator/classic_indicator.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../utils/keyboard_utils.dart';
import '../movie_detail/movie_details_view.dart';
import '../shared/widgets/bases/base_scaffold.dart';
import '../shared/widgets/paginated_list/paginated_list.dart';
import '../shared/widgets/text_widget/text_size.dart';
import '../shared/widgets/text_widget/text_widget.dart';
import '../shared/widgets/theme/colors.dart';
import 'search_controller.dart';

class SearchView extends ConsumerWidget with RouterObject {
  const SearchView({Key? key}) : super(key: key);

  @override
  String get routeKey => searchKey;

  @override
  String get routePath => searchPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    return BaseScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _getAppbar(context, searchController),
        ],
        body: _getBody(context, searchController),
      ),
    );
  }

  _getAppbar(BuildContext context, SearchController controller) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      leading: IconButton(
        onPressed: () => R.instance.add(object: const AuthChecker()),
        icon: const Icon(Icons.account_circle_outlined,
            color: brushedSilver, size: 30.0),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: deepMetalAppBarGradient,
        ),
      ),
      title: const TextWidget(
        'Search',
        color: brushedSilver,
        maxLines: 1,
        fontFamily: 'FoxCavalier',
        textSize: TextSize.xxlLarge,
      ),
    );
  }

  _getBody(BuildContext context, SearchController searchController) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            deepSpaceSparkle,
            gunMetal,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: PaginatedList(
          header: const ClassicHeader(),
          footer: const ClassicFooter(),
          controller: searchController.searchPaginatedController,
          onRefresh: () => searchController.onRefresh(),
          enablePullUp: true,
          onLoading: () => searchController.onLoadMore(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                    controller: searchController.searchTextEditingController,
                    onEditingComplete: () => searchController.getSearchBar(),
                    //onChanged: (value) => searchController.getSearchBar(),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.blue,
                      focusColor: Colors.blue,
                      focusedBorder: _border(glaucous),
                      border: _border(Colors.grey),
                      enabledBorder: _border(Colors.grey),
                      hintText: 'Start movie search',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              searchController.isLoading
                  ? const SliverToBoxAdapter(
                      child: Center(
                          heightFactor: 20,
                          child: TextWidget(
                            "Start Searching For Movies",
                            color: frenchFuchsia,
                          )),
                    )
                  : SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0,
                              childAspectRatio: 0.6,
                              mainAxisSpacing: 6.0,
                              crossAxisSpacing: 6.0),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          var movie = searchController.searchMoviesList[index];
                          return GestureDetector(
                            onTap: () {
                              R.instance
                                  .add(object: MovieDetailsView(movie.id));
                              log("box ${movie.id}");
                            },
                            child: MovieBox(movie: movie),
                          );
                        },
                        //number of items in movie_view page
                        childCount: searchController.searchMoviesList.length,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
