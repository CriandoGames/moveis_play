import 'package:get/get.dart';
import 'package:the_movies/infra/mixin/message_mixin.dart';

import 'package:the_movies/infra/services/genres/genre_services.dart';
import 'package:the_movies/infra/services/movies/movies_services.dart';
import 'package:the_movies/models/genre_model.dart';
import 'package:the_movies/models/movies_model.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenreServices _genreServices;
  final MoviesServices _moviesServices;

  final _message = Rxn<MessageModel>();
  final _listGenres = <GenreModel>[].obs;
  final popularMovies = <MoviesModel>[].obs;
  final topRateMovies = <MoviesModel>[].obs;

  var _popularMoviesOriginal = <MoviesModel>[];
  var _topRateMoviesOriginal = <MoviesModel>[];

  final genreSelected = Rxn<GenreModel>();

  List<GenreModel> get listGenres => _listGenres;

  MoviesController({
    required GenreServices genreServices,
    required MoviesServices moviesServices,
  })  : _genreServices = genreServices,
        _moviesServices = moviesServices;

  @override
  void onInit() {
    messageListener(_message);
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      final genres = await _genreServices.getGenres();
      _listGenres.assignAll(genres);

      final popularMoviesData = await _moviesServices.getPopularMovies();
      _popularMoviesOriginal = popularMoviesData;

      final topRateMoviesData = await _moviesServices.getTopRetedMovies();
      _topRateMoviesOriginal = topRateMoviesData;

      popularMovies.assignAll(popularMoviesData);
      topRateMovies.assignAll(topRateMoviesData);
    } catch (e) {
      _message(
        MessageModel.error('Erro', 'Erro ao buscar Categorias'),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newlist = _popularMoviesOriginal.where((value) {
        return value.title.toLowerCase().contains(title.toLowerCase());
      });

      var newListTopRate = _topRateMoviesOriginal.where((value) {
        return value.title.toLowerCase().contains(title.toLowerCase());
      });

      popularMovies.assignAll(newlist);
      topRateMovies.assignAll(newListTopRate);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRateMovies.assignAll(_topRateMoviesOriginal);
    }
  }

  void filterMoviesByGenre(GenreModel? genreModel) {
    var genreFilter = genreModel;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }

    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      var newlist = _popularMoviesOriginal.where((value) {
        return value.genres.contains(genreFilter?.id);
      });

      var newListTopRate = _topRateMoviesOriginal.where((value) {
        return value.genres.contains(genreFilter?.id);
      });

      popularMovies.assignAll(newlist);
      topRateMovies.assignAll(newListTopRate);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRateMovies.assignAll(_topRateMoviesOriginal);
    }
  }
}
