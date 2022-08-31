import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/models/backdrop_image.dart';
import 'package:movie_app/src/models/movie_details.dart';

import '../../../app_config.dart';

final movieDetailServiceProvider = Provider<MovieDetailService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieDetailService(config, Dio());
});

class MovieDetailService {
  MovieDetailService(
    this._environmentConfig,
    this._dio,
  );

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  ///Movie details endpoint
  Future<MovieDetail> getMovieDetail(int movieId) async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/$movieId?api_key=${_environmentConfig.movieApiKey}&language=en-US",
    );

    return MovieDetail.fromMap(response.data);
  }

  Future<List<BackdropImage>> getMovieImages(int movieId) async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/$movieId/images?api_key=${_environmentConfig.movieApiKey}",
    );
    final results = List<Map<String, dynamic>>.from(response.data['backdrops']);

    List<BackdropImage> images = results
        .map((movieImage) => BackdropImage.fromMap(movieImage))
        .toList(growable: false);
    return images;
  }
}
