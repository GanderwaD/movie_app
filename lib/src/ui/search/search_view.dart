import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/shared/base_scaffold.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/text_widget/text_size.dart';
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          pinned: true,
          leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu, size: 30.0),
          ),
          backgroundColor: Colors.red,
          title: const TextWidget('Search',
              color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
        ),
        SliverToBoxAdapter(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.blue,
              focusedBorder: _border(Colors.amber),
              border: _border(Colors.grey),
              enabledBorder: _border(Colors.grey),
              hintText: 'Start brand search',
              prefixIcon: const Icon( 
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}
