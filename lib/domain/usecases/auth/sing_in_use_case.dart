import 'package:firebase_auth/firebase_auth.dart';
import 'package:galleria/domain/repositories/auth_repository.dart';

class SignInUseCase{
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<User?> call(String email, String password) {
    return _authRepository.signInWithEmail(email, password);
  }
}