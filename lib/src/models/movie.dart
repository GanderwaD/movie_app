import 'dart:convert';

class Movie {
  String title;
  String posterPath;
  Movie({
    required this.title,
    required this.posterPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'poster_path': posterPath,
    };
  }

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w185$posterPath';

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
