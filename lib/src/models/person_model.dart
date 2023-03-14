import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
 * ---------------------------
 * File : person_model.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/cupertino.dart';

@immutable
class ActorDetail {
  int? id;
  int? gender;
  String? name;
  String? knownFor;
  String? posterPath;
  String? birthDate;
  String? deathDate;
  String? bio;
  ActorDetail({
    this.id,
    this.gender,
    this.name,
    this.knownFor,
    this.posterPath,
    this.birthDate,
    this.deathDate,
    this.bio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'gender': gender,
      'name': name,
      'known_for_department': knownFor,
      'profile_path': posterPath,
      'birthday': birthDate,
      'deathday': deathDate,
      'biography': bio,
    };
  }

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w185$posterPath';

  factory ActorDetail.fromMap(Map<String, dynamic> map) {
    return ActorDetail(
      id: map['id'] ?? 0,
      gender: map['gender'] ?? 3,
      name: map['name'] ?? '',
      knownFor: map['known_for_department'] ?? '',
      posterPath: map['profile_path'] ?? '',
      birthDate: map['birthday'] ?? '',
      deathDate: map['deathday'] ?? '',
      bio: map['biography'] ?? ','
    );
  }

  String toJson() => json.encode(toMap());

  factory ActorDetail.fromJson(String source) =>
      ActorDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
