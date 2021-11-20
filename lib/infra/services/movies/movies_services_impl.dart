import 'package:the_movies/infra/repositories/movies/movies_repository.dart';
import 'package:the_movies/models/movie_detail_model.dart';
import 'package:the_movies/models/movies_model.dart';

import './movies_services.dart';

class MoviesServicesImpl implements MoviesServices {
  final MoviesRepository _moviesRepository;

  MoviesServicesImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MoviesModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MoviesModel>> getTopRetedMovies() =>
      _moviesRepository.getTopRetedMovies();

  @override
  Future<MovieDetailModel?> getMovieDetail(int id) =>
      _moviesRepository.getMovieDetail(id);
}
