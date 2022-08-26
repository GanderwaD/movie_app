import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie.dart';
import 'package:movie_app/src/ui/movies/movie_service.dart';

import '../../widgets/paginated_list/paginated_list.dart';

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
    setLoadingPopularMovies(true);
    await Future.delayed(const Duration(seconds: 1));
    popularMovies = await _service.getPopularMovies();
    setLoadingPopularMovies(false);
    notifyListeners();
  }

  Future getTopMovies() async {
    await Future.delayed(const Duration(seconds: 1));
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
    await Future.delayed(const Duration(seconds: 1));
    await getPopularMovies();
    moviePaginatedController.refreshCompleted();
    notifyListeners();
  }
}
