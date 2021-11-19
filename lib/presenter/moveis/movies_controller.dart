import 'package:get/get.dart';
import 'package:the_movies/infra/mixin/message_mixin.dart';

import 'package:the_movies/infra/services/genres/genre_services.dart';
import 'package:the_movies/models/genre_model.dart';

class MoviesController extends GetxController with MessageMixin {
  final GenreServices _genreServices;
  final message = Rxn<MessageModel>();
  final _listGenres = <GenreModel>[].obs;


  List<GenreModel> get listGenres => _listGenres;

  MoviesController({
    required GenreServices genreServices,
  }) : _genreServices = genreServices;

  @override
  void onInit() {
    messageListener(message);
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      final genres = await _genreServices.getGenres();
      _listGenres.assignAll(genres);
    } catch (e) {
      message(
        MessageModel.error('Erro', 'Erro ao buscar Genres aaa aa'),
      );
    }
  }
}
