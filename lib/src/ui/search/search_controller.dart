/*
 * ---------------------------
 * File : search_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie.dart';
import 'package:movie_app/src/ui/search/search_service.dart';

import '../shared/widgets/paginated_list/paginated_list.dart';

final searchControllerProvider = ChangeNotifierProvider((ref) {
  var searchService = ref.read(searchServiceProvider);
  return SearchController(searchService);
});

class SearchController extends ChangeNotifier {
  SearchController(this._service) {
    init();
  }

  final SearchService _service;
  final TextEditingController textEditingController = TextEditingController();

  int page = 1;

  PaginatedController searchPaginatedController = PaginatedController();
  List<Movie> search = [];
  String? searchText;

  void init() {}

  Future getSearch(String query) async {
    search = await _service.getSearch(page, query);
    searchText = query;
    notifyListeners();
  }

  setLoadMore() async {
    page++;
    search.addAll(await _service.getSearch(page, searchText?? ''));
    await Future.delayed(const Duration(milliseconds: 500));
    searchPaginatedController.loadComplete();
    notifyListeners();
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    searchPaginatedController.refreshCompleted();
    notifyListeners();
  }
}
