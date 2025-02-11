import 'package:firebase_auth/firebase_auth.dart';
import 'package:galleria/data/datasources/auth_service.dart';
import 'package:galleria/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  User? getCurrentUser() {
    return authService.currentUser;
  }

  @override
  Future<User?> registerWithEmail(String email, String password) {
    return authService.registerWithEmail(email, password);
  }

  @override
  Future<User?> signInWithEmail(String email, String password) {
    return authService.signInWithEmail(email, password);
  }

  @override
  Future<void> signOut() {
    return authService.signOut();
  }

}