/*
 * ---------------------------
 * File : movie_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie.dart';
import '../shared/widgets/paginated_list/paginated_list.dart';
import 'movie_service.dart';

final movieControllerProvider = ChangeNotifierProvider((ref) {
  var movieService = ref.read(movieServiceProvider);
  return MovieController(movieService);
});

class MovieController extends ChangeNotifier {
  MovieController(this._service) {
    init();
  }
  final MovieService _service;

  PaginatedController moviePaginatedController = PaginatedController();
  bool loadingPopularMovies = true;
  bool loadingTopMovies = true;
  bool isRefresh = false;
  List<Movie> popularMovies = [];
  List<Movie> topMovies = [];

  init() async {
    await Future.wait([getPopularMovies(), getTopMovies()]);
  }

  Future getPopularMovies() async {
    await Future.delayed(const Duration(milliseconds: 500));
    popularMovies = await _service.getPopularMovies(1);
    setLoadingPopularMovies(false);
    notifyListeners();
  }

  Future getTopMovies() async {
    await Future.delayed(const Duration(milliseconds: 500));
    topMovies = await _service.getTopMovies();
    setLoadingTopMovies(false);
    notifyListeners();
  }

  setLoadingTopMovies(bool val) {
    loadingTopMovies = val;
    notifyListeners();
  }

  setLoadingPopularMovies(bool val) {
    loadingPopularMovies = val;
    notifyListeners();
  }

  setRefresh(bool val) {
    isRefresh = val;
    notifyListeners();
  }

  onRefresh() async {
    setRefresh(true);
    await init();
    moviePaginatedController.refreshCompleted();
    setRefresh(false);
    notifyListeners();
  }
}
