import 'dart:convert';

class MoviesModel {
  final int id;
  final String title;
  final String relaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;

  MoviesModel(
      {required this.id,
      required this.title,
      required this.relaseDate,
      required this.posterPath,
      required this.genres,
      required this.favorite});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'release_date': relaseDate,
      'poster_path': posterPath,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  factory MoviesModel.fromJson(Map<String, dynamic> map) {
    return MoviesModel(
      id: map['id'],
      title: map['title'],
      relaseDate: map['release_date'],
      posterPath: map['poster_path'],
      genres: List<int>.from(map['genre_ids']),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
}
