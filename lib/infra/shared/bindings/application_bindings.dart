import 'package:get/get.dart';
import 'package:the_movies/infra/repositories/auth/auth_repository.dart';
import 'package:the_movies/infra/repositories/auth/auth_repository_impl.dart';
import 'package:the_movies/infra/repositories/movies/movies_repository.dart';
import 'package:the_movies/infra/repositories/movies/movies_repository_impl.dart';
import 'package:the_movies/infra/services/auth/auth_services.dart';
import 'package:the_movies/infra/services/auth/auth_services_impl.dart';
import 'package:the_movies/infra/services/movies/movies_services.dart';
import 'package:the_movies/infra/services/movies/movies_services_impl.dart';
import 'package:the_movies/infra/shared/rest_client/rest_client.dart';
import 'package:the_movies/infra/shared/user/auher_user_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut<AuthServices>(
        () => AuthServicesImpl(authRepository: Get.find<AuthRepository>()),
        fenix: true);

    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find<RestClient>()),
        fenix: true);
    Get.lazyPut<MoviesServices>(
        () =>
            MoviesServicesImpl(moviesRepository: Get.find<MoviesRepository>()),
        fenix: true);

    Get.put(AuherUserService().init());
  }
}
