/*
 * ---------------------------
 * File : movie_service.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_config.dart';
import '../../models/movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.watch(environmentConfigProvider);

  return MovieService(config, Dio());
});

class MovieService {
  MovieService(
    this._environmentConfig,
    this._dio,
  );
  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

  ///Popular movie endpoint
  Future<List<Movie>> getPopularMovies(int page) async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-Us&page=$page",
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<Movie> movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: true);
    return movies;
  }

  ///Top movie endpoint
  Future<List<Movie>> getTopMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${_environmentConfig.movieApiKey}&language=en-US",
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<Movie> movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: false);
    return movies;
  }
}
