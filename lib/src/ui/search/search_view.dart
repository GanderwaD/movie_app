import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/shared/base_scaffold.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';

class SearchView extends ConsumerWidget with RouterObject {
  const SearchView({Key? key}) : super(key: key);

  @override
  String get routeKey => searchKey;
  
  @override
  String get routePath => searchPath;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return BaseScaffold(body: Center(child: TextWidget("search"),));
  }
}