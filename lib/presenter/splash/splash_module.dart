import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:the_movies/infra/modules/module.dart';
import 'package:the_movies/presenter/splash/splash_Page.dart';
import 'package:the_movies/presenter/splash/splash_binding.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
        page: () => const SplashPage(), name: '/', binding: SplashBinding()),
  ];
}
