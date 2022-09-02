/*
 * ---------------------------
 * File : all_movies_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie.dart';
import '../../router/router_helper.dart';
import '../movies/movie_service.dart';
import '../widgets/paginated_list/paginated_list.dart';

final allMoviesProvider = ChangeNotifierProvider((ref) {
  var movieService = ref.read(movieServiceProvider);
  return AllMoviesController(movieService);
});

class AllMoviesController extends ChangeNotifier {
  AllMoviesController(this._service) {
    init();
  }
  final MovieService _service;
  PaginatedController allMoviesPaginatedController = PaginatedController();
  bool loadingPopularMovies = false;
  List<Movie> popularMovies = [];
  List<Movie> morePopularMovies = [];
  int page = 1;

  void init() async {
    await Future.wait([getPopularMovies()]);
  }

  Future getPopularMovies() async {
    setLoadingPopularMovies(true);
    await Future.delayed(const Duration(seconds: 1));
    popularMovies = await _service.getPopularMovies(page);
    setLoadingPopularMovies(false);
    notifyListeners();
  }

  Future fetchMorePopularMovies() async {
    await Future.delayed(const Duration(seconds: 1));
    page++;
    morePopularMovies = await _service.getPopularMovies(page);
    notifyListeners();
  }

  setLoadMore() {
    fetchMorePopularMovies();
    popularMovies.addAll(morePopularMovies);
    allMoviesPaginatedController.loadComplete();
    notifyListeners();
  }

  setLoadingPopularMovies(bool val) {
    loadingPopularMovies = val;
    notifyListeners();
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    init();
    allMoviesPaginatedController.refreshCompleted();
    notifyListeners();
  }

  goBack(context) {
    R.instance.popWidget(context);
  }
}
