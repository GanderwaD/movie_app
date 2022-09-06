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
import 'package:movie_app/src/models/movie_details.dart';
import 'package:movie_app/src/router/router_helper.dart';
import 'package:movie_app/src/ui/movie_detail/movie_details_view.dart';

import '../../models/movie.dart';
import '../widgets/paginated_list/paginated_list.dart';
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
  List<Movie> popularMovies = [];
  List<Movie> topMovies = [];

  void init() async {
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

  onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    init();
    moviePaginatedController.refreshCompleted();
    notifyListeners();
  }
}
