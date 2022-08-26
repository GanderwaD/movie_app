import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/paginated_list/paginated_list.dart';

final searchProvider = ChangeNotifierProvider((ref) {
  return SearchController();
});

class SearchController extends ChangeNotifier {
  SearchController() {
    init();
  }
  final TextEditingController textEditingController = TextEditingController();
  PaginatedController searchPaginatedController = PaginatedController();

  void init() {}

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    searchPaginatedController.refreshCompleted();
    notifyListeners();
  }
}
