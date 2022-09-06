/*
 * ---------------------------
 * File : search_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/router/router_helper.dart';
import 'package:movie_app/src/ui/account/account_view.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../utils/keyboard_utils.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/paginated_list/paginated_list.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';
import '../widgets/theme/colors.dart';
import 'search_controller.dart';

class SearchView extends ConsumerWidget with RouterObject {
  const SearchView({Key? key}) : super(key: key);

  @override
  String get routeKey => searchKey;

  @override
  String get routePath => searchPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchProvider);
    return BaseScaffold(
      body: _getBody(context, searchController),
      // drawer: const Drawer(
      //   child: GetDrawer(),
      // ),
    );
  }

  _getBody(BuildContext context, SearchController searchController) {
    return Container(
      decoration: const BoxDecoration(gradient: primaryGradient),
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: PaginatedList(
          controller: searchController.searchPaginatedController,
          onRefresh: () => searchController.onRefresh(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                leading: IconButton(
                  onPressed: () => R.instance.add(object: AccountView()),
                  icon: const Icon(Icons.account_circle_outlined, size: 30.0),
                ),
                backgroundColor: redwood,
                title: const TextWidget('Search',
                    color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                    controller: searchController.textEditingController,
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
              // SliverGrid(
              //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 200.0,
              //       mainAxisSpacing: 6.0,
              //       crossAxisSpacing: 6.0),
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           log("$index");
              //           hideKeyboard(context);
              //         },
              //         child: Container(
              //           alignment: Alignment.center,
              //           color: modernGray,
              //           child: Text('Movie Banner $index'),
              //         ),
              //       );
              //     },
              //     childCount: 10,
              //   ),
              // )
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
