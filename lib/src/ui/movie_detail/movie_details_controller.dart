/*
 * ---------------------------
 * File : movie_details_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/movie_details.dart';
import 'package:movie_app/src/ui/movie_detail/movie_detail_service.dart';
import 'package:movie_app/src/ui/widgets/paginated_list/paginated_list.dart';

import '../../router/router_helper.dart';

final movieDetailsProvider =
    ChangeNotifierProvider.family<MovieDetailsController, int>((ref, movieId) {
  var movieDetailService = ref.read(movieDetailServiceProvider);
  return MovieDetailsController(
    movieId,
    movieDetailService,
  );
});

class MovieDetailsController extends ChangeNotifier {
  MovieDetailsController(this.movieId, this._service) {
    init();
  }
  final int movieId;
  final MovieDetailService _service;
  PaginatedController movieDetailsPaginatedController = PaginatedController();
  MovieDetail movieDetail = MovieDetail();

  void init() async {
    movieDetail = await _service.getMovieDetail(movieId);
    notifyListeners();
  }

  goBack(context) {
    R.instance.popWidget(context);
  }

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    movieDetailsPaginatedController.refreshCompleted();
    notifyListeners();
  }
}
