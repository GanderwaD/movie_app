import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/shared/base_scaffold.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/text_widget/text_size.dart';
import '../../widgets/theme/colors.dart';
import '../shared/drawer.dart';

class SearchView extends ConsumerWidget with RouterObject {
  const SearchView({Key? key}) : super(key: key);

  @override
  String get routeKey => searchKey;

  @override
  String get routePath => searchPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      body: _getBody(context),
      drawer: const Drawer(
        child: GetDrawer(),
      ),
    );
  }

  _getBody(context) {
    return Container(
      color: redwood,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            leading: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, size: 30.0),
            ),
            backgroundColor: redwood,
            title: const TextWidget('Search',
                color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextFormField(
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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: modernGray,
                  child: Text('Movie Banner ${index+1}'),
                );
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
