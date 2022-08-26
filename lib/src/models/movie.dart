import 'dart:convert';

class Movie {
  String title;
  String posterPath;
  double voteAverage;
  //int voteCount;
  Movie({
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    //required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      //'vote_count': voteAverage,
    };
  }

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w185$posterPath';

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
      voteAverage: (map['vote_average'] ?? 0).toDouble(),
      //voteCount: map['vote_count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
