import 'package:get/get.dart';
import 'package:the_movies/infra/repositories/generes/genres_repository.dart';
import 'package:the_movies/infra/repositories/generes/genres_repository_impl.dart';
import 'package:the_movies/infra/services/genres/genre_services.dart';
import 'package:the_movies/infra/services/genres/genre_services_impl.dart';
import 'package:the_movies/infra/shared/rest_client/rest_client.dart';
import 'package:the_movies/presenter/moveis/movies_controller.dart';

class MoviesBindng implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find<RestClient>()));

    Get.lazyPut<GenreServices>(
        () => GenreServicesImpl(genreRepository: Get.find<GenresRepository>()));

    Get.lazyPut<MoviesController>(
        () => MoviesController(genreServices: Get.find<GenreServices>()));
  }
}
