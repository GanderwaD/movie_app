import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_helper.dart';
import '../widgets/paginated_list/paginated_list.dart';

final allMoviesProvider = ChangeNotifierProvider((ref) {
  return AllMoviesController();
});

class AllMoviesController extends ChangeNotifier {
  AllMoviesController() {
    init();
  }
  PaginatedController allMoviesPaginatedController = PaginatedController();

  void init() {}

  goBack(context) {
    R.instance.popWidget(context);
  }
}
