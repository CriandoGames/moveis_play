import 'package:get/get.dart';
import 'package:the_movies/infra/mixin/loader_mixin.dart';
import 'package:the_movies/infra/mixin/message_mixin.dart';
import 'package:the_movies/infra/services/movies/movies_services.dart';
import 'package:the_movies/models/movie_detail_model.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessageMixin {
  final MoviesServices _movieService;

  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final movie = Rxn<MovieDetailModel>();
  MovieDetailController({required MoviesServices movieService})
      : _movieService = movieService;

  final showPanel = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadrListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final movideId = Get.arguments as int;
      loading(true);
      var movie = await _movieService.getMovieDetail(movideId);
      this.movie.value = movie;
      loading(false);
    // ignore: unused_catch_clause
    } on Exception catch (e) {
      loading(false);
      message(MessageModel.error(
        'Erro',
        'Ocorreu um erro ao carregar os detalhes do filme',
      ));
    }
  }
}
