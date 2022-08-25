import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/app_config.dart';

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

  Future<List<Movie>> getPopularMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=${_environmentConfig.movieApiKey}&language=en-US",
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<Movie> movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: false);
    return movies;
  }

  Future<List<Movie>> getLatestMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/latest?api_key=${_environmentConfig.movieApiKey}&language=en-US",
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<Movie> movies = results
        .map((movieData) => Movie.fromMap(movieData))
        .toList(growable: false);
    return movies;
  }
}
