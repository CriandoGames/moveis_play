import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movies/infra/shared/app_ui_config.dart';
import 'package:the_movies/presenter/home/home_module.dart';
import 'package:the_movies/presenter/login/login_module.dart';
import 'package:the_movies/presenter/splash/splash_module.dart';

import 'infra/shared/bindings/application_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppUiConfig.title,
      theme: AppUiConfig.theme,
      initialBinding: ApplicationBindings(),
      getPages: [...SplashModule().routes,
       ...LoginModule().routes,
       ...HomeModule().routes],
    );
  }
}
