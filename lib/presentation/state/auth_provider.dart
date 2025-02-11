import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/data/datasources/auth_service.dart';
import 'package:galleria/data/repositories/auth_repository_impl.dart';
import 'package:galleria/domain/repositories/auth_repository.dart';
import 'package:galleria/domain/usecases/auth/get_current_user_use_case.dart';
import 'package:galleria/domain/usecases/auth/register_use_case.dart';
import 'package:galleria/domain/usecases/auth/sign_out_use_case.dart';
import 'package:galleria/domain/usecases/auth/sing_in_use_case.dart';

/// Provides the auth repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(authService: AuthService());
});

/// Provides Sign In use case
final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignInUseCase(authRepository);
});

/// Provides Register use case
final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return RegisterUseCase(authRepository);
});

/// Provides Sign Out Use Case
final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignOutUseCase(authRepository);
});

/// Provides Get Current User Use Case
final getCurrentUserUseCase = Provider<GetCurrentUserUseCase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return GetCurrentUserUseCase(authRepository);
});


