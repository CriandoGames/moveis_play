import 'package:the_movies/models/movies_model.dart';

abstract class MoviesRepository {
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRetedMovies();
}
