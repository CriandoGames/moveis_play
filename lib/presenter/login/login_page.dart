import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:the_movies/presenter/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset('assets/images/splash.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                  height: 42,
                  width: MediaQuery.of(context).size.width * .9,
                  child: SignInButton(Buttons.Google,
                      onPressed: controller.auth,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ],
          ),
        ],
      ),
    );
  }
}
