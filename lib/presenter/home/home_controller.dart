import 'package:get/get.dart';
import 'package:the_movies/infra/services/auth/auth_services.dart';


class HomeController extends GetxController {
  final _pageindex = 0.obs;

  final AuthServices _auherUserService;
  // ignore: constant_identifier_names
  static const int NAVIGATOR_KEY = 1;
  // ignore: constant_identifier_names
  static const int INDEX_PAGE_EXIT = 2;

  HomeController({required AuthServices auherUserService})
      : _auherUserService = auherUserService;

  int get pageindex => _pageindex.value;

  void gotoPage(int page) {
    if (page == INDEX_PAGE_EXIT) {
      _auherUserService.logout();
      
    } else {
      _pageindex.value = page;
    }

    _pageindex(page);
    switch (page) {
      case 0:
        Get.offNamed('/home', id: NAVIGATOR_KEY);
        break;
      case 1:
        Get.offNamed('/favorite', id: NAVIGATOR_KEY);
        break;
    }
  }
}
