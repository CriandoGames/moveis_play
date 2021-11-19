import 'package:get/get.dart';
import 'package:the_movies/presenter/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(auherUserService: Get.find()),
        fenix: true);
  }
}
