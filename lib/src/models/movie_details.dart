// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'movie_genres.dart';

class MovieDetailsModel {
  int budget;
  int id;
  int revenue;
  int runtime;
  int voteCount;
  double voteAverage;
  bool video;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String status;
  String tagLine;
  String title;
  List<Genre> genres;
  MovieDetailsModel({
    required this.budget,
    required this.id,
    required this.revenue,
    required this.runtime,
    required this.voteCount,
    required this.voteAverage,
    required this.video,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.status,
    required this.tagLine,
    required this.title,
    required this.genres,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'budget': budget,
      'id': id,
      'revenue': revenue,
      'runtime': runtime,
      'voteCount': voteCount,
      'voteAverage': voteAverage,
      'video': video,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'status': status,
      'tagLine': tagLine,
      'title': title,
      'genres': genres.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      budget: map['budget'] as int,
      id: map['id'] as int,
      revenue: map['revenue'] as int,
      runtime: map['runtime'] as int,
      voteCount: map['voteCount'] as int,
      voteAverage: map['voteAverage'] as double,
      video: map['video'] as bool,
      originalLanguage: map['originalLanguage'] as String,
      originalTitle: map['originalTitle'] as String,
      overview: map['overview'] as String,
      posterPath: map['posterPath'] as String,
      releaseDate: map['releaseDate'] as String,
      status: map['status'] as String,
      tagLine: map['tagLine'] as String,
      title: map['title'] as String,
      genres: List<Genre>.from((map['genres'] as List<int>).map<Genre>((x) => Genre.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsModel.fromJson(String source) => MovieDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
