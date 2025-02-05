import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/domain/entities/news.dart';
import 'package:galleria/domain/usecases/get_news_use_case.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../domain/repositories/news_repository.dart';
import '../../data/datasources/remote/news_remote_data_source.dart';
import '../../data/datasources/local/news_local_data_source.dart';
import '../../core/network/api_client.dart';

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
  final repository = ref.read(newsRepositoryProvider).value!;
  return GetNewsUseCase(repository);
});

/// Fetches top headlines using the use case
final newsProvider = FutureProvider<News>((ref) async {
  final getNewsUseCase = ref.read(getNewsUseCaseProvider);
  return getNewsUseCase();
});
