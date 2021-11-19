
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:the_movies/infra/modules/module.dart';

import 'home_binding.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: '/home',
      page: () =>  const HomePage(),
      binding: HomeBinding(),
    ),
  ];
 
  
}