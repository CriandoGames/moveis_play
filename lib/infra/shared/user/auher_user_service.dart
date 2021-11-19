import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuherUserService extends GetxService {


  User? user;

  void init() async {
     FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/auth');
      }
    });
  }

  
}
