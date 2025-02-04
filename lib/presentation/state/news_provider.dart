import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galleria/data/datasources/local/news_local_data_source.dart';
import 'package:galleria/data/datasources/remote/news_remote_data_source.dart';
import 'package:galleria/data/repositories/news_repository_impl.dart';
import 'package:galleria/domain/entities/news.dart';
import 'package:galleria/domain/repositories/news_repository.dart';
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

/// Fetches top headlines using the repository
final newsProvider = FutureProvider<News>((ref) async {
  final repository = await ref.watch(newsRepositoryProvider.future);
  return repository.getTopHeadlines();
});
