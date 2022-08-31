// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BackdropImage {
  int? height;
  double? aspectRatio;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  BackdropImage({
    this.height,
    this.aspectRatio,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  String get backdropsImageUrl => 'https://image.tmdb.org/t/p/w1280$filePath';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'aspect_ratio': aspectRatio,
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }

  factory BackdropImage.fromMap(Map<String, dynamic> map) {
    return BackdropImage(
      height: map['height'] ?? 0,
      aspectRatio: (map['aspect_ratio'] ?? 0).toDouble(),
      filePath: map['file_path'] ?? '',
      voteAverage: map['vote_average'] ?? 0,
      voteCount: map['vote_count'] ?? 0,
      width: map['width'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BackdropImage.fromJson(String source) =>
      BackdropImage.fromMap(json.decode(source));
}
