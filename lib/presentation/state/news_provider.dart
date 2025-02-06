import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/core/network/api_client.dart';
import 'package:galleria/data/datasources/local/news_local_data_source.dart';
import 'package:galleria/data/datasources/remote/news_remote_data_source.dart';
import 'package:galleria/data/repositories/news_repository_impl.dart';
import 'package:galleria/domain/entities/article.dart';
import 'package:galleria/domain/repositories/news_repository.dart';
import 'package:galleria/domain/usecases/get_news_use_case.dart';
import 'package:galleria/domain/usecases/save_news_use_case.dart';


/// Provides the local database instance
final newsLocalDataSourceProvider = FutureProvider<NewsLocalDataSource>((ref) async {
  return await NewsLocalDataSource.create();
});

/// Provides the remote data source
final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSource(apiClient: ApiClient());
});

/// Provides the `NewsRepositoryImpl` instance
final newsRepositoryProvider = FutureProvider<NewsRepository>((ref) async {
  final remoteDataSource = ref.read(newsRemoteDataSourceProvider);
  final localDataSource = await ref.watch(newsLocalDataSourceProvider.future);
  return NewsRepositoryImpl(remoteDataSource: remoteDataSource, localDataSource: localDataSource);
});

/// Provides the `GetNewsUseCase` instance
final getNewsUseCaseProvider = Provider<GetNewsUseCase>((ref) {
  final repository = ref.watch(newsRepositoryProvider).maybeWhen(
    data: (repo) => repo,
    orElse: () => null,
  );

  if (repository == null) {
    throw Exception("Repository is still loading...");
  }

  return GetNewsUseCase(repository);
});

/// Provides the `SaveNewsUseCase` instance
final saveNewsUseCaseProvider = Provider<SaveNewsUseCase>((ref) {
  final repository = ref.read(newsRepositoryProvider).value!;
  return SaveNewsUseCase(repository);
});

/// Fetches top headlines using the use case
final newsProvider = FutureProvider<List<Article>>((ref) async {
  final getNewsUseCase = ref.watch(getNewsUseCaseProvider);
  return getNewsUseCase();
});