import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:the_movies/infra/modules/module.dart';
import 'package:the_movies/presenter/movie_detail/movie_detail_bindings.dart';
import 'package:the_movies/presenter/movie_detail/movie_detail_page.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routes = [
    GetPage(
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings(),
      name: '/movie/detail',
    ),
  ];
}
