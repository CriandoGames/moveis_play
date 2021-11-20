import 'cast_model.dart';
import 'genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> images;
  final String releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;

  MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.images,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> map) {
    var urlImagesPoster = map['images']['posters'];
    var urlimage = urlImagesPoster.map((e) => 'https://image.tmdb.org/t/p/w500/${e['file_path']}')
        .toList()
        .cast<String>()
        .toList();

    return MovieDetailModel(
        title: map['title'] ?? '',
        stars: map['vote_average'] ?? 0.0,
        genres: List<GenreModel>.from(
            map['genres']?.map((x) => GenreModel.fromJson(x))),
        images: urlimage,
        releaseDate: map['release_date'],
        overview: map['overview'],
        productionCompanies: List<dynamic>.from(map['production_companies']).map<String>((e) => e['name']).toList(),
        originalLanguage: map['original_language'],
        cast: List<CastModel>.from(
            map['credits']['cast'].map((x) => CastModel.fromJson(x))));
  }
}
