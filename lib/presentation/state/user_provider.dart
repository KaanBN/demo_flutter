import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user.dart';

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl(UserRemoteDataSource());
});

final userProvider = FutureProvider.family<User, String>((ref, id) async {
  final repository = ref.read(userRepositoryProvider);
  ref.keepAlive();
  return repository.getUser(id);
});