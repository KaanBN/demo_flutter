import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  Future<User?> login(String email, String password) async {
    return await authService.login(email, password);
  }

  @override
  Future<User?> register(String email, String password) async {
    return await authService.register(email, password);
  }

  @override
  Future<void> logout() async {
    await authService.logout();
  }

  @override
  User? getCurrentUser() {
    return authService.getCurrentUser();
  }

  @override
  Future<String?> getIdToken() async {
    return await authService.getIdToken();
  }
}
