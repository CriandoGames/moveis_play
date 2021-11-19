import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<UserCredential> auth();

  Future<void> logout();
}
