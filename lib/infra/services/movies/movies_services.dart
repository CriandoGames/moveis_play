import 'package:the_movies/models/movie_detail_model.dart';
import 'package:the_movies/models/movies_model.dart';

abstract class MoviesServices {
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRetedMovies();
  Future<MovieDetailModel?> getMovieDetail(int id);
}