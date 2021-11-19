import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:the_movies/infra/modules/module.dart';
import 'package:the_movies/presenter/login/login_binding.dart';

import 'login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
        page: () => const LoginPage(), name: '/auth', binding: LoginBinding()),
  ];
}
