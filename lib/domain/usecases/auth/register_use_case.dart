import 'package:firebase_auth/firebase_auth.dart';
import 'package:galleria/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<User?> call(String email, String password) {
    return _authRepository.signInWithEmail(email, password);
  }
}