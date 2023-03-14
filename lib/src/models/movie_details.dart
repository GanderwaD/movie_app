/*
 * ---------------------------
 * File : movie_details.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'movie_genres.dart';

class MovieDetail {
  int? budget;
  int? id;
  int? revenue;
  int? runtime;
  int? voteCount;
  double? voteAverage;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  String? status;
  String? tagLine;
  String? title;
  List<Genre>? genres;
  MovieDetail({
    this.budget,
    this.id,
    this.revenue,
    this.runtime,
    this.voteCount,
    this.voteAverage,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.status,
    this.tagLine,
    this.title,
    this.genres,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'budget': budget,
      'id': id,
      'revenue': revenue,
      'runtime': runtime,
      'vote_count': voteCount,
      'vote_average': voteAverage,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'release_date': releaseDate,
      'status': status,
      'tagline': tagLine,
      'title': title,
      'genres': genres?.map((x) => x.toMap()).toList(),
    };
  }

  String get posterImageUrl => 'https://image.tmdb.org/t/p/w185$posterPath';
  String get backdropImageUrl =>
      'https://image.tmdb.org/t/p/w1280$backdropPath';

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      budget: map['budget'],
      id: map['id'],
      revenue: map['revenue'],
      runtime: map['runtime'],
      voteCount: map['vote_count'],
      voteAverage: map['vote_average'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      releaseDate: map['release_date'],
      status: map['status'],
      tagLine: map['tagline'],
      title: map['title'],
      genres: map['genres'] != null
          ? List<Genre>.from(
              (map['genres']).map<Genre>(
                (x) => Genre.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
