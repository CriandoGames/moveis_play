import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/infra/shared/theme_extensions.dart';
import 'package:the_movies/presenter/favorites/favorites_page.dart';
import 'package:the_movies/presenter/moveis/moveis_page.dart';
import 'package:the_movies/presenter/moveis/movies_bindng.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: context.themeRed,
            unselectedItemColor: context.themeGrey,
            currentIndex: controller.pageindex,
            onTap: controller.gotoPage,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: 'exit',
              ),
            ]),
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/movies':
              return GetPageRoute(
                  settings: settings, page: () => const MoveisPage(), binding: MoviesBindng());
            case '/favorite':
              return GetPageRoute(
                  settings: settings, page: () => const FavoritePage());
            default:
              return GetPageRoute(
                  settings: settings, page: () => const MoveisPage());
          }
        },
      ),
    );
  }
}
