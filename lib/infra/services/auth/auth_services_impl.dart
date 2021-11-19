import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_movies/infra/repositories/auth/auth_repository.dart';

import './auth_services.dart';

class AuthServicesImpl implements AuthServices {
  final AuthRepository _authRepository;

  AuthServicesImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<UserCredential> auth() => _authRepository.auth();

  @override
  Future<void> logout() => _authRepository.logout();
}
