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
import 'package:movie_app/src/models/backdrop_image.dart';
import 'package:movie_app/src/models/movie_details.dart';
import 'package:movie_app/src/models/movie_genres.dart';
import 'package:movie_app/src/ui/movie_detail/movie_detail_service.dart';
import 'package:movie_app/src/ui/shared/widgets/paginated_list/paginated_list.dart';

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
  ScrollController movieDetailsScrollController = ScrollController();
  MovieDetail movieDetail = MovieDetail();
  List<BackdropImage> backdropImages = [];
  bool isDetailsLoading = false;
  bool isImagesLoading = false;
  bool isRefresh = false;

  init() async {
    await Future.wait([getMovieDetails(), getMovieImages()]);
  }

  Future getMovieDetails() async {
    setDetailsLoading(true);
    movieDetail = await _service.getMovieDetail(movieId);
    setDetailsLoading(false);
    notifyListeners();
  }

  Future getMovieImages() async {
    setImagesLoading(true);
    backdropImages = await _service.getMovieImages(movieId);
    setImagesLoading(false);
    notifyListeners();
  }

  getTextWidgets(List<Genre> genres) {
    String gens = '[';
    for (var element in genres) {
      gens += '${element.name}, ';
    }
    gens = gens.substring(0, gens.length - 2);
    return '$gens]';
  }

  goBack(context) {
    R.instance.popWidget(context);
  }

  setDetailsLoading(bool val) {
    isDetailsLoading = val;
    notifyListeners();
  }

  setImagesLoading(bool val) {
    isImagesLoading = val;
    notifyListeners();
  }

  setRefresh(bool val) {
    isRefresh = val;
    notifyListeners();
  }

  onRefresh() async {
    await init();
    movieDetailsPaginatedController.refreshCompleted();
    notifyListeners();
  }
}
