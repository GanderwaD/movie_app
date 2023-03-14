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
  final TextEditingController searchTextEditingController =
      TextEditingController();

  int page = 1;
  bool isLoading = true;
  PaginatedController searchPaginatedController = PaginatedController();
  List<Movie> searchMoviesList = [];
  String? searchText;

  void init() {
    setLoading(true);
  }

  getSearchBar() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (searchTextEditingController.hasListeners) {
      searchTextEditingController.addListener(() {
        if (searchTextEditingController.text.isNotEmpty &&
            searchTextEditingController.text.trim().length > 2) {
          getSearch(searchTextEditingController.text.trim());
        }
        if (searchTextEditingController.text.isEmpty) {
          searchMoviesList.clear();
          notifyListeners();
        }
      });
    }
    notifyListeners();
  }

  Future getSearch(String query) async {
    setLoading(true);
    searchMoviesList = await _service.getSearch(page, query);
    setLoading(false);
    notifyListeners();
  }

  onLoadMore() async {
    setLoading(true);
    page++;
    searchMoviesList.addAll(await _service.getSearch(page, searchText ?? ''));
    setLoading(false);
    searchPaginatedController.loadComplete();
    notifyListeners();
  }

  setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    searchPaginatedController.refreshCompleted();
    notifyListeners();
  }
}
