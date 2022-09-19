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
import '../shared/widgets/paginated_list/paginated_list.dart';

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
  bool loadingPopularMovies = true;
  bool isRefresh = false;
  List<Movie> popularMovies = [];
  int page = 1;

  init() async {
    await getPopularMovies();
    setLoadingPopularMovies(false);
    notifyListeners();
  }

  Future getPopularMovies() async {
    setLoadingPopularMovies(true);
    popularMovies = await _service.getPopularMovies(page);
    setLoadingPopularMovies(false);
    notifyListeners();
  }

  setLoadMore() async {
    page++;
    popularMovies.addAll(await _service.getPopularMovies(page));
    await Future.delayed(const Duration(milliseconds: 500));
    allMoviesPaginatedController.loadComplete();
    notifyListeners();
  }

  setLoadingPopularMovies(bool val) {
    loadingPopularMovies = val;
    notifyListeners();
  }

  setRefreshMovies(bool val) {
    isRefresh = val;
    notifyListeners();
  }

  onRefresh() async {
    setRefreshMovies(true);
    await init();
    allMoviesPaginatedController.refreshCompleted();
    setRefreshMovies(false);
    notifyListeners();
  }

  goBack(context) {
    R.instance.popWidget(context);
  }
}
