import 'package:the_movies/models/genre_model.dart';

abstract class GenreServices {
  Future<List<GenreModel>> getGenres();
}
