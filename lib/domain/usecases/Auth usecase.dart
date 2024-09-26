// domain/usecases/auth_usecase.dart

import 'package:notes_app/domain/repositories/auth%20repository.dart';

class AuthUseCase {
  final Authrepo repository;

  AuthUseCase(this.repository);

  Future<bool> signIn(String email, String password) {
    return repository.signIn(email, password);
  }

  Future<bool> register(String email, String password) {
    return repository.register(email, password);
  }
}
