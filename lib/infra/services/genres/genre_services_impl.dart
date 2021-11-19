import 'package:the_movies/infra/repositories/generes/genres_repository.dart';
import 'package:the_movies/models/genre_model.dart';

import './genre_services.dart';

class GenreServicesImpl implements GenreServices {
  final GenresRepository _genreRepository;

  GenreServicesImpl({required GenresRepository genreRepository})
      : _genreRepository = genreRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genreRepository.getGenres();
}
