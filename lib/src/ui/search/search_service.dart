/*
 * ---------------------------
 * File : search_service.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/app_config.dart';

import '../../models/movie.dart';

final searchServiceProvider = Provider<SearchService>((ref) {
  final config = ref.watch(environmentConfigProvider);
  return SearchService(config,Dio());
});

class SearchService {
  SearchService(
    this._environmentConfig,
    this._dio,
  );

  final EnvironmentConfig _environmentConfig;
  final Dio _dio;

   Future<List<Movie>> getSearch(int page,String query) async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/search/movie?api_key=${_environmentConfig.movieApiKey}&query=$query&page=$page",
    );
    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<Movie> search = results
        .map((searchData) => Movie.fromMap(searchData))
        .toList(growable: true);
    return search;
  }
}
